
#include "Placer.h"
#include "spdlog/spdlog.h"
#define NUM_THREADS 8

Placer::Placer(PnRDB::hierNode& node, string opath, int effort, PnRDB::Drc_info& drcInfo, const PlacerHyperparameters& hyper_in) : hyper(hyper_in) {
  //cout<<"Constructor placer"<<endl;
  //this->node=input_node;
  //this->designData=design(input_node);
  //cout<<"Complete construction"<<endl;
  //this->designData.PrintDesign();
  //PlacementMixAP(node, opath, effort);
  //PlacementMixSA(node, opath, effort);
  PlacementRegular(node, opath, effort, drcInfo);
}

Placer::Placer(std::vector<PnRDB::hierNode>& nodeVec, string opath, int effort, PnRDB::Drc_info& drcInfo, const PlacerHyperparameters& hyper_in) : hyper(hyper_in) {
  PlacementRegularAspectRatio_ILP(nodeVec, opath, effort, drcInfo);
  //PlacementRegularAspectRatio(nodeVec, opath, effort, drcInfo);
  //PlacementMixSAAspectRatio(nodeVec, opath, effort);
  //PlacementMixAPAspectRatio(nodeVec, opath, effort);
}

//PnRDB::hierNode Placer::CheckoutHierNode() {
//  return this->node;
//}

bool Placer::GenerateValidSolution(design& mydesign, SeqPair& curr_sp, ConstGraph& curr_sol, int mode) {
// Mode 0: graph bias; Mode 1: graph bias + net margin; Others: no bias/margin
  bool valid=false;
  int extCount=0;
  while( !valid ) {
    //cout<<"extCount "<<extCount<<endl;
    // 1. Check feasible sequence pair and perturbate seqeucen pair
    int intCount=0;
    bool spCheck;
    while( (spCheck=curr_sp.FastInitialScan(mydesign)) && intCount<hyper.COUNT_LIMIT ) {
      curr_sp.PerturbationNew(mydesign);
      //cout<<"intCount "<<intCount<<endl;
      intCount++;
    }
    // If no feasible sequence pair, break out
    if (spCheck) { 
      //cout<<"Placer-Warning: try "<<hyper.COUNT_LIMIT <<" perturbtions, but fail in generating feasible sequence pair..."<<endl;
      //cout<<"Placer-Warning: use one solution without constraints instead!"<<endl;
      //ConstGraph infea_sol(mydesign, curr_sp, mode);
      //infea_sol.AddLargePenalty(); // ensure this infeasible soluton has huge cost
      //curr_sol=infea_sol;
      return false; 
    }
    //curr_sp.PrintSeqPair();
    // 2. Generate constraint graphs
    ConstGraph try_sol(mydesign, curr_sp, mode);
    valid=try_sol.ConstraintGraph(mydesign, curr_sp);
    //cout<<"Valid ? "<<valid<<endl;
    //try_sol.CalculateCost(mydesign, curr_sp);
    //cout<<"Check "<<try_sol.FastInitialScan()<<endl;
    if (valid) {
      // If construct graphs sucessfully
      if( try_sol.FastInitialScan() ) { // If violation found
        if (extCount>=hyper.COUNT_LIMIT) { // If too many iteratons
          //cout<<"Placer-Warning: try "<<hyper.COUNT_LIMIT <<" perturbtions, but fail in generating feasible solution without violations..."<<endl;
          //cout<<"Placer-Warning: use one solution with violations instead!"<<endl;
          curr_sol=try_sol;
          return false;
        } else {
          curr_sp.PerturbationNew(mydesign); valid=false;
        }
      } else { // If no violation
        curr_sol=try_sol; return true;
      }
    } else {
      // If fail in construction
      if (extCount>=hyper.COUNT_LIMIT) { // If too many iteratons
        //cout<<"Placer-Warning: try "<<hyper.COUNT_LIMIT <<" perturbtions, but fail in generating feasible constraint graphs..."<<endl;
        //cout<<"Placer-Warning: use one solution with partial constraints instead!"<<endl;
        try_sol.AddLargePenalty(); // ensure this infeasible soluton has huge cost
        curr_sol=try_sol;
        return false;
      } else {
        curr_sp.PerturbationNew(mydesign); valid=false;
      }
    }
    extCount++;
  }
  return false;
}


void Placer::ThreadFunc(Thread_data* MT) {
   MT->thread_trial_sp.PerturbationNew(MT->thread_designData);
   MT->thread_succeed=GenerateValidSolution(MT->thread_designData, MT->thread_trial_sp, MT->thread_trial_sol, MT->thread_mode);
   if (MT->thread_succeed) {
     MT->thread_trial_cost=MT->thread_trial_sol.CalculateCost(MT->thread_designData, MT->thread_trial_sp);
   }
};

