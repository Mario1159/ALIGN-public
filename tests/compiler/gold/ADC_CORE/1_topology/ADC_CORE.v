//Verilog block level netlist file for ADC_CORE
//Generated by UMN for ALIGN project 


module ADC_CORE ( clkc, clks, clksb, est_delay, inn, inp, q<0>, q<1>, q<2>, q<3>, q<4>, q<5>, q<6>, q<7>, q<8>, q<9>, qb<0>, qb<1>, qb<2>, qb<3>, qb<4>, qb<5>, qb<6>, qb<7>, qb<8>, qb<9>, vcm, vrefn, vrefp ); 
input clkc, clks, clksb, est_delay, inn, inp, q<0>, q<1>, q<2>, q<3>, q<4>, q<5>, q<6>, q<7>, q<8>, q<9>, qb<0>, qb<1>, qb<2>, qb<3>, qb<4>, qb<5>, qb<6>, qb<7>, qb<8>, qb<9>, vcm, vrefn, vrefp;

SAMPLE_NETWORK xi1 ( .in<9>(q<9>), .in<8>(q<8>), .in<7>(qb<7>), .in<6>(qb<6>), .in<5>(qb<5>), .in<4>(qb<4>), .in<3>(qb<3>), .in<2>(qb<2>), .in<1>(qb<1>), .vcm(vcm), .vrefn(vrefn), .vrefp(vrefp) ); 
SAMPLE_NETWORK xi0 ( .in<9>(qb<9>), .in<8>(qb<8>), .in<7>(q<7>), .in<6>(q<6>), .in<5>(q<5>), .in<4>(q<4>), .in<3>(q<3>), .in<2>(q<2>), .in<1>(q<1>), .vcm(vcm), .vrefn(vrefn), .vrefp(vrefp) ); 
COMPARATOR xi2 ( .clk(clkc), .crossn(net3), .crossp(net4), .intern(net1), .interp(net2), .outm(coutn), .outp(coutp), ._net1(cpinp), ._net0(cpinn) ); 
SAR_LOGIC xi3 ( .clk(clkc), .clksb(clksb), .outn(coutn), .outp(coutp), .q<9>(q<9>), .q<8>(q<8>), .q<7>(q<7>), .q<6>(q<6>), .q<5>(q<5>), .q<4>(q<4>), .q<3>(q<3>), .q<2>(q<2>), .q<1>(q<1>), .qb<9>(qb<9>), .qb<8>(qb<8>), .qb<7>(qb<7>), .qb<6>(qb<6>), .qb<5>(qb<5>), .qb<4>(qb<4>), .qb<3>(qb<3>), .qb<2>(qb<2>), .qb<1>(qb<1>), .q<0>(q<0>), .qb<0>(qb<0>), .s<0>(est_delay), .sb<1>(est) ); 
SAMPLER xi11 ( .clks_boost(clks), .vin(inp), .vout(cpinp) ); 
SAMPLER xi12 ( .clks_boost(clks), .vin(inn), .vout(cpinn) ); 
COUNTER xi13 ( .clksb(clksb), .ctrl(est_delay), .d<1>(estimator<1>), .d<0>(estimator<0>), .in(coutp) ); 

endmodule

module SAMPLE_NETWORK ( in<1>, in<2>, in<3>, in<4>, in<5>, in<6>, in<7>, in<8>, in<9>, vcm, vrefn, vrefp ); 
input in<1>, in<2>, in<3>, in<4>, in<5>, in<6>, in<7>, in<8>, in<9>, vcm, vrefn, vrefp;

DAC_SWITCHES xi2 ( .dac<9>(dac<9>), .dac<8>(dac<8>), .dac<7>(dac<7>), .dac<6>(dac<6>), .dac<5>(dac<5>), .dac<4>(dac<4>), .dac<3>(dac<3>), .dac<2>(dac<2>), .dac<1>(dac<1>), .in<9>(in<9>), .in<8>(in<8>), .in<7>(in<7>), .in<6>(in<6>), .in<5>(in<5>), .in<4>(in<4>), .in<3>(in<3>), .in<2>(in<2>), .in<1>(in<1>), .vcm(vcm), .vrefn(vrefn), .vrefp(vrefp) ); 