void Placer::PlacementRegular(PnRDB::hierNode& node, string opath, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementRegular");

  logger->debug("Placer-Info: place {0}",node.name);
  #ifdef RFLAG
  logger->debug("Placer-Info: run in random mode...");  
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  logger->debug("Placer-Info: run in normal mode..."); 
  srand(0);
  #endif
  int mode=0;
  // Read design netlist and constraints
  //design designData(bfile.c_str(), nfile.c_str(), cfile.c_str());
  design designData(node);
  designData.PrintDesign();
  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData);
  curr_sp.PrintSeqPair();
  ConstGraph curr_sol;
  PlacementCore(designData, curr_sp, curr_sol, mode, effort);
  curr_sol.WritePlacement(designData, curr_sp, opath+node.name+".pl");
  curr_sol.PlotPlacement(designData, curr_sp, opath+node.name+".plt");
  curr_sol.UpdateHierNode(designData, curr_sp, node, drcInfo);
}


void Placer::PlacementMixSA(PnRDB::hierNode& node, string opath, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementMixSA");

  logger->debug("Placer-Info: place {0}",node.name);
  #ifdef RFLAG
  logger->debug("Placer-Info: run in random mode...");
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  logger->debug("Placer-Info: run in normal mode...");
  srand(0);
  #endif
  int mode=0;
  // Read design netlist and constraints
  //design designData(bfile.c_str(), nfile.c_str(), cfile.c_str());
  design designData_full(node);
  designData_full.PrintDesign();

  // Reduced design
  design designData(designData_full, 1);
  designData.PrintDesign();

  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData);
  //curr_sp.PrintSeqPair();
 
  ConstGraph curr_sol;
  PlacementCore(designData, curr_sp, curr_sol, mode, effort);
  curr_sol.WritePlacement(designData, curr_sp, opath+node.name+"_reduced.pl");
  curr_sol.PlotPlacement(designData, curr_sp, opath+node.name+"_reduced.plt");

  // Full design
  SeqPair curr_sp_full( designData_full, designData, curr_sp  );
  //curr_sp_full.PrintSeqPair();

  ConstGraph curr_sol_full;
  PlacementCore(designData_full, curr_sp_full, curr_sol_full, mode, effort);
  curr_sol_full.WritePlacement(designData_full, curr_sp_full, opath+node.name+".pl");
  curr_sol_full.PlotPlacement(designData_full, curr_sp_full, opath+node.name+".plt");
  //cout<<"Test: before update node"<<endl;
  curr_sol_full.UpdateHierNode(designData_full, curr_sp_full, node, drcInfo);
  //cout<<"Test:: after update node"<<endl;
  //curr_sol.WritePlacement(designData, curr_sp, ofile.c_str());
  //curr_sol.PlotPlacement(designData, curr_sp, pfile.c_str());
}

void Placer::PlacementMixAP(PnRDB::hierNode& node, string opath, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementMixAP");

  logger->debug("Placer-Info: place {0}",node.name);
  #ifdef RFLAG
  logger->debug("Placer-Info: run in random mode...");
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  logger->debug("Placer-Info: run in normal mode...");
  srand(0);
  #endif
  //int mode=1;
  logger->debug("Placer-Info: start mixed-size placement - phase I SA");
  // Read design netlist and constraints
  //design designData(bfile.c_str(), nfile.c_str(), cfile.c_str());
  design designData_full(node);
  designData_full.PrintDesign();

  // Reduced design
  design designData(designData_full, 1);
  designData.PrintDesign();

  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData);
  //curr_sp.PrintSeqPair();
 
  ConstGraph curr_sol;
  PlacementCore(designData, curr_sp, curr_sol, 1, effort);
  curr_sol.WritePlacement(designData, curr_sp, opath+node.name+"_reduced.pl");
  curr_sol.PlotPlacement(designData, curr_sp, opath+node.name+"_reduced.plt");
  curr_sol.UpdateDesignHierNode4AP(designData_full, designData, curr_sp, node);
  logger->debug("Placer-Info: complete mixed-size placement - phase I SA");
  logger->debug("Placer-Info: start mixed-size placement - phase II AP");
  //if(node.isTop) {return;}
  Aplace AP(node, designData_full, opath);
  ConstGraph new_sol(designData_full, AP, 0, 1);
  logger->debug("Initial CG after AP");
  new_sol.PrintConstGraph();
  if(new_sol.ConstraintGraphAP(designData_full, AP)) {
    logger->debug("Placer-Info: sucessfully construct constraint graph");
  } else {
    logger->debug("Placer-Error: fail to construct constraint graph");
  }
  if(!new_sol.FastInitialScan()) {
    logger->debug("Placer-Info: no violation in constraint graph");
  } else {
    logger->debug("Placer-Error: violation found in constraint graph");
  }
  logger->debug("Updated CG after constraint");
  new_sol.PrintConstGraph(); 
  logger->debug("Placer-Info: complete mixed-size placement - phase II AP");

  new_sol.updateTerminalCenterAP(designData_full, AP);
  new_sol.WritePlacementAP(designData_full, AP, opath+node.name+".pl");
  new_sol.PlotPlacementAP(designData_full, AP, opath+node.name+".plt");
  new_sol.UpdateHierNodeAP(designData_full, AP, node, drcInfo);
  //AP.PrintAplace();
  /*
  return;

  mode=0;
  // Full design
  SeqPair curr_sp_full( designData_full, designData, curr_sp  );
  //curr_sp_full.PrintSeqPair();

  ConstGraph curr_sol_full;
  PlacementCore(designData_full, curr_sp_full, curr_sol_full, mode);
  curr_sol_full.WritePlacement(designData_full, curr_sp_full, "./"+node.name+".pl");
  curr_sol_full.PlotPlacement(designData_full, curr_sp_full, "./"+node.name+".plt");
  //cout<<"Test: before update node"<<endl;
  curr_sol_full.UpdateHierNode(designData_full, curr_sp_full, node);
  //cout<<"Test:: after update node"<<endl;
  //curr_sol.WritePlacement(designData, curr_sp, ofile.c_str());
  //curr_sol.PlotPlacement(designData, curr_sp, pfile.c_str());
  */
}

void Placer::PlacementCore(design& designData, SeqPair& curr_sp, ConstGraph& curr_sol, int mode, int effort) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementCore");

// Mode 0: graph bias; Mode 1: graph bias + net margin; Others: no bias/margin
  //cout<<"PlacementCore\n";
  curr_sp.PrintSeqPair();
  GenerateValidSolution(designData, curr_sp, curr_sol, mode);
  //curr_sol.PrintConstGraph();
  double curr_cost=curr_sol.CalculateCost(designData, curr_sp);
  logger->debug("Placer-Info: initial cost = {0}",curr_cost);
  logger->debug("Placer-Info: status ");
  // Aimulate annealing
  double T=hyper.T_INT;
  double delta_cost;
  int update_index =0;
  int T_index=0;
  float per = 0.1;
  float total_update_number = log(hyper.T_MIN/hyper.T_INT)/log(hyper.ALPHA);
  int updateThrd=100;
  int fail_number = 0;
  while(T>hyper.T_MIN && fail_number < 10) {
    int i=1;
    int MAX_Iter=1;
    if(effort==0) { MAX_Iter=1;
    } else if (effort==1) { MAX_Iter=4;
    } else {MAX_Iter=8;}
    while(i<=MAX_Iter) {
      double trial_cost; 
      #ifdef MTMODE
      int id; int good_idx=-1;
      Thread_data td[NUM_THREADS];
      std::vector<std::thread> threads;
      // Create threads
      for( id = 0; id < NUM_THREADS; id++ ) {
        //cout <<"Placer-Info: creating thread, " << id << endl;
        td[id].thread_id = id;
        td[id].thread_designData=designData;
        td[id].thread_trial_sp=curr_sp;
        td[id].thread_mode=mode;
        threads.push_back(std::thread(&Placer::ThreadFunc, this, td+id) );
      }
      // Join threads
      for( id = 0; id < NUM_THREADS; id++ ) {
        threads.at(id).join();
        //cout<<"Placer-Info: joining thread, "<<id<<endl;
      }

      for( id = 0; id < NUM_THREADS; id++ ) {
        if( td[id].thread_succeed) {trial_cost=td[id].thread_trial_cost; good_idx=id; break;}
      }
      for( ; id < NUM_THREADS; id++ ) {
        if( td[id].thread_succeed && td[id].thread_trial_cost<trial_cost) {
          trial_cost=td[id].thread_trial_cost; good_idx=id;
        }
      }
      if(good_idx!=-1) {
        delta_cost=trial_cost-curr_cost;
        bool Smark=false;
        if(delta_cost<0) {mark=true;
        } else {
          double r = (double)rand() / RAND_MAX;
          if( r < exp( (-1.0 * delta_cost)/T ) ) {Smark=true;}
        }
        if(Smark) {
          curr_cost=trial_cost;
          curr_sp=td[good_idx].thread_trial_sp;
          curr_sol=td[good_idx].thread_trial_sol;
        }
      }
      #endif

      #ifndef MTMODE
      //cout<<"T "<<T<<" i "<<i<<endl;
      // Trival moves
      SeqPair trial_sp(curr_sp);  
      //cout<<"before per"<<endl; trial_sp.PrintSeqPair();
      trial_sp.PerturbationNew(designData);
      //cout<<"after per"<<endl; trial_sp.PrintSeqPair();
      ConstGraph trial_sol;
      if(GenerateValidSolution(designData, trial_sp, trial_sol, mode)) {
        fail_number=0;
        trial_cost=trial_sol.CalculateCost(designData, trial_sp);

        delta_cost=trial_cost-curr_cost;
        bool Smark=false;
        if(delta_cost<0) {Smark=true;
        } else {
          double r = (double)rand() / RAND_MAX;
          if( r < exp( (-1.0 * delta_cost)/T ) ) {Smark=true;}
        }
        if(Smark) {
          curr_cost=trial_cost;
          curr_sp=trial_sp;
          curr_sol=trial_sol;
        }
      }else{
        fail_number++;
      }
      #endif

      i++;
      update_index++;
      //cout<<update_index<<endl;
      if(update_index==updateThrd){
        curr_sol.Update_parameters(designData, curr_sp);
        curr_cost = curr_sol.CalculateCost(designData, curr_sp);
      }
    }
    T_index ++;
    if(total_update_number*per<T_index){
      logger->debug(".....{0}",per*100);
      per=per+0.1;
    }
    T*=hyper.ALPHA;
    //cout<<T<<endl;
  }
  // Write out placement results
  logger->debug("Placer-Info: optimal cost = {0}",curr_cost);
  //curr_sol.PrintConstGraph();
  curr_sp.PrintSeqPair();
  curr_sol.updateTerminalCenter(designData, curr_sp);
}