endmodule

module DAC_SWITCHES ( dac<1>, dac<2>, dac<3>, dac<4>, dac<5>, dac<6>, dac<7>, dac<8>, dac<9>, in<1>, in<2>, in<3>, in<4>, in<5>, in<6>, in<7>, in<8>, in<9>, vcm, vrefn, vrefp ); 
input dac<1>, dac<2>, dac<3>, dac<4>, dac<5>, dac<6>, dac<7>, dac<8>, dac<9>, in<1>, in<2>, in<3>, in<4>, in<5>, in<6>, in<7>, in<8>, in<9>, vcm, vrefn, vrefp;

INV0_LVT xi5 ( .i(in<5>), .zn(dac<5>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi3 ( .i(in<7>), .zn(dac<7>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi4 ( .i(in<6>), .zn(dac<6>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi6 ( .i(in<2>), .zn(dac<2>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi7 ( .i(in<3>), .zn(dac<3>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi10 ( .i(in<8>), .zn(net07), .VDD(vdd), .vss(gnd) ); 
INV0_LVT xi9 ( .i(in<1>), .zn(dac<1>), .VDD(vrefp), .vss(vcm) ); 
INV0_LVT xi8 ( .i(in<4>), .zn(dac<4>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi0 ( .i(in<9>), .zn(net91), .VDD(vdd), .vss(gnd) ); 
INV0_LVT xi1 ( .i(net91), .zn(dac<9>), .VDD(vrefp), .vss(vrefn) ); 
INV0_LVT xi2 ( .i(net07), .zn(dac<8>), .VDD(vrefp), .vss(vrefn) ); 

endmodule

module INV0_LVT ( VDD, i, vss, zn ); 
input VDD, i, vss, zn;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(vss), .D(zn), .G(i), .S(vss) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(VDD), .D(zn), .G(i), .S(VDD) ); 

endmodule

module INV_LVT ( SN, SP, i, zn ); 
input SN, SP, i, zn;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(SN), .D(zn), .G(i), .S(SN) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(SP), .D(zn), .G(i), .S(SP) ); 

endmodule

module COMPARATOR ( _net0, _net1, clk, crossn, crossp, intern, interp, outm, outp ); 
input _net0, _net1, clk, crossn, crossp, intern, interp, outm, outp;

Dcap_NMOS_n12_X1_Y1 xm1 ( .B(gnd), .S(gnd), .G(interp) ); 
Dcap_NMOS_n12_X1_Y1 xm0 ( .B(gnd), .S(gnd), .G(intern) ); 
Switch_NMOS_n12_X1_Y1 xm26 ( .B(gnd), .D(net050), .G(clk), .S(gnd) ); 
CCP_PMOS_S_n12_X1_Y1 xm13_xm14 ( .B(vdd), .DA(crossp), .DB(crossn), .S(vdd) ); 
CMC_PMOS_S_n12_X1_Y1 xm12_xm10 ( .B(vdd), .DA(crossp), .G(clk), .S(vdd), .DB(crossn) ); 
CMC_PMOS_S_n12_X1_Y1 xm19_xm18 ( .B(vdd), .DA(interp), .G(clk), .S(vdd), .DB(intern) ); 
CCP_NMOS_n12_X1_Y1 xm3_xm4 ( .B(gnd), .DA(crossp), .DB(crossn), .SA(interp), .SB(intern) ); 
INV_LVT xm17_xm15 ( .zn(outp), .i(crossn), .SN(gnd), .SP(vdd) ); 
INV_LVT xm16_xm8 ( .zn(outm), .i(crossp), .SN(gnd), .SP(vdd) ); 
DP_NMOS_n12_X1_Y1 xm24_xm25 ( .B(gnd), .DA(intern), .GA(_net1), .S(net050), .DB(interp), .GB(_net0) ); 

endmodule

module SAR_LOGIC ( clk, clksb, outn, outp, q<0>, q<1>, q<2>, q<3>, q<4>, q<5>, q<6>, q<7>, q<8>, q<9>, qb<0>, qb<1>, qb<2>, qb<3>, qb<4>, qb<5>, qb<6>, qb<7>, qb<8>, qb<9>, s<0>, sb<1> ); 
input clk, clksb, outn, outp, q<0>, q<1>, q<2>, q<3>, q<4>, q<5>, q<6>, q<7>, q<8>, q<9>, qb<0>, qb<1>, qb<2>, qb<3>, qb<4>, qb<5>, qb<6>, qb<7>, qb<8>, qb<9>, s<0>, sb<1>;

SAR_LOGIC_2ND_STAGE xi1 ( .comp(outp), .compb(outn), .q<9>(q<9>), .q<8>(q<8>), .q<7>(q<7>), .q<6>(q<6>), .q<5>(q<5>), .q<4>(q<4>), .q<3>(q<3>), .q<2>(q<2>), .q<1>(q<1>), .qb<9>(qb<9>), .qb<8>(qb<8>), .qb<7>(qb<7>), .qb<6>(qb<6>), .qb<5>(qb<5>), .qb<4>(qb<4>), .qb<3>(qb<3>), .qb<2>(qb<2>), .qb<1>(qb<1>), .s<10>(s<10>), .s<9>(s<9>), .s<8>(s<8>), .s<7>(s<7>), .s<6>(s<6>), .s<5>(s<5>), .s<4>(s<4>), .s<3>(s<3>), .s<2>(s<2>), .s<1>(s<1>), .q<0>(q<0>), .qb<0>(qb<0>) ); 
SAR_LOGIC_1ST_STAGE_CLKGATING xi0 ( .clk(clk), .clksb(clksb), .s<10>(s<10>), .s<9>(s<9>), .s<8>(s<8>), .s<7>(s<7>), .s<6>(s<6>), .s<5>(s<5>), .s<4>(s<4>), .s<3>(s<3>), .s<2>(s<2>), .s<1>(s<1>), .s<0>(s<0>), .sb<1>(sb<1>) ); 

endmodule

module SAR_LOGIC_2ND_STAGE ( comp, compb, q<0>, q<1>, q<2>, q<3>, q<4>, q<5>, q<6>, q<7>, q<8>, q<9>, qb<0>, qb<1>, qb<2>, qb<3>, qb<4>, qb<5>, qb<6>, qb<7>, qb<8>, qb<9>, s<10>, s<1>, s<2>, s<3>, s<4>, s<5>, s<6>, s<7>, s<8>, s<9> ); 
input comp, compb, q<0>, q<1>, q<2>, q<3>, q<4>, q<5>, q<6>, q<7>, q<8>, q<9>, qb<0>, qb<1>, qb<2>, qb<3>, qb<4>, qb<5>, qb<6>, qb<7>, qb<8>, qb<9>, s<10>, s<1>, s<2>, s<3>, s<4>, s<5>, s<6>, s<7>, s<8>, s<9>;

LATCH xi1<9> ( .clk(s<9>), .inm(compb), .inp(comp), .outm(net03<0>), .outp(net04<0>), .vcc(vdd) ); 
LATCH xi1<8> ( .clk(s<8>), .inm(compb), .inp(comp), .outm(net03<1>), .outp(net04<1>), .vcc(vdd) ); 
LATCH xi1<7> ( .clk(s<7>), .inm(compb), .inp(comp), .outm(net03<2>), .outp(net04<2>), .vcc(vdd) ); 
LATCH xi1<6> ( .clk(s<6>), .inm(compb), .inp(comp), .outm(net03<3>), .outp(net04<3>), .vcc(vdd) ); 
LATCH xi1<5> ( .clk(s<5>), .inm(compb), .inp(comp), .outm(net03<4>), .outp(net04<4>), .vcc(vdd) ); 
LATCH xi1<4> ( .clk(s<4>), .inm(compb), .inp(comp), .outm(net03<5>), .outp(net04<5>), .vcc(vdd) ); 
LATCH xi1<3> ( .clk(s<3>), .inm(compb), .inp(comp), .outm(net03<6>), .outp(net04<6>), .vcc(vdd) ); 
LATCH xi1<2> ( .clk(s<2>), .inm(compb), .inp(comp), .outm(net03<7>), .outp(net04<7>), .vcc(vdd) ); 
LATCH xi1<1> ( .clk(s<1>), .inm(compb), .inp(comp), .outm(net03<8>), .outp(net04<8>), .vcc(vdd) ); 
LATCH xi0 ( .clk(s<10>), .inm(compb), .inp(comp), .outm(qb<9>), .outp(q<9>), .vcc(vdd) ); 
INVD0BWP xi2<9> ( .i(net04<0>), .zn(qb<8>), .vss(gnd) ); 
INVD0BWP xi2<8> ( .i(net04<1>), .zn(qb<7>), .vss(gnd) ); 
INVD0BWP xi2<7> ( .i(net04<2>), .zn(qb<6>), .vss(gnd) ); 
INVD0BWP xi2<6> ( .i(net04<3>), .zn(qb<5>), .vss(gnd) ); 
INVD0BWP xi2<5> ( .i(net04<4>), .zn(qb<4>), .vss(gnd) ); 
INVD0BWP xi2<4> ( .i(net04<5>), .zn(qb<3>), .vss(gnd) ); 
INVD0BWP xi2<3> ( .i(net04<6>), .zn(qb<2>), .vss(gnd) ); 
INVD0BWP xi2<2> ( .i(net04<7>), .zn(qb<1>), .vss(gnd) ); 
INVD0BWP xi2<1> ( .i(net04<8>), .zn(qb<0>), .vss(gnd) ); 
INVD0BWP xi3<9> ( .i(net03<0>), .zn(q<8>), .vss(gnd) ); 
INVD0BWP xi3<8> ( .i(net03<1>), .zn(q<7>), .vss(gnd) ); 
INVD0BWP xi3<7> ( .i(net03<2>), .zn(q<6>), .vss(gnd) ); 
INVD0BWP xi3<6> ( .i(net03<3>), .zn(q<5>), .vss(gnd) ); 
INVD0BWP xi3<5> ( .i(net03<4>), .zn(q<4>), .vss(gnd) ); 
INVD0BWP xi3<4> ( .i(net03<5>), .zn(q<3>), .vss(gnd) ); 
INVD0BWP xi3<3> ( .i(net03<6>), .zn(q<2>), .vss(gnd) ); 
INVD0BWP xi3<2> ( .i(net03<7>), .zn(q<1>), .vss(gnd) ); 
INVD0BWP xi3<1> ( .i(net03<8>), .zn(q<0>), .vss(gnd) ); 

endmodule

module LATCH ( clk, inm, inp, outm, outp, vcc ); 
input clk, inm, inp, outm, outp, vcc;

INVD0BWP xi1 ( .i(net67), .zn(outp), .vss(gnd) ); 
INVD0BWP xi0 ( .i(net64), .zn(outm), .vss(gnd) ); 
Switch_PMOS_n12_X1_Y1 xm10 ( .B(vcc), .D(net64), .G(clk), .S(vcc) ); 
Switch_PMOS_n12_X1_Y1 xm9 ( .B(vcc), .D(net67), .G(clk), .S(vcc) ); 
Switch_PMOS_n12_X1_Y1 xm13 ( .B(vcc), .D(net67), .G(net64), .S(vcc) ); 
Switch_PMOS_n12_X1_Y1 xm4 ( .B(vcc), .D(net64), .G(net67), .S(vcc) ); 
Switch_PMOS_n12_X1_Y1 xm8 ( .B(vcc), .D(net65), .G(clk), .S(vcc) ); 
Switch_PMOS_n12_X1_Y1 xm12 ( .B(vcc), .D(net012), .G(clk), .S(vcc) ); 
Switch_NMOS_n12_X1_Y1 xm11 ( .B(gnd), .D(net60), .G(clk), .S(gnd) ); 
Switch_NMOS_n12_X1_Y1 xm0 ( .B(gnd), .D(net65), .G(inp), .S(net60) ); 
Switch_NMOS_n12_X1_Y1 xm2 ( .B(gnd), .D(net67), .G(net64), .S(net65) ); 
Switch_NMOS_n12_X1_Y1 xm3 ( .B(gnd), .D(net64), .G(net67), .S(net012) ); 
Switch_NMOS_n12_X1_Y1 xm1 ( .B(gnd), .D(net012), .G(inm), .S(net60) ); 

endmodule

module INVD0BWP ( i, vss, zn ); 
input i, vss, zn;

Switch_NMOS_n12_X1_Y1 m0 ( .B(vss), .D(zn), .G(i), .S(vss) ); 
Switch_PMOS_n12_X1_Y1 m1 ( .B(vdd), .D(zn), .G(i), .S(vdd) ); 

endmodule

module SAR_LOGIC_1ST_STAGE_CLKGATING ( clk, clksb, s<0>, s<10>, s<1>, s<2>, s<3>, s<4>, s<5>, s<6>, s<7>, s<8>, s<9>, sb<1> ); 
input clk, clksb, s<0>, s<10>, s<1>, s<2>, s<3>, s<4>, s<5>, s<6>, s<7>, s<8>, s<9>, sb<1>;

DFSNQD1BWP xi4 ( .d(net2), .cp(net3), .sdn(net6), .q(net1), .vss(net4) ); 
AN3D0BWP xi16<10> ( .a1(clkb), .a2(s<10>), .a3(sb<9>), .z(clkff<9>), .vss(gnd) ); 
AN3D0BWP xi16<9> ( .a1(clkb), .a2(s<9>), .a3(sb<8>), .z(clkff<8>), .vss(gnd) ); 
AN3D0BWP xi16<8> ( .a1(clkb), .a2(s<8>), .a3(sb<7>), .z(clkff<7>), .vss(gnd) ); 
AN3D0BWP xi16<7> ( .a1(clkb), .a2(s<7>), .a3(sb<6>), .z(clkff<6>), .vss(gnd) ); 
AN3D0BWP xi16<6> ( .a1(clkb), .a2(s<6>), .a3(sb<5>), .z(clkff<5>), .vss(gnd) ); 
AN3D0BWP xi16<5> ( .a1(clkb), .a2(s<5>), .a3(sb<4>), .z(clkff<4>), .vss(gnd) ); 
AN3D0BWP xi16<4> ( .a1(clkb), .a2(s<4>), .a3(sb<3>), .z(clkff<3>), .vss(gnd) ); 
AN3D0BWP xi16<3> ( .a1(clkb), .a2(s<3>), .a3(sb<2>), .z(clkff<2>), .vss(gnd) ); 
AN3D0BWP xi16<2> ( .a1(clkb), .a2(s<2>), .a3(sb<1>), .z(clkff<1>), .vss(gnd) ); 
AN3D0BWP xi16<1> ( .a1(clkb), .a2(s<1>), .a3(sb<0>), .z(clkff<0>), .vss(gnd) ); 
INVD0BWP xi19 ( .i(clk), .zn(clkb), .vss(gnd) ); 
AN2D0BWP xi13 ( .a1(clkb), .a2(sb<10>), .z(clkff<10>), .vss(gnd) ); 
DFNCND1BWP xi18<10> ( .d(s<10>), .cpn(clkff<9>), .cdn(clksb), .q(s<9>), .qn(sb<9>), .vss(gnd) ); 
DFNCND1BWP xi18<9> ( .d(s<9>), .cpn(clkff<8>), .cdn(clksb), .q(s<8>), .qn(sb<8>), .vss(gnd) ); 
DFNCND1BWP xi18<8> ( .d(s<8>), .cpn(clkff<7>), .cdn(clksb), .q(s<7>), .qn(sb<7>), .vss(gnd) ); 
DFNCND1BWP xi18<7> ( .d(s<7>), .cpn(clkff<6>), .cdn(clksb), .q(s<6>), .qn(sb<6>), .vss(gnd) ); 
DFNCND1BWP xi18<6> ( .d(s<6>), .cpn(clkff<5>), .cdn(clksb), .q(s<5>), .qn(sb<5>), .vss(gnd) ); 
DFNCND1BWP xi18<5> ( .d(s<5>), .cpn(clkff<4>), .cdn(clksb), .q(s<4>), .qn(sb<4>), .vss(gnd) ); 
DFNCND1BWP xi18<4> ( .d(s<4>), .cpn(clkff<3>), .cdn(clksb), .q(s<3>), .qn(sb<3>), .vss(gnd) ); 
DFNCND1BWP xi18<3> ( .d(s<3>), .cpn(clkff<2>), .cdn(clksb), .q(s<2>), .qn(sb<2>), .vss(gnd) ); 
DFNCND1BWP xi18<2> ( .d(s<2>), .cpn(clkff<1>), .cdn(clksb), .q(s<1>), .qn(sb<1>), .vss(gnd) ); 
DFNCND1BWP xi18<1> ( .d(s<1>), .cpn(clkff<0>), .cdn(clksb), .q(s<0>), .qn(sb<0>), .vss(gnd) ); 
DFNCND1BWP xi17 ( .d(vdd), .cpn(clkff<10>), .cdn(clksb), .q(s<10>), .qn(sb<10>), .vss(gnd) ); 

endmodule

module DFSNQD1BWP ( cp, d, q, sdn, vss ); 
input cp, d, q, sdn, vss;

Switch_NMOS_n12_X1_Y1 m0 ( .B(vss), .D(net44), .G(net25), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m1 ( .B(vss), .D(net11), .G(cp), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m2 ( .B(vss), .D(q), .G(net13), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m3 ( .B(vss), .D(net7), .G(sdn), .S(net44) ); 
Switch_NMOS_n12_X1_Y1 m4 ( .B(vss), .D(net37), .G(net13), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m5 ( .B(vss), .D(net33), .G(sdn), .S(net37) ); 
Switch_NMOS_n12_X1_Y1 mi20 ( .B(vss), .D(net7), .G(net83), .S(net63) ); 
Switch_NMOS_n12_X1_Y1 mi23 ( .B(vss), .D(net25), .G(net83), .S(net5) ); 
Switch_NMOS_n12_X1_Y1 mi22 ( .B(vss), .D(net33), .G(net11), .S(net63) ); 
Switch_NMOS_n12_X1_Y1 mi21 ( .B(vss), .D(net25), .G(d), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 m6 ( .B(vss), .D(net13), .G(net63), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi19 ( .B(vss), .D(net20), .G(net11), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi24 ( .B(vss), .D(net5), .G(net7), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m7 ( .B(vss), .D(net83), .G(net11), .S(vss) ); 
Switch_PMOS_n12_X1_Y1 m8 ( .B(vdd), .D(net11), .G(cp), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi33 ( .B(vdd), .D(net33), .G(net83), .S(net63) ); 
Switch_PMOS_n12_X1_Y1 m9 ( .B(vdd), .D(net7), .G(sdn), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m10 ( .B(vdd), .D(q), .G(net13), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi34 ( .B(vdd), .D(net25), .G(net11), .S(net96) ); 
Switch_PMOS_n12_X1_Y1 mi30 ( .B(vdd), .D(net7), .G(net11), .S(net63) ); 
Switch_PMOS_n12_X1_Y1 m11 ( .B(vdd), .D(net7), .G(net25), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi28 ( .B(vdd), .D(net81), .G(net83), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m12 ( .B(vdd), .D(net83), .G(net11), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m13 ( .B(vdd), .D(net33), .G(net13), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi35 ( .B(vdd), .D(net96), .G(net7), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m14 ( .B(vdd), .D(net33), .G(sdn), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m15 ( .B(vdd), .D(net13), .G(net63), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi26 ( .B(vdd), .D(net25), .G(d), .S(net81) ); 

endmodule

module AN3D0BWP ( a1, a2, a3, vss, z ); 
input a1, a2, a3, vss, z;

Switch_NMOS_n12_X1_Y1 m0 ( .B(vss), .D(net13), .G(a3), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m1 ( .B(vss), .D(z), .G(net11), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m2 ( .B(vss), .D(net5), .G(a2), .S(net13) ); 
Switch_NMOS_n12_X1_Y1 m3 ( .B(vss), .D(net11), .G(a1), .S(net5) ); 
Switch_PMOS_n12_X1_Y1 m4 ( .B(vdd), .D(z), .G(net11), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m5 ( .B(vdd), .D(net11), .G(a3), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m6 ( .B(vdd), .D(net11), .G(a1), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m7 ( .B(vdd), .D(net11), .G(a2), .S(vdd) ); 

endmodule

module AN2D0BWP ( a1, a2, vss, z ); 
input a1, a2, vss, z;

Switch_PMOS_n12_X1_Y1 m0 ( .B(vdd), .D(z), .G(net5), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m1 ( .B(vdd), .D(net5), .G(a1), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m2 ( .B(vdd), .D(net5), .G(a2), .S(vdd) ); 
Switch_NMOS_n12_X1_Y1 m3 ( .B(vss), .D(z), .G(net5), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m4 ( .B(vss), .D(net17), .G(a2), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m5 ( .B(vss), .D(net5), .G(a1), .S(net17) ); 

endmodule

module DFNCND1BWP ( cdn, cpn, d, q, qn, vss ); 
input cdn, cpn, d, q, qn, vss;

Switch_PMOS_n12_X1_Y1 m0 ( .B(vdd), .D(net49), .G(cdn), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi43 ( .B(vdd), .D(net53), .G(net9), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m1 ( .B(vdd), .D(net49), .G(net20), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi6 ( .B(vdd), .D(net5), .G(d), .S(net1) ); 
Switch_PMOS_n12_X1_Y1 m2 ( .B(vdd), .D(net11), .G(net67), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m3 ( .B(vdd), .D(net37), .G(net49), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m4 ( .B(vdd), .D(qn), .G(net37), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m5 ( .B(vdd), .D(net67), .G(cpn), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m6 ( .B(vdd), .D(q), .G(net49), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi44 ( .B(vdd), .D(net53), .G(cdn), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi17 ( .B(vdd), .D(net37), .G(net67), .S(net20) ); 
Switch_PMOS_n12_X1_Y1 m7 ( .B(vdd), .D(net9), .G(net5), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi16 ( .B(vdd), .D(net9), .G(net11), .S(net20) ); 
Switch_PMOS_n12_X1_Y1 mi45 ( .B(vdd), .D(net5), .G(net11), .S(net53) ); 
Switch_PMOS_n12_X1_Y1 mi7 ( .B(vdd), .D(net1), .G(net67), .S(vdd) ); 
Switch_NMOS_n12_X1_Y1 m8 ( .B(vss), .D(qn), .G(net37), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m9 ( .B(vss), .D(net37), .G(net49), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi4 ( .B(vss), .D(net109), .G(net11), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi18 ( .B(vss), .D(net37), .G(net11), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 m10 ( .B(vss), .D(net49), .G(net20), .S(net104) ); 
Switch_NMOS_n12_X1_Y1 m11 ( .B(vss), .D(net104), .G(cdn), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m12 ( .B(vss), .D(net9), .G(net5), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi15 ( .B(vss), .D(net9), .G(net67), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 mi5 ( .B(vss), .D(net5), .G(d), .S(net109) ); 
Switch_NMOS_n12_X1_Y1 m13 ( .B(vss), .D(net67), .G(cpn), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi49 ( .B(vss), .D(net77), .G(cdn), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi48 ( .B(vss), .D(net64), .G(net9), .S(net77) ); 
Switch_NMOS_n12_X1_Y1 m14 ( .B(vss), .D(q), .G(net49), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m15 ( .B(vss), .D(net11), .G(net67), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi47 ( .B(vss), .D(net5), .G(net67), .S(net64) ); 

endmodule

module SAMPLER ( clks_boost, vin, vout ); 
input clks_boost, vin, vout;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(gnd), .D(vout), .G(clks_boost), .S(vin) ); 

endmodule

module COUNTER ( clksb, ctrl, d<0>, d<1>, in ); 
input clksb, ctrl, d<0>, d<1>, in;

DFCND1BWP xi1 ( .d(net9), .cp(d<0>), .cdn(clksb), .q(d<1>), .qn(net9), .vss(gnd) ); 
DFCND1BWP xi0 ( .d(net6), .cp(net12), .cdn(clksb), .q(d<0>), .qn(net6), .vss(gnd) ); 
NR2D0BWP xi2 ( .a1(in), .a2(ctrl), .zn(net12), .vss(gnd) ); 

endmodule

module DFCND1BWP ( cdn, cp, d, q, qn, vss ); 
input cdn, cp, d, q, qn, vss;

Switch_NMOS_n12_X1_Y1 m0 ( .B(vss), .D(qn), .G(net33), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi4 ( .B(vss), .D(net53), .G(net5), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi18 ( .B(vss), .D(net33), .G(net5), .S(net79) ); 
Switch_NMOS_n12_X1_Y1 m1 ( .B(vss), .D(net95), .G(net79), .S(net9) ); 
Switch_NMOS_n12_X1_Y1 m2 ( .B(vss), .D(net81), .G(net25), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi15 ( .B(vss), .D(net81), .G(net67), .S(net79) ); 
Switch_NMOS_n12_X1_Y1 m3 ( .B(vss), .D(net33), .G(net95), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m4 ( .B(vss), .D(net67), .G(net5), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi5 ( .B(vss), .D(net25), .G(d), .S(net53) ); 
Switch_NMOS_n12_X1_Y1 mi49 ( .B(vss), .D(net20), .G(cdn), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi48 ( .B(vss), .D(net17), .G(net81), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 m5 ( .B(vss), .D(q), .G(net95), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m6 ( .B(vss), .D(net9), .G(cdn), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m7 ( .B(vss), .D(net5), .G(cp), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 mi47 ( .B(vss), .D(net25), .G(net67), .S(net17) ); 
Switch_PMOS_n12_X1_Y1 m8 ( .B(vdd), .D(net33), .G(net95), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m9 ( .B(vdd), .D(net5), .G(cp), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m10 ( .B(vdd), .D(net67), .G(net5), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi43 ( .B(vdd), .D(net72), .G(net81), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi6 ( .B(vdd), .D(net25), .G(d), .S(net104) ); 
Switch_PMOS_n12_X1_Y1 m11 ( .B(vdd), .D(qn), .G(net33), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m12 ( .B(vdd), .D(q), .G(net95), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi44 ( .B(vdd), .D(net72), .G(cdn), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi17 ( .B(vdd), .D(net33), .G(net67), .S(net79) ); 
Switch_PMOS_n12_X1_Y1 m13 ( .B(vdd), .D(net81), .G(net25), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m14 ( .B(vdd), .D(net95), .G(net79), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 mi16 ( .B(vdd), .D(net81), .G(net5), .S(net79) ); 
Switch_PMOS_n12_X1_Y1 mi45 ( .B(vdd), .D(net25), .G(net5), .S(net72) ); 
Switch_PMOS_n12_X1_Y1 mi7 ( .B(vdd), .D(net104), .G(net67), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m15 ( .B(vdd), .D(net95), .G(cdn), .S(vdd) ); 

endmodule

module NR2D0BWP ( a1, a2, vss, zn ); 
input a1, a2, vss, zn;

Switch_NMOS_n12_X1_Y1 m0 ( .B(vss), .D(zn), .G(a2), .S(vss) ); 
Switch_NMOS_n12_X1_Y1 m1 ( .B(vss), .D(zn), .G(a1), .S(vss) ); 
Switch_PMOS_n12_X1_Y1 m2 ( .B(vdd), .D(net13), .G(a2), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 m3 ( .B(vdd), .D(zn), .G(a1), .S(net13) ); 

endmodule

`celldefine
module global_power;
supply0 gnd;
supply1 vdd;
endmodule
`endcelldefine