std::map<double, SeqPair> Placer::PlacementCoreAspectRatio(design& designData, SeqPair& curr_sp, ConstGraph& curr_sol, int mode, int nodeSize, int effort) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementCoreAspectRatio");

// Mode 0: graph bias; Mode 1: graph bias + net margin; Others: no bias/margin
  //cout<<"PlacementCore\n";
  std::map<double, SeqPair> oData;
  curr_sp.PrintSeqPair();
  GenerateValidSolution(designData, curr_sp, curr_sol, mode);
  //curr_sol.PrintConstGraph();
  double curr_cost=curr_sol.CalculateCost(designData, curr_sp);
  logger->debug("Placer-Info: initial cost = ",curr_cost);
  logger->debug("Placer-Info: status ");
  // Aimulate annealing
  double T=hyper.T_INT;
  double delta_cost;
  int update_index =0;
  int T_index=0;
  float per = 0.1;
  int updateThrd=100;
  int fail_number=0;
  float total_update_number = log(hyper.T_MIN/hyper.T_INT)/log(hyper.ALPHA);
  while(T>hyper.T_MIN && fail_number < 10) {
    int i=1;
    int MAX_Iter=1;
    if(effort==0) { MAX_Iter=1;
    } else if (effort==1) { MAX_Iter=4;
    } else {MAX_Iter=8;}
    while(i<=MAX_Iter) {
      #ifdef MTMODE
      double trial_cost; 
      int id; int good_idx=-1;
      Thread_data td[NUM_THREADS];
      std::vector<std::thread> threads;
      // Create threads
      for( id = 0; id < NUM_THREADS; id++ ) {
        //cout <<"Placer-Info: creating thread, " << id << endl;
        td[id].thread_id = id;
        td[id].thread_designData=designData;
        td[id].thread_trial_sp=curr_sp;
        td[id].thread_mode=mode;
        threads.push_back(std::thread(&Placer::ThreadFunc, this, td+id) );
      }
      // Join threads
      for( id = 0; id < NUM_THREADS; id++ ) {
        threads.at(id).join();
        //cout<<"Placer-Info: joining thread, "<<id<<endl;
      }

      for( id = 0; id < NUM_THREADS; id++ ) {
        if( td[id].thread_succeed) {trial_cost=td[id].thread_trial_cost; good_idx=id; break;}
      }
      for( ; id < NUM_THREADS; id++ ) {
        if( td[id].thread_succeed && td[id].thread_trial_cost<trial_cost) {
          trial_cost=td[id].thread_trial_cost; good_idx=id;
        }
      }
      if(good_idx!=-1) {
        bool Smark=false;
        delta_cost=trial_cost-curr_cost;
        if(delta_cost<0) { Smark=true;
        } else {
          double r = (double)rand() / RAND_MAX;
          if( r < exp( (-1.0 * delta_cost)/T ) ) {Smark=true;}
        }
        if(Smark) {
          logger->debug("cost: {0}",trial_cost);
          curr_cost=trial_cost;
          curr_sp=td[good_idx].thread_trial_sp;
          curr_sol=td[good_idx].thread_trial_sol;
          if(update_index>updateThrd) {
            //std::cout<<"Insert\n";
            oData[curr_cost]=curr_sp;
            ReshapeSeqPairMap(oData, nodeSize);
          }
        }
      }
      #endif

      #ifndef MTMODE
      //cout<<"T "<<T<<" i "<<i<<endl;
      // Trival moves
      SeqPair trial_sp(curr_sp);  
      //cout<<"before per"<<endl; trial_sp.PrintSeqPair();
      trial_sp.PerturbationNew(designData);
      //cout<<"after per"<<endl; trial_sp.PrintSeqPair();
      ConstGraph trial_sol;
      if(GenerateValidSolution(designData, trial_sp, trial_sol, mode)) {
        fail_number = 0;
        double trial_cost=trial_sol.CalculateCost(designData, trial_sp);
        bool Smark=false;
        delta_cost=trial_cost-curr_cost;
        if(delta_cost<0) {Smark=true;
        } else {
          double r = (double)rand() / RAND_MAX;
          if( r < exp( (-1.0 * delta_cost)/T ) ) {Smark=true;}
        }
        if(Smark) {
          logger->debug("cost: {0}",trial_cost);
          curr_cost=trial_cost;
          curr_sp=trial_sp;
          curr_sol=trial_sol;
          if(update_index>updateThrd) {
            oData[curr_cost]=curr_sp;
            ReshapeSeqPairMap(oData, nodeSize);
          }
        }
      }else{
        fail_number++;
      }
      #endif

      i++;
      update_index++;
      //cout<<update_index<<endl;
      if(update_index==updateThrd){
        curr_sol.Update_parameters(designData, curr_sp);
        curr_cost = curr_sol.CalculateCost(designData, curr_sp);
        oData[curr_cost]=curr_sp;
        ReshapeSeqPairMap(oData, nodeSize);
      }
    }
    T_index ++;
    if(total_update_number*per<T_index){
      logger->debug("...{0}%",per*100);
      per=per+0.1;
    }
    T*=hyper.ALPHA;
    //cout<<T<<endl;
  }
  // Write out placement results
  logger->debug("Placer-Info: optimal cost = {0}",curr_cost);
  oData[curr_cost]=curr_sp;
  ReshapeSeqPairMap(oData,nodeSize);
  //cout<<endl<<"Placer-Info: optimal cost = "<<curr_cost<<endl;
  //curr_sol.PrintConstGraph();
  curr_sp.PrintSeqPair();
  //curr_sol.updateTerminalCenter(designData, curr_sp);
  return oData;
}

std::map<double, std::pair<SeqPair, ILP_solver>> Placer::PlacementCoreAspectRatio_ILP(design& designData, SeqPair& curr_sp, ILP_solver& curr_sol, int mode,
                                                                                      int nodeSize, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementCoreAspectRatio_ILP");

  // Mode 0: graph bias; Mode 1: graph bias + net margin; Others: no bias/margin
  // cout<<"PlacementCore\n";
  std::map<double, std::pair<SeqPair, ILP_solver>> oData;
  curr_sp.PrintSeqPair();
  double curr_cost = 0;
  int trial_count = 0;
  while ((curr_cost = curr_sol.GenerateValidSolution(designData, curr_sp, drcInfo)) < 0) {
    curr_sp.PerturbationNew(designData);
    trial_count++;
    if (trial_count > 100) {
      logger->warn("please check constraint");
      curr_cost = __DBL_MAX__;
      break;
    }
  }
  oData[curr_cost] = std::make_pair(curr_sp, curr_sol);
  ReshapeSeqPairMap(oData, nodeSize);
  //cout << "Placer-Info: initial cost = " << curr_cost << endl;

  //cout << "Placer-Info: status ";
  //cout.flush();
  // Aimulate annealing
  double T = hyper.T_INT;
  double delta_cost;
  int update_index = 0;
  int T_index = 0;
  float per = 0.1;
  //int updateThrd = 100;
  float total_update_number = log(hyper.T_MIN / hyper.T_INT) / log(hyper.ALPHA);
  bool exhausted(false);
  while (T > hyper.T_MIN) {
    int i = 1;
    int MAX_Iter = 1;
    if (effort == 0) {
      MAX_Iter = 1;
    } else if (effort == 1) {
      MAX_Iter = 4;
    } else {
      MAX_Iter = 8;
    }
    while (i <= MAX_Iter) {
#ifdef MTMODE
      double trial_cost;
      int id;
      int good_idx = -1;
      Thread_data td[NUM_THREADS];
      std::vector<std::thread> threads;
      // Create threads
      for (id = 0; id < NUM_THREADS; id++) {
        // cout <<"Placer-Info: creating thread, " << id << endl;
        td[id].thread_id = id;
        td[id].thread_designData = designData;
        td[id].thread_trial_sp = curr_sp;
        td[id].thread_mode = mode;
        threads.push_back(std::thread(&Placer::ThreadFunc, this, td + id));
      }
      // Join threads
      for (id = 0; id < NUM_THREADS; id++) {
        threads.at(id).join();
        // cout<<"Placer-Info: joining thread, "<<id<<endl;
      }

      for (id = 0; id < NUM_THREADS; id++) {
        if (td[id].thread_succeed) {
          trial_cost = td[id].thread_trial_cost;
          good_idx = id;
          break;
        }
      }
      for (; id < NUM_THREADS; id++) {
        if (td[id].thread_succeed && td[id].thread_trial_cost < trial_cost) {
          trial_cost = td[id].thread_trial_cost;
          good_idx = id;
        }
      }
      if (good_idx != -1) {
        bool Smark = false;
        delta_cost = trial_cost - curr_cost;
        if (delta_cost < 0) {
          Smark = true;
        } else {
          double r = (double)rand() / RAND_MAX;
          if (r < exp((-1.0 * delta_cost) / T)) {
            Smark = true;
          }
        }
        if (Smark) {
          std::cout << "cost: " << trial_cost << std::endl;
          curr_cost = trial_cost;
          curr_sp = td[good_idx].thread_trial_sp;
          curr_sol = td[good_idx].thread_trial_sol;
          if (update_index > updateThrd) {
            // std::cout<<"Insert\n";
            oData[curr_cost] = curr_sp;
            ReshapeSeqPairMap(oData, nodeSize);
          }
        }
      }
#endif

#ifndef MTMODE
      // cout<<"T "<<T<<" i "<<i<<endl;
      // Trival moves
      SeqPair trial_sp(curr_sp);
      // cout<<"before per"<<endl; trial_sp.PrintSeqPair();
      trial_sp.PerturbationNew(designData);
      // cout<<"after per"<<endl; trial_sp.PrintSeqPair();
      ILP_solver trial_sol(designData);
      double trial_cost = trial_sol.GenerateValidSolution(designData, trial_sp, drcInfo);
      if (trial_cost >= 0) {
        bool Smark = false;
        delta_cost = trial_cost - curr_cost;
        if (delta_cost <= 0) {
          Smark = true;
        } else {
          if (trial_sp.Enumerate()) {
            if (!oData.empty() && 
                (oData.rbegin()->first > trial_cost 
                  || static_cast<int>(oData.size()) < nodeSize)) {
              Smark = true;
            }
          } else {
            double r = (double)rand() / RAND_MAX;
            if (r < exp((-1.0 * delta_cost) / T)) {
              Smark = true;
            }
          }
        }
        if (Smark) {
          //std::cout << "cost: " << trial_cost << std::endl;
          curr_cost = trial_cost;
          curr_sp = trial_sp;
          curr_sol = trial_sol;
          // if(update_index>updateThrd) {
          //std::cout << "Insert\n";
          oData[curr_cost] = std::make_pair(curr_sp, curr_sol);
          ReshapeSeqPairMap(oData, nodeSize);
          //}
        }
      }

      if (trial_sp.Enumerate() && static_cast<int>(oData.size()) > nodeSize) {
        oData.erase(std::prev(oData.end()));
      }

#endif

      i++;
      update_index++;
      // cout<<update_index<<endl;
      /**
      if(update_index==updateThrd){
        curr_sol.Update_parameters(designData, curr_sp);
        curr_cost = curr_sol.CalculateCost(designData, curr_sp);
        std::cout<<"updated cost: "<<curr_cost<<std::endl;
        oData[curr_cost]=curr_sp;
        ReshapeSeqPairMap(oData, nodeSize);
      }
      **/
      if (trial_sp.EnumExhausted()) {
        logger->info("Exhausted all permutations of sequence pairs");
        exhausted = true;
        break;
      }
    }
    T_index++;
    if (total_update_number * per < T_index) {
      logger->debug( "..... {0} %" , per * 100);
      //cout.flush();
      per = per + 0.1;
    }
    if (exhausted) break;
    T *= hyper.ALPHA;
    // cout<<T<<endl;
  }
  // Write out placement results
  //cout << endl << "Placer-Info: optimal cost = " << curr_cost << endl;
  // curr_sol.PrintConstGraph();
  curr_sp.PrintSeqPair();
  // curr_sol.updateTerminalCenter(designData, curr_sp);
  return oData;
}

void Placer::ReshapeSeqPairMap(std::map<double, SeqPair>& spMap, int nodeSize) {
  int idx=0;
  std::map<double, SeqPair>::iterator it;
  for(it=spMap.begin(); it!=spMap.end(); ++it, ++idx) {
    if(idx==nodeSize) {break;}
  }
  if(it!=spMap.end()) {spMap.erase(it, spMap.end());}
}

void Placer::ReshapeSeqPairMap(std::map<double, std::pair<SeqPair, ILP_solver>>& Map, int nodeSize) {
  int idx=0;
  std::map<double, std::pair<SeqPair, ILP_solver>>::iterator it;
  for(it=Map.begin(); it!=Map.end(); ++it, ++idx) {
    if(idx==nodeSize) {break;}
  }
  if(it!=Map.end()) {Map.erase(it, Map.end());}
}

void Placer::PlacementRegularAspectRatio_ILP(std::vector<PnRDB::hierNode>& nodeVec, string opath, int effort, PnRDB::Drc_info& drcInfo){
  int nodeSize=nodeVec.size();
  //cout<<"Placer-Info: place "<<nodeVec.back().name<<" in aspect ratio mode "<<endl;
  #ifdef RFLAG
  //cout<<"Placer-Info: run in random mode..."<<endl;
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  //cout<<"Placer-Info: run in normal mode..."<<endl;
  srand(0);
  #endif
  int mode=0;
  // Read design netlist and constraints
  design designData(nodeVec.back());
  designData.PrintDesign();
  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData, size_t(1. * log(hyper.T_MIN/hyper.T_INT)/log(hyper.ALPHA)));
  curr_sp.PrintSeqPair();
  ILP_solver curr_sol(designData);
  std::map<double, std::pair<SeqPair, ILP_solver>> spVec=PlacementCoreAspectRatio_ILP(designData, curr_sp, curr_sol, mode, nodeSize, effort, drcInfo);
  //curr_sol.updateTerminalCenter(designData, curr_sp);
  //curr_sol.PlotPlacement(designData, curr_sp, opath+nodeVec.back().name+"opt.plt");
  if((int)spVec.size()<nodeSize) {
    nodeSize=spVec.size();
    nodeVec.resize(nodeSize);
  }
  int idx=0;
  for(std::map<double, std::pair<SeqPair, ILP_solver>>::iterator it=spVec.begin(); it!=spVec.end() and idx<nodeSize; ++it, ++idx) {
    //std::cout<<"Placer-Info: cost "<<it->first<<std::endl;
    //ConstGraph vec_sol(designData, it->second, mode);
    //vec_sol.ConstraintGraph(designData, it->second);
    //vec_sol.FastInitialScan();
    //vec_sol.updateTerminalCenter(designData, it->second);
    //std::cout<<"wbxu check design\n";
    //designData.PrintDesign();
    //it->second.PrintSeqPair();
    //std::cout<<"write design "<<idx<<std::endl;
    it->second.second.updateTerminalCenter(designData, it->second.first);
    it->second.second.WritePlacement(designData, it->second.first, opath + nodeVec.back().name + "_" + std::to_string(idx) + ".pl");
    it->second.second.PlotPlacement(designData, it->second.first, opath + nodeVec.back().name + "_" + std::to_string(idx) + ".plt");
    it->second.second.UpdateHierNode(designData, it->second.first, nodeVec[idx], drcInfo);
  }
}

void Placer::PlacementRegularAspectRatio(std::vector<PnRDB::hierNode>& nodeVec, string opath, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementRegularAspectRatio");

  int nodeSize=nodeVec.size();
  logger->debug("Placer-Info: place {0} in aspect ratio mode",nodeVec.back().name);
  #ifdef RFLAG
  logger->debug("Placer-Info: run in random mode...");
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  logger->debug("Placer-Info: run in normal mode...");
  srand(0);
  #endif
  int mode=0;
  // Read design netlist and constraints
  design designData(nodeVec.back());
  designData.PrintDesign();
  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData);
  curr_sp.PrintSeqPair();
  ConstGraph curr_sol;
  std::map<double, SeqPair> spVec=PlacementCoreAspectRatio(designData, curr_sp, curr_sol, mode, nodeSize, effort);
  curr_sol.updateTerminalCenter(designData, curr_sp);
  //curr_sol.PlotPlacement(designData, curr_sp, opath+nodeVec.back().name+"opt.plt");
  if((int)spVec.size()<nodeSize) {
    nodeSize=spVec.size();
    nodeVec.resize(nodeSize);
  }
  int idx=0;
  for(std::map<double, SeqPair>::iterator it=spVec.begin(); it!=spVec.end() && idx<nodeSize; ++it, ++idx) {
    //std::cout<<"Placer-Info: cost "<<it->first<<std::endl;
    ConstGraph vec_sol(designData, it->second, mode);
    vec_sol.ConstraintGraph(designData, it->second);
    vec_sol.FastInitialScan();
    vec_sol.updateTerminalCenter(designData, it->second);
    //std::cout<<"wbxu check design\n";
    //designData.PrintDesign();
    //it->second.PrintSeqPair();
    //std::cout<<"write design "<<idx<<std::endl;
    vec_sol.WritePlacement(designData, it->second, opath+nodeVec.back().name+"_"+std::to_string(idx)+".pl");
    vec_sol.PlotPlacement(designData, it->second, opath+nodeVec.back().name+"_"+std::to_string(idx)+".plt");
    vec_sol.UpdateHierNode(designData, it->second, nodeVec[idx], drcInfo);
  }
}

void Placer::PlacementMixSAAspectRatio(std::vector<PnRDB::hierNode>& nodeVec, string opath, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementMixSAAspectRatio");

  int nodeSize=nodeVec.size();
  logger->debug("Placer-Info: place {0} in aspect ratio mode",nodeVec.back().name);
  logger->debug("Placer-Info: initial size {0}",nodeSize);
  #ifdef RFLAG
  logger->debug("Placer-Info: run in random mode...");
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  logger->debug("Placer-Info: run in normal mode...");
  srand(0);
  #endif
  int bias_mode=0;
  // Read design netlist and constraints
  //design designData(bfile.c_str(), nfile.c_str(), cfile.c_str());
  design designData_full(nodeVec.back());
  designData_full.PrintDesign();

  // Reduced design
  design designData(designData_full, 1);
  designData_full.PrintDesign();
  designData.PrintDesign();

  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData);
  //curr_sp.PrintSeqPair();
 
  ConstGraph curr_sol;
  std::map<double, SeqPair> spVec=PlacementCoreAspectRatio(designData, curr_sp, curr_sol, bias_mode, nodeSize, effort);
  curr_sol.updateTerminalCenter(designData, curr_sp);
  //curr_sol.PlotPlacement(designData, curr_sp, opath+nodeVec.back().name+"_reduced.plt");

  if((int)spVec.size()<nodeSize) {
    nodeSize=spVec.size();
    nodeVec.resize(nodeSize);
  }
  logger->debug("Placer-Info: after 1st SA size {0}",spVec.size());
  int idx=0;
  for(std::map<double, SeqPair>::iterator it=spVec.begin(); it!=spVec.end() && idx<nodeSize; ++it, ++idx) {
    logger->debug("Placer-Info: second round SA {0}",idx);
    // Full design
    designData_full.PrintDesign();
    designData.PrintDesign();
    it->second.PrintSeqPair();
    SeqPair curr_sp_full( designData_full, designData, it->second  );
    logger->debug("Placer-Info: second round SA after sp {0}",idx);
    //curr_sp_full.PrintSeqPair();

    ConstGraph curr_sol_full;
    PlacementCore(designData_full, curr_sp_full, curr_sol_full, bias_mode, effort);
    curr_sol_full.WritePlacement(designData_full, curr_sp_full, opath+nodeVec.back().name+"_"+std::to_string(idx)+".pl");
    curr_sol_full.PlotPlacement(designData_full, curr_sp_full, opath+nodeVec.back().name+"_"+std::to_string(idx)+".plt");
    //cout<<"Test: before update node"<<endl;
    curr_sol_full.UpdateHierNode(designData_full, curr_sp_full, nodeVec.at(idx), drcInfo);
    //cout<<"Test:: after update node"<<endl;
  }
}

void Placer::PlacementMixAPAspectRatio(std::vector<PnRDB::hierNode>& nodeVec, string opath, int effort, PnRDB::Drc_info& drcInfo) {

  auto logger = spdlog::default_logger()->clone("placer.Placer.PlacementMixAPAspectRatio");

  int nodeSize=nodeVec.size();
  logger->debug("Placer-Info: place {0}",nodeVec.back().name);
  #ifdef RFLAG
  logger->debug("Placer-Info: run in random mode...");
  srand (time(NULL));
  #endif
  #ifndef RFLAG
  logger->debug("Placer-Info: run in normal mode...");
  srand(0);
  #endif
  int bias_mode=1;
  logger->debug("Placer-Info: start mixed-size placement - phase I SA");
  // Read design netlist and constraints
  //design designData(bfile.c_str(), nfile.c_str(), cfile.c_str());
  design designData_full(nodeVec.back());
  designData_full.PrintDesign();

  // Reduced design
  design designData(designData_full, 1);
  designData_full.PrintDesign();
  designData.PrintDesign();

  // Initialize simulate annealing with initial solution
  SeqPair curr_sp(designData);
  //curr_sp.PrintSeqPair();
 
  ConstGraph curr_sol;
  std::map<double, SeqPair> spVec=PlacementCoreAspectRatio(designData, curr_sp, curr_sol, bias_mode, nodeSize, effort);

  if((int)spVec.size()<nodeSize) {
    nodeSize=spVec.size();
    nodeVec.resize(nodeSize);
  }
  //PlacementCore(designData, curr_sp, curr_sol, 1);
  logger->debug("Placer-Info: complete mixed-size placement - phase I SA");
  logger->debug("Placer-Info: start mixed-size placement - phase II AP");
  int idx=0;
  for(std::map<double, SeqPair>::iterator it=spVec.begin(); it!=spVec.end() && idx<nodeSize; ++it, ++idx) {
    ConstGraph vec_sol(designData, it->second, bias_mode);
    vec_sol.ConstraintGraph(designData, it->second);
    vec_sol.FastInitialScan();
    vec_sol.updateTerminalCenter(designData, it->second);
    vec_sol.PrintConstGraph();
    vec_sol.WritePlacement(designData, it->second, opath+nodeVec.back().name+"_"+std::to_string(idx)+"_reduced.pl");
    vec_sol.PlotPlacement(designData, it->second, opath+nodeVec.back().name+"_"+std::to_string(idx)+"_reduced.plt");
    vec_sol.UpdateDesignHierNode4AP(designData_full, designData, it->second, nodeVec.at(idx));

    Aplace AP(nodeVec.at(idx), designData_full, opath);
    ConstGraph new_sol(designData_full, AP, 0, 1);
    logger->debug("Initial CG after AP");
    new_sol.PrintConstGraph();
    if(new_sol.ConstraintGraphAP(designData_full, AP)) {
      logger->debug("Placer-Info: sucessfully construct constraint graph");
    } else {
      logger->debug("Placer-Error: fail to construct constraint graph");
    }
    if(!new_sol.FastInitialScan()) {
      logger->debug("Placer-Info: no violation in constraint graph");
    } else {
      logger->debug("Placer-Error: violation found in constraint graph");
    }
    logger->debug("Updated CG after constraint");
    new_sol.PrintConstGraph();
    logger->debug("Placer-Info: complete mixed-size placement - phase II AP");

    new_sol.updateTerminalCenterAP(designData_full, AP);
    new_sol.WritePlacementAP(designData_full, AP, opath+nodeVec.back().name+"_"+std::to_string(idx)+".pl");
    new_sol.PlotPlacementAP(designData_full, AP, opath+nodeVec.back().name+"_"+std::to_string(idx)+".plt");
    new_sol.UpdateHierNodeAP(designData_full, AP, nodeVec.at(idx), drcInfo);
  }

}


