//Verilog block level netlist file for SAR_5bit_stage_1_v2
//Generated by UMN for ALIGN project 


module SAR_5bit_stage_1_v2 ( CALIB_BTM, CALIB_TOP, CK, IN_N, IN_P, OP<1>, OP<2>, OP<3>, OP<4>, OP<5>, SH_N, SH_P, VCM, spi_stage1<10>, spi_stage1<11>, spi_stage1<12>, spi_stage1<13>, spi_stage1<14>, spi_stage1<15>, spi_stage1<16>, spi_stage1<17>, spi_stage1<1>, spi_stage1<2>, spi_stage1<3>, spi_stage1<4>, spi_stage1<5>, spi_stage1<6>, spi_stage1<7>, spi_stage1<8>, spi_stage1<9> ); 
input CALIB_BTM, CALIB_TOP, CK, IN_N, IN_P, OP<1>, OP<2>, OP<3>, OP<4>, OP<5>, SH_N, SH_P, VCM, spi_stage1<10>, spi_stage1<11>, spi_stage1<12>, spi_stage1<13>, spi_stage1<14>, spi_stage1<15>, spi_stage1<16>, spi_stage1<17>, spi_stage1<1>, spi_stage1<2>, spi_stage1<3>, spi_stage1<4>, spi_stage1<5>, spi_stage1<6>, spi_stage1<7>, spi_stage1<8>, spi_stage1<9>;

bootstraps_v3 xi20 ( .CK(CK), .IN_N(IN_N), .IN_P(IN_P), .SH_N(SH_N), .SH_P(SH_P) ); 
comparator xi3 (  ); 
calib_switch_vcm_v1 xi46 ( .AN(SH_N), .AP(SH_P), .VM(VCM), .ctrl(spi_stage1<17>) ); 
cdac_5bit_hierarchical1 xi25 ( .BTM_A<1>(CTRL_BTM_A<1>), .BTM_A<2>(CTRL_BTM_A<2>), .BTM_A<3>(CTRL_BTM_A<3>), .BTM_A<4>(CTRL_BTM_A<4>), .BTM_A<5>(CTRL_BTM_A<5>), .BTM_B<1>(CTRL_BTM_B<1>), .BTM_B<2>(CTRL_BTM_B<2>), .BTM_B<3>(CTRL_BTM_B<3>), .BTM_B<4>(CTRL_BTM_B<4>), .BTM_B<5>(CTRL_BTM_B<5>), .CALIB_AN(CALIB_BTM), .CALIB_AP(CALIB_TOP), .CALIB_BN(CALIB_BTM), .CALIB_BP(CALIB_TOP), .SH_N(SH_N), .SH_P(SH_P), .TOP_A<1>(CTRL_TOP_A<1>), .TOP_A<2>(CTRL_TOP_A<2>), .TOP_A<3>(CTRL_TOP_A<3>), .TOP_A<4>(CTRL_TOP_A<4>), .TOP_A<5>(CTRL_TOP_A<5>), .TOP_B<1>(CTRL_TOP_B<1>), .TOP_B<2>(CTRL_TOP_B<2>), .TOP_B<3>(CTRL_TOP_B<3>), .TOP_B<4>(CTRL_TOP_B<4>), .TOP_B<5>(CTRL_TOP_B<5>) ); 
DIG_s1_v1 xi22 ( .CK(CK), .CTRL_BTM_A<1>(CTRL_BTM_A<1>), .CTRL_BTM_A<2>(CTRL_BTM_A<2>), .CTRL_BTM_A<3>(CTRL_BTM_A<3>), .CTRL_BTM_A<4>(CTRL_BTM_A<4>), .CTRL_BTM_A<5>(CTRL_BTM_A<5>), .CTRL_BTM_B<1>(CTRL_BTM_B<1>), .CTRL_BTM_B<2>(CTRL_BTM_B<2>), .CTRL_BTM_B<3>(CTRL_BTM_B<3>), .CTRL_BTM_B<4>(CTRL_BTM_B<4>), .CTRL_BTM_B<5>(CTRL_BTM_B<5>), .CTRL_TOP_A<1>(CTRL_TOP_A<1>), .CTRL_TOP_A<2>(CTRL_TOP_A<2>), .CTRL_TOP_A<3>(CTRL_TOP_A<3>), .CTRL_TOP_A<4>(CTRL_TOP_A<4>), .CTRL_TOP_A<5>(CTRL_TOP_A<5>), .CTRL_TOP_B<1>(CTRL_TOP_B<1>), .CTRL_TOP_B<2>(CTRL_TOP_B<2>), .CTRL_TOP_B<3>(CTRL_TOP_B<3>), .CTRL_TOP_B<4>(CTRL_TOP_B<4>), .CTRL_TOP_B<5>(CTRL_TOP_B<5>), .OP<1>(OP<1>), .OP<2>(OP<2>), .OP<3>(OP<3>), .OP<4>(OP<4>), .OP<5>(OP<5>), .comp_ck(comp_ck), .comp_n(comp_n), .comp_p(comp_p), .rdy(rdy) ); 
comp1_calib_v3 xi26 ( .OUTN(BN), .OUTP(BP), .spi_n<1>(spi_stage1<9>), .spi_n<2>(spi_stage1<10>), .spi_n<3>(spi_stage1<11>), .spi_n<4>(spi_stage1<12>), .spi_n<5>(spi_stage1<13>), .spi_n<6>(spi_stage1<14>), .spi_n<7>(spi_stage1<15>), .spi_n<8>(spi_stage1<16>), .spi_p<1>(spi_stage1<1>), .spi_p<2>(spi_stage1<2>), .spi_p<3>(spi_stage1<3>), .spi_p<4>(spi_stage1<4>), .spi_p<5>(spi_stage1<5>), .spi_p<6>(spi_stage1<6>), .spi_p<7>(spi_stage1<7>), .spi_p<8>(spi_stage1<8>) ); 

endmodule

module bootstraps_v3 ( CK, IN_N, IN_P, SH_N, SH_P ); 
input CK, IN_N, IN_P, SH_N, SH_P;

inv_array_bootstraps_v3 xi1 ( .CK(CK), .ck_n(ck_n), .cki(cki) ); 
Bootstrap_num_v3 xi2 ( .ck(cki), .ckb(ck_n), .in(IN_P), .out(SH_P) ); 
Bootstrap_num_v3 xi15 ( .ck(cki), .ckb(ck_n), .in(IN_N), .out(SH_N) ); 

endmodule

module inv_array_bootstraps_v3 ( CK, ck_n, cki ); 
input CK, ck_n, cki;

INV_B1 xi3 ( .a(CK), .z(net09) ); 
INV_B2 xi1 ( .a(cki), .z(ck_n) ); 
INV_B3 xi0 ( .a(net09), .z(cki) ); 

endmodule

module INV_B1 ( a, z ); 
input a, z;

Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT mn0 ( .D(z), .G(a), .S(VSS) ); 
Switch_PMOS_nfin5_nf2_m1_n12_X1_Y1_SLVT mp0 ( .D(z), .G(a), .S(VDD) ); 

endmodule

module INV_B2 ( a, z ); 
input a, z;

Switch_NMOS_nfin4_nf4_m1_n12_X2_Y1_SLVT mn0 ( .D(z), .G(a), .S(VSS) ); 
Switch_PMOS_nfin5_nf4_m1_n12_X2_Y1_SLVT mp0 ( .D(z), .G(a), .S(VDD) ); 

endmodule

module INV_B3 ( a, z ); 
input a, z;

Switch_NMOS_nfin4_nf8_m1_n12_X3_Y1_SLVT mn0 ( .D(z), .G(a), .S(VSS) ); 
Switch_PMOS_nfin5_nf8_m1_n12_X2_Y2_SLVT mp0 ( .D(z), .G(a), .S(VDD) ); 

endmodule

module INV ( i, zn ); 
input i, zn;

Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT M1 ( .D(zn), .G(i), .S(VDD) ); 

endmodule

module Bootstrap_num_v3 ( ck, ckb, in, out ); 
input ck, ckb, in, out;

Dcap_NMOS_B_nfin4_nf6_m1_n12_X2_Y1_SLVT mn8 ( .B(VSS), .G(ckb), .S(out) ); 
Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn6 ( .B(VSS), .D(q), .G(VDD), .S(sw) ); 
Switch_NMOS_B_nfin4_nf11_m1_n12_X2_Y2_SLVT mn5 ( .B(VSS), .D(out), .G(sw), .S(in) ); 
Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn4 ( .B(VSS), .D(d), .G(sw), .S(b) ); 
Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn3 ( .B(VSS), .D(in), .G(sw), .S(b) ); 
Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn2 ( .B(VSS), .D(d), .G(ck), .S(b) ); 
Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT mn1 ( .D(b), .G(ckb), .S(VSS) ); 
Cap_200f c1 ( .MINUS(p), .PLUS(b) ); 
Switch_PMOS_B_nfin5_nf1_m1_n12_X1_Y1_SLVT mp1 ( .B(VDD), .D(p), .G(d), .S(sw) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp0 ( .D(d), .G(ck), .S(VDD) ); 
Switch_PMOS_nfin5_nf2_m1_n12_X1_Y1_SLVT mp3 ( .D(p), .G(sw), .S(VDD) ); 
INV mn7_mp2 ( .i(ckb), .zn(q) ); 

endmodule

module comparator ( AN, AP, BN, BP, CKi, ON, OP, RDY, oCK ); 
input AN, AP, BN, BP, CKi, ON, OP, RDY, oCK;

clkinv I3 ( .CKi(CKi), .oCK(oCK) ); 
NAND_comp I2 ( .A(OP), .B(ON), .Z(RDY) ); 
CCP_S_NMOS_B_nfin4_nf4_m1_n12_X2_Y1_SLVT m0_m1 ( .B(VSS), .DA(OP), .DB(ON), .SA(net65), .SB(net61) ); 
CCP_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT m10_m11 ( .DA(OP), .DB(ON), .S(VDD) ); 
CMC_NMOS_nfin4_nf8_m1_n12_X3_Y1_SLVT m6_m3 ( .DA(net60), .DB(net67), .G(oCK), .S(VSS) ); 
CMC_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT m8_m9 ( .DA(OP), .DB(ON), .G(oCK), .S(VDD) ); 
DP_NMOS_B_nfin4_nf4_m1_n12_X2_Y1_SLVT m7_m5 ( .B(VSS), .DA(net61), .DB(net65), .GA(AP), .GB(AN), .S(net60) ); 
DP_NMOS_B_nfin4_nf4_m1_n12_X2_Y1_SLVT m4_m2 ( .B(VSS), .DA(net61), .DB(net65), .GA(BP), .GB(BN), .S(net67) ); 

endmodule

module clkinv ( CKi, oCK ); 
input CKi, oCK;

INVERTER_C1 I5 ( .A(CKi), .Z(net019) ); 
INVERTER_C2 I4 ( .A(net019), .Z(oCK) ); 

endmodule

module INV<1> ( i, zn ); 
input i, zn;

Switch_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT M1 ( .D(zn), .G(i), .S(VDD) ); 

endmodule

module INVERTER_C1 ( A, Z ); 
input A, Z;

INV<1> m0_m1 ( .i(A), .zn(Z) ); 

endmodule

module INV<2> ( i, zn ); 
input i, zn;

Switch_NMOS_nfin4_nf3_m1_n12_X1_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_nfin5_nf3_m1_n12_X2_Y1_SLVT M1 ( .D(zn), .G(i), .S(VDD) ); 

endmodule

module INVERTER_C2 ( A, Z ); 
input A, Z;

INV<2> m0_m1 ( .i(A), .zn(Z) ); 

endmodule

module NAND_comp ( A, B, Z ); 
input A, B, Z;

NAND_1_comp I0 ( .A(A), .B(B), .Z(Z) ); 
NAND_1_comp I1 ( .A(B), .B(A), .Z(Z) ); 

endmodule

module NAND_1_comp ( A, B, Z ); 
input A, B, Z;

Switch_NMOS_B_nfin4_nf2_m1_n12_X1_Y1_SLVT m1 ( .B(VSS), .D(Z), .G(A), .S(net47) ); 
Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT m3 ( .D(net47), .G(B), .S(VSS) ); 
Switch_PMOS_nfin5_nf2_m1_n12_X1_Y1_SLVT m4 ( .D(Z), .G(B), .S(VDD) ); 

endmodule

module tgate ( D, GA, GB, S ); 
input D, GA, GB, S;

Switch_NMOS_B_nfin4_nf6_m1_n12_X2_Y1_SLVT M0 ( .B(VSS), .D(D), .G(GA), .S(S) ); 
Switch_PMOS_B_nfin5_nf6_m1_n12_X3_Y1_SLVT M1 ( .B(VDD), .D(D), .G(GB), .S(S) ); 

endmodule

module calib_switch_vcm_v1 ( AN, AP, VM, ctrl ); 
input AN, AP, VM, ctrl;

INV_S1 xi24 ( .a(ctrl), .z(ctrlb) ); 
INV_S1 xi0 ( .a(ctrlb), .z(ctrld) ); 
tgate mn2_mp0 ( .D(VM), .GA(ctrld), .GB(ctrlb), .S(AN) ); 
tgate mn3_mp1 ( .D(AP), .GA(ctrld), .GB(ctrlb), .S(VM) ); 

endmodule

module INV_S1 ( a, z ); 
input a, z;

INV mn0_mp0 ( .i(a), .zn(z) ); 

endmodule

module cdac_5bit_hierarchical1 ( BTM_A<1>, BTM_A<2>, BTM_A<3>, BTM_A<4>, BTM_A<5>, BTM_B<1>, BTM_B<2>, BTM_B<3>, BTM_B<4>, BTM_B<5>, CALIB_AN, CALIB_AP, CALIB_BN, CALIB_BP, SH_N, SH_P, TOP_A<1>, TOP_A<2>, TOP_A<3>, TOP_A<4>, TOP_A<5>, TOP_B<1>, TOP_B<2>, TOP_B<3>, TOP_B<4>, TOP_B<5> ); 
input BTM_A<1>, BTM_A<2>, BTM_A<3>, BTM_A<4>, BTM_A<5>, BTM_B<1>, BTM_B<2>, BTM_B<3>, BTM_B<4>, BTM_B<5>, CALIB_AN, CALIB_AP, CALIB_BN, CALIB_BP, SH_N, SH_P, TOP_A<1>, TOP_A<2>, TOP_A<3>, TOP_A<4>, TOP_A<5>, TOP_B<1>, TOP_B<2>, TOP_B<3>, TOP_B<4>, TOP_B<5>;

CDAC_array_v1 xi0 ( .calib(CALIB_BP), .cdac(SH_P), .ctrl<1>(TOP_B<1>), .ctrl<2>(TOP_B<2>), .ctrl<3>(TOP_B<3>), .ctrl<4>(TOP_B<4>), .ctrl<5>(TOP_B<5>), .out1(net44), .out2(net45), .out3<1>(net46<0>), .out3<2>(net46<1>), .out4<1>(net47<0>), .out4<2>(net47<1>), .out4<3>(net47<2>), .out4<4>(net47<3>), .out5<1>(net48<0>), .out5<2>(net48<1>), .out5<3>(net48<2>), .out5<4>(net48<3>), .out5<5>(net48<4>), .out5<6>(net48<5>), .out5<7>(net48<6>), .out5<8>(net48<7>), .outc(net43) ); 
CDAC_array_v1 xi2 ( .calib(CALIB_AP), .cdac(SH_P), .ctrl<1>(TOP_A<1>), .ctrl<2>(TOP_A<2>), .ctrl<3>(TOP_A<3>), .ctrl<4>(TOP_A<4>), .ctrl<5>(TOP_A<5>), .out1(net16), .out2(net17), .out3<1>(net18<0>), .out3<2>(net18<1>), .out4<1>(net19<0>), .out4<2>(net19<1>), .out4<3>(net19<2>), .out4<4>(net19<3>), .out5<1>(net20<0>), .out5<2>(net20<1>), .out5<3>(net20<2>), .out5<4>(net20<3>), .out5<5>(net20<4>), .out5<6>(net20<5>), .out5<7>(net20<6>), .out5<8>(net20<7>), .outc(net15) ); 
CDAC_array_v1 xi1 ( .calib(CALIB_BN), .cdac(SH_N), .ctrl<1>(BTM_B<1>), .ctrl<2>(BTM_B<2>), .ctrl<3>(BTM_B<3>), .ctrl<4>(BTM_B<4>), .ctrl<5>(BTM_B<5>), .out1(net30), .out2(net31), .out3<1>(net32<0>), .out3<2>(net32<1>), .out4<1>(net33<0>), .out4<2>(net33<1>), .out4<3>(net33<2>), .out4<4>(net33<3>), .out5<1>(net34<0>), .out5<2>(net34<1>), .out5<3>(net34<2>), .out5<4>(net34<3>), .out5<5>(net34<4>), .out5<6>(net34<5>), .out5<7>(net34<6>), .out5<8>(net34<7>), .outc(net29) ); 
CDAC_array_v1 xi3 ( .calib(CALIB_AN), .cdac(SH_N), .ctrl<1>(BTM_A<1>), .ctrl<2>(BTM_A<2>), .ctrl<3>(BTM_A<3>), .ctrl<4>(BTM_A<4>), .ctrl<5>(BTM_A<5>), .out1(net2), .out2(net3), .out3<1>(net4<0>), .out3<2>(net4<1>), .out4<1>(net5<0>), .out4<2>(net5<1>), .out4<3>(net5<2>), .out4<4>(net5<3>), .out5<1>(net6<0>), .out5<2>(net6<1>), .out5<3>(net6<2>), .out5<4>(net6<3>), .out5<5>(net6<4>), .out5<6>(net6<5>), .out5<7>(net6<6>), .out5<8>(net6<7>), .outc(net1) ); 

endmodule

module CDAC_array_v1 ( calib, cdac, ctrl<1>, ctrl<2>, ctrl<3>, ctrl<4>, ctrl<5>, out1, out2, out3<1>, out3<2>, out4<1>, out4<2>, out4<3>, out4<4>, out5<1>, out5<2>, out5<3>, out5<4>, out5<5>, out5<6>, out5<7>, out5<8>, outc ); 
input calib, cdac, ctrl<1>, ctrl<2>, ctrl<3>, ctrl<4>, ctrl<5>, out1, out2, out3<1>, out3<2>, out4<1>, out4<2>, out4<3>, out4<4>, out5<1>, out5<2>, out5<3>, out5<4>, out5<5>, out5<6>, out5<7>, out5<8>, outc;

array1 xi1 ( .calib(calib), .cdac(cdac), .ctrl<1>(ctrl<1>), .out1(out1), .outc(outc) ); 
cdac_cell2 xi2 (  ); 
array3 xi3 ( .cdac(cdac), .ctrl<3>(ctrl<3>), .out3<1>(out3<1>), .out3<2>(out3<2>) ); 
array4 xi4 ( .cdac(cdac), .ctrl<4>(ctrl<4>), .out4<1>(out4<1>), .out4<2>(out4<2>), .out4<3>(out4<3>), .out4<4>(out4<4>) ); 
array5 xi5 ( .cdac(cdac), .ctrl<5>(ctrl<5>), .out5<1>(out5<1>), .out5<2>(out5<2>), .out5<3>(out5<3>), .out5<4>(out5<4>), .out5<5>(out5<5>), .out5<6>(out5<6>), .out5<7>(out5<7>), .out5<8>(out5<8>) ); 

endmodule

module array1 ( calib, cdac, ctrl<1>, out1, outc ); 
input calib, cdac, ctrl<1>, out1, outc;

cdac_cell1 xi0 ( .cdac(cdac), .ctrl<1>(calib), .out1(outc) ); 
cdac_cell1 xi1 ( .cdac(cdac), .ctrl<1>(ctrl<1>), .out1(out1) ); 

endmodule

module cdac_cell1 ( cdac, ctrl<1>, out1 ); 
input cdac, ctrl<1>, out1;

Cap_10f c2 ( .MINUS(out1), .PLUS(net02) ); 
Cap_10f c1 ( .MINUS(net02), .PLUS(cdac) ); 
cdac_inv xi1 ( .ctrl<1>(ctrl<1>), .out1(out1) ); 

endmodule

module cdac_inv ( ctrl<1>, out1 ); 
input ctrl<1>, out1;

Switch_PMOS_nfin5_nf5_m1_n12_X3_Y1_SLVT mp4 ( .D(out1), .G(ctrl<1>), .S(VDD) ); 
Switch_NMOS_nfin4_nf5_m1_n12_X2_Y1_SLVT mn4 ( .D(out1), .G(ctrl<1>), .S(VSS) ); 

endmodule

module cdac_cell2 ( cdac, ctrl<2>, out2 ); 
input cdac, ctrl<2>, out2;

cdac_inv xi2 ( .ctrl<1>(ctrl<2>), .out1(out2) ); 
Cap_10f c0 ( .MINUS(out2), .PLUS(cdac) ); 

endmodule

module array3 ( cdac, ctrl<3>, out3<1>, out3<2> ); 
input cdac, ctrl<3>, out3<1>, out3<2>;

cdac_cell2 xi3<1> ( .cdac(cdac), .ctrl<2>(ctrl<3>), .out2(out3<1>) ); 
cdac_cell2 xi3<2> ( .cdac(cdac), .ctrl<2>(ctrl<3>), .out2(out3<2>) ); 

endmodule

module array4 ( cdac, ctrl<4>, out4<1>, out4<2>, out4<3>, out4<4> ); 
input cdac, ctrl<4>, out4<1>, out4<2>, out4<3>, out4<4>;

cdac_cell2 xi4<1> ( .cdac(cdac), .ctrl<2>(ctrl<4>), .out2(out4<1>) ); 
cdac_cell2 xi4<2> ( .cdac(cdac), .ctrl<2>(ctrl<4>), .out2(out4<2>) ); 
cdac_cell2 xi4<3> ( .cdac(cdac), .ctrl<2>(ctrl<4>), .out2(out4<3>) ); 
cdac_cell2 xi4<4> ( .cdac(cdac), .ctrl<2>(ctrl<4>), .out2(out4<4>) ); 

endmodule

module array5 ( cdac, ctrl<5>, out5<1>, out5<2>, out5<3>, out5<4>, out5<5>, out5<6>, out5<7>, out5<8> ); 
input cdac, ctrl<5>, out5<1>, out5<2>, out5<3>, out5<4>, out5<5>, out5<6>, out5<7>, out5<8>;

cdac_cell2 xi5<1> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<1>) ); 
cdac_cell2 xi5<2> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<2>) ); 
cdac_cell2 xi5<3> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<3>) ); 
cdac_cell2 xi5<4> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<4>) ); 
cdac_cell2 xi5<5> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<5>) ); 
cdac_cell2 xi5<6> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<6>) ); 
cdac_cell2 xi5<7> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<7>) ); 
cdac_cell2 xi5<8> ( .cdac(cdac), .ctrl<2>(ctrl<5>), .out2(out5<8>) ); 

endmodule

module DIG_s1_v1 ( CK, CTRL_BTM_A<1>, CTRL_BTM_A<2>, CTRL_BTM_A<3>, CTRL_BTM_A<4>, CTRL_BTM_A<5>, CTRL_BTM_B<1>, CTRL_BTM_B<2>, CTRL_BTM_B<3>, CTRL_BTM_B<4>, CTRL_BTM_B<5>, CTRL_TOP_A<1>, CTRL_TOP_A<2>, CTRL_TOP_A<3>, CTRL_TOP_A<4>, CTRL_TOP_A<5>, CTRL_TOP_B<1>, CTRL_TOP_B<2>, CTRL_TOP_B<3>, CTRL_TOP_B<4>, CTRL_TOP_B<5>, OP<1>, OP<2>, OP<3>, OP<4>, OP<5>, comp_ck, comp_n, comp_p, rdy ); 
input CK, CTRL_BTM_A<1>, CTRL_BTM_A<2>, CTRL_BTM_A<3>, CTRL_BTM_A<4>, CTRL_BTM_A<5>, CTRL_BTM_B<1>, CTRL_BTM_B<2>, CTRL_BTM_B<3>, CTRL_BTM_B<4>, CTRL_BTM_B<5>, CTRL_TOP_A<1>, CTRL_TOP_A<2>, CTRL_TOP_A<3>, CTRL_TOP_A<4>, CTRL_TOP_A<5>, CTRL_TOP_B<1>, CTRL_TOP_B<2>, CTRL_TOP_B<3>, CTRL_TOP_B<4>, CTRL_TOP_B<5>, OP<1>, OP<2>, OP<3>, OP<4>, OP<5>, comp_ck, comp_n, comp_p, rdy;

inv_array_1 xi1 ( .ctrl_btm_a<1>(CTRL_BTM_A<1>), .ctrl_btm_a<2>(CTRL_BTM_A<2>), .ctrl_btm_a<3>(CTRL_BTM_A<3>), .ctrl_btm_a<4>(CTRL_BTM_A<4>), .ctrl_btm_a<5>(CTRL_BTM_A<5>), .ctrl_btm_b<1>(CTRL_BTM_B<1>), .ctrl_btm_b<2>(CTRL_BTM_B<2>), .ctrl_btm_b<3>(CTRL_BTM_B<3>), .ctrl_btm_b<4>(CTRL_BTM_B<4>), .ctrl_btm_b<5>(CTRL_BTM_B<5>), .ctrl_top_a<1>(CTRL_TOP_A<1>), .ctrl_top_a<2>(CTRL_TOP_A<2>), .ctrl_top_a<3>(CTRL_TOP_A<3>), .ctrl_top_a<4>(CTRL_TOP_A<4>), .ctrl_top_a<5>(CTRL_TOP_A<5>), .ctrl_top_b<1>(CTRL_TOP_B<1>), .ctrl_top_b<2>(CTRL_TOP_B<2>), .ctrl_top_b<3>(CTRL_TOP_B<3>), .ctrl_top_b<4>(CTRL_TOP_B<4>), .ctrl_top_b<5>(CTRL_TOP_B<5>), .on<1>(on<1>), .on<2>(on<2>), .on<3>(on<3>), .on<4>(on<4>), .on<5>(on<5>), .op<1>(OP<1>), .op<2>(OP<2>), .op<3>(OP<3>), .op<4>(OP<4>), .op<5>(OP<5>) ); 
INVERTER_2 xi24<1> ( .a(comp_p), .z(net71<0>) ); 
INVERTER_2 xi24<2> ( .a(comp_n), .z(net71<1>) ); 
INVERTER_3 xi25<1> ( .a(net71<0>), .z(comp_p_buf) ); 
INVERTER_3 xi25<2> ( .a(net71<1>), .z(comp_n_buf) ); 
Series_DFF xi6 ( .clkqb<1>(clkqb<1>), .clkqb<2>(clkqb<2>), .clkqb<3>(clkqb<3>), .clkqb<4>(clkqb<4>), .clkqb<5>(clkqb<5>), .clkqb_n<1>(clkqb_n<1>), .clkqb_n<2>(clkqb_n<2>), .clkqb_n<3>(clkqb_n<3>), .clkqb_n<4>(clkqb_n<4>), .clkqb_n<5>(clkqb_n<5>), .cp(rdy), .qbout(qbout), .qbout_n(qbout_n), .r2(CK) ); 
latch_array xi41 ( .clkqb_n<1>(clkqb_n<1>), .clkqb_n<2>(clkqb_n<2>), .clkqb_n<3>(clkqb_n<3>), .clkqb_n<4>(clkqb_n<4>), .clkqb_n<5>(clkqb_n<5>), .comp_n_buf(comp_n_buf), .comp_p_buf(comp_p_buf), .on<1>(on<1>), .on<2>(on<2>), .on<3>(on<3>), .on<4>(on<4>), .on<5>(on<5>), .op<1>(OP<1>), .op<2>(OP<2>), .op<3>(OP<3>), .op<4>(OP<4>), .op<5>(OP<5>) ); 
Comp_CK_Gen xi16 ( .comp_ck(comp_ck), .first_ck(CK), .last_ck(clkqb_n<5>), .rdy(rdy) ); 

endmodule

module inv_array_1 ( ctrl_btm_a<1>, ctrl_btm_a<2>, ctrl_btm_a<3>, ctrl_btm_a<4>, ctrl_btm_a<5>, ctrl_btm_b<1>, ctrl_btm_b<2>, ctrl_btm_b<3>, ctrl_btm_b<4>, ctrl_btm_b<5>, ctrl_top_a<1>, ctrl_top_a<2>, ctrl_top_a<3>, ctrl_top_a<4>, ctrl_top_a<5>, ctrl_top_b<1>, ctrl_top_b<2>, ctrl_top_b<3>, ctrl_top_b<4>, ctrl_top_b<5>, on<1>, on<2>, on<3>, on<4>, on<5>, op<1>, op<2>, op<3>, op<4>, op<5> ); 
input ctrl_btm_a<1>, ctrl_btm_a<2>, ctrl_btm_a<3>, ctrl_btm_a<4>, ctrl_btm_a<5>, ctrl_btm_b<1>, ctrl_btm_b<2>, ctrl_btm_b<3>, ctrl_btm_b<4>, ctrl_btm_b<5>, ctrl_top_a<1>, ctrl_top_a<2>, ctrl_top_a<3>, ctrl_top_a<4>, ctrl_top_a<5>, ctrl_top_b<1>, ctrl_top_b<2>, ctrl_top_b<3>, ctrl_top_b<4>, ctrl_top_b<5>, on<1>, on<2>, on<3>, on<4>, on<5>, op<1>, op<2>, op<3>, op<4>, op<5>;

inv_array_big xi1 ( .ctrl_btm_a<5>(ctrl_btm_a<5>), .ctrl_btm_b<5>(ctrl_btm_b<5>), .ctrl_top_a<5>(ctrl_top_a<5>), .ctrl_top_b<5>(ctrl_top_b<5>), .on<1>(on<1>), .op<1>(op<1>) ); 
inv_array_big xi2 ( .ctrl_btm_a<5>(ctrl_btm_a<4>), .ctrl_btm_b<5>(ctrl_btm_b<4>), .ctrl_top_a<5>(ctrl_top_a<4>), .ctrl_top_b<5>(ctrl_top_b<4>), .on<1>(on<2>), .op<1>(op<2>) ); 
inv_array_small xi3 ( .ctrl_btm_a<5>(ctrl_btm_a<3>), .ctrl_btm_b<5>(ctrl_btm_b<3>), .ctrl_top_a<5>(ctrl_top_a<3>), .ctrl_top_b<5>(ctrl_top_b<3>), .on<1>(on<3>), .op<1>(op<3>) ); 
inv_array_small xi4 ( .ctrl_btm_a<5>(ctrl_btm_a<2>), .ctrl_btm_b<5>(ctrl_btm_b<2>), .ctrl_top_a<5>(ctrl_top_a<2>), .ctrl_top_b<5>(ctrl_top_b<2>), .on<1>(on<4>), .op<1>(op<4>) ); 
inv_array_small xi5 ( .ctrl_btm_a<5>(ctrl_btm_a<1>), .ctrl_btm_b<5>(ctrl_btm_b<1>), .ctrl_top_a<5>(ctrl_top_a<1>), .ctrl_top_b<5>(ctrl_top_b<1>), .on<1>(on<5>), .op<1>(op<5>) ); 

endmodule

module inv_array_big ( ctrl_btm_a<5>, ctrl_btm_b<5>, ctrl_top_a<5>, ctrl_top_b<5>, on<1>, op<1> ); 
input ctrl_btm_a<5>, ctrl_btm_b<5>, ctrl_top_a<5>, ctrl_top_b<5>, on<1>, op<1>;

INVERTER_1 xi30<1> ( .a(op<1>), .z(net049<0>) ); 
INVERTER_4 xi31<1> ( .a(net049<0>), .z(ctrl_top_a<5>) ); 
INVERTER_4 xi10<1> ( .a(on<1>), .z(ctrl_top_b<5>) ); 
INVERTER_1 xi9<1> ( .a(on<1>), .z(net048<0>) ); 
INVERTER_4 xi12<1> ( .a(net048<0>), .z(ctrl_btm_b<5>) ); 
INVERTER_4 xi13<1> ( .a(op<1>), .z(ctrl_btm_a<5>) ); 

endmodule

module INVERTER_1 ( a, z ); 
input a, z;

Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT mn0 ( .D(z), .G(a), .S(VSS) ); 
Switch_PMOS_nfin5_nf2_m1_n12_X1_Y1_SLVT mp0 ( .D(z), .G(a), .S(VDD) ); 

endmodule

module INV<3> ( i, zn ); 
input i, zn;

Switch_NMOS_nfin4_nf6_m1_n12_X2_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_nfin5_nf6_m1_n12_X3_Y1_SLVT M1 ( .D(zn), .G(i), .S(VDD) ); 

endmodule

module INVERTER_4 ( a, z ); 
input a, z;

INV<3> mn0_mp0 ( .i(a), .zn(z) ); 

endmodule

module inv_array_small ( ctrl_btm_a<5>, ctrl_btm_b<5>, ctrl_top_a<5>, ctrl_top_b<5>, on<1>, op<1> ); 
input ctrl_btm_a<5>, ctrl_btm_b<5>, ctrl_top_a<5>, ctrl_top_b<5>, on<1>, op<1>;

INVERTER_1 xi30<1> ( .a(op<1>), .z(net049<0>) ); 
INVERTER_1 xi31<1> ( .a(net049<0>), .z(ctrl_top_a<5>) ); 
INVERTER_1 xi10<1> ( .a(on<1>), .z(ctrl_top_b<5>) ); 
INVERTER_1 xi9<1> ( .a(on<1>), .z(net048<0>) ); 
INVERTER_1 xi12<1> ( .a(net048<0>), .z(ctrl_btm_b<5>) ); 
INVERTER_1 xi13<1> ( .a(op<1>), .z(ctrl_btm_a<5>) ); 

endmodule

module INVERTER_2 ( a, z ); 
input a, z;

Switch_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mn0 ( .D(z), .G(a), .S(VSS) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp0 ( .D(z), .G(a), .S(VDD) ); 

endmodule

module INV<4> ( i, zn ); 
input i, zn;

Switch_NMOS_nfin4_nf4_m1_n12_X2_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_nfin5_nf4_m1_n12_X2_Y1_SLVT M1 ( .D(zn), .G(i), .S(VDD) ); 

endmodule

module INVERTER_3 ( a, z ); 
input a, z;

INV<4> mn0_mp0 ( .i(a), .zn(z) ); 

endmodule

module Series_DFF ( clkqb<1>, clkqb<2>, clkqb<3>, clkqb<4>, clkqb<5>, clkqb_n<1>, clkqb_n<2>, clkqb_n<3>, clkqb_n<4>, clkqb_n<5>, cp, qbout, qbout_n, r2 ); 
input clkqb<1>, clkqb<2>, clkqb<3>, clkqb<4>, clkqb<5>, clkqb_n<1>, clkqb_n<2>, clkqb_n<3>, clkqb_n<4>, clkqb_n<5>, cp, qbout, qbout_n, r2;

INV_DFF_VDD xi33 ( .z(net025) ); 
INVERTER_2 xi32 ( .a(net025), .z(net22) ); 
DFF xi34 ( .cp(net22), .d(net22), .q(qbout), .qn(qbout_n), .rb(r) ); 
INVERTER_2 xi29 ( .a(r2), .z(r) ); 
DFF_v2 xi0 ( .cp(cp), .d(VDD), .q(clkqb<1>), .qn(clkqb_n<1>), .rb(r) ); 
INVERTER_2 xi10 ( .a(clkqb<1>), .z(net86) ); 
INVERTER_2 xi1 ( .a(net86), .z(net013) ); 
DFF xi2 ( .cp(cp), .d(net013), .q(clkqb<2>), .qn(clkqb_n<2>), .rb(r) ); 
INVERTER_2 xi3 ( .a(clkqb<2>), .z(net84) ); 
INVERTER_2 xi4 ( .a(net84), .z(net07) ); 
DFF xi5 ( .cp(cp), .d(net07), .q(clkqb<3>), .qn(clkqb_n<3>), .rb(r) ); 
INVERTER_2 xi6 ( .a(clkqb<3>), .z(net82) ); 
INVERTER_2 xi7 ( .a(net82), .z(net08) ); 
DFF xi8 ( .cp(cp), .d(net08), .q(clkqb<4>), .qn(clkqb_n<4>), .rb(r) ); 
INVERTER_2 xi9 ( .a(clkqb<4>), .z(net80) ); 
INVERTER_2 xi11 ( .a(net80), .z(net03) ); 
DFF xi17 ( .cp(cp), .d(net03), .q(clkqb<5>), .qn(clkqb_n<5>), .rb(r) ); 

endmodule

module INV_DFF_VDD ( z ); 
input z;

Switch_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mn0 ( .D(z), .G(VDD), .S(VSS) ); 
Dummy_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp0 ( .D(z), .S(VDD) ); 

endmodule

module DFF ( cp, d, q, qn, rb ); 
input cp, d, q, qn, rb;

INVERTER_2 xi10 ( .a(cp), .z(cpb) ); 
INVERTER_2 xi9 ( .a(qn), .z(q) ); 
INVERTER_2 xi3 ( .a(net66), .z(net57) ); 
INVERTER_2 xi1 ( .a(d), .z(net64) ); 
INVERTER_2 xi8 ( .a(qn), .z(net62) ); 
TM_Gate xi5 ( .ck(cp), .ckb(cpb), .in(net57), .out(net58) ); 
TM_Gate xi0 ( .ck(cpb), .ckb(cp), .in(net64), .out(net66) ); 
TM_Gate xi6 ( .ck(cpb), .ckb(cp), .in(net62), .out(net58) ); 
TM_Gate xi2 ( .ck(cp), .ckb(cpb), .in(net65), .out(net66) ); 
NAND xi11 ( .a(rb), .b(net58), .z(qn) ); 
NAND xi4 ( .a(net57), .b(rb), .z(net65) ); 

endmodule

module TM_Gate ( ck, ckb, in, out ); 
input ck, ckb, in, out;

Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn0 ( .B(VSS), .D(in), .G(ck), .S(out) ); 
Switch_PMOS_B_nfin5_nf1_m1_n12_X1_Y1_SLVT mp0 ( .B(VDD), .D(out), .G(ckb), .S(in) ); 

endmodule

module NAND ( a, b, z ); 
input a, b, z;

Switch_NMOS_B_nfin4_nf2_m1_n12_X1_Y1_SLVT mn2 ( .B(VSS), .D(z), .G(b), .S(net46) ); 
Switch_NMOS_B_nfin4_nf2_m1_n12_X1_Y1_SLVT mn1 ( .B(VSS), .D(z), .G(a), .S(net47) ); 
Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT mn3 ( .D(net46), .G(a), .S(VSS) ); 
Switch_NMOS_nfin4_nf2_m1_n12_X1_Y1_SLVT mn0 ( .D(net47), .G(b), .S(VSS) ); 
Switch_PMOS_nfin5_nf2_m1_n12_X1_Y1_SLVT mp0 ( .D(z), .G(b), .S(VDD) ); 
Switch_PMOS_nfin5_nf2_m1_n12_X1_Y1_SLVT mp1 ( .D(z), .G(a), .S(VDD) ); 

endmodule

module DFF_v2 ( cp, d, q, qn, rb ); 
input cp, d, q, qn, rb;

INVERTER_2 xi12 ( .a(qn), .z(q) ); 
INVERTER_2 xi10 ( .a(cp), .z(cpb) ); 
INVERTER_2 xi7 ( .a(cpb), .z(cpd) ); 
INVERTER_2 xi9 ( .a(net017), .z(net016) ); 
INVERTER_2 xi15 ( .a(net57), .z(net65) ); 
TM_Gate xi5 ( .ck(cpd), .ckb(cpb), .in(net57), .out(qn) ); 
TM_Gate xi0 ( .ck(cpb), .ckb(cpd), .in(d), .out(net66) ); 
TM_Gate xi6 ( .ck(cpb), .ckb(cpd), .in(net014), .out(qn) ); 
TM_Gate xi2 ( .ck(cpd), .ckb(cpb), .in(net65), .out(net66) ); 
NAND xi13 ( .a(rb), .b(net66), .z(net57) ); 
NAND xi14 ( .a(q), .b(rb), .z(net014) ); 

endmodule

module latch_array ( clkqb_n<1>, clkqb_n<2>, clkqb_n<3>, clkqb_n<4>, clkqb_n<5>, comp_n_buf, comp_p_buf, on<1>, on<2>, on<3>, on<4>, on<5>, op<1>, op<2>, op<3>, op<4>, op<5> ); 
input clkqb_n<1>, clkqb_n<2>, clkqb_n<3>, clkqb_n<4>, clkqb_n<5>, comp_n_buf, comp_p_buf, on<1>, on<2>, on<3>, on<4>, on<5>, op<1>, op<2>, op<3>, op<4>, op<5>;

Latch_new_1 xi5<1> ( .ckinb(clkqb_n<1>), .inn(comp_n_buf), .inp(comp_p_buf), .on(on<1>), .op(op<1>) ); 
Latch_new_1 xi5<2> ( .ckinb(clkqb_n<2>), .inn(comp_n_buf), .inp(comp_p_buf), .on(on<2>), .op(op<2>) ); 
Latch_new_2 xi5<3> ( .ckinb(clkqb_n<3>), .inn(comp_n_buf), .inp(comp_p_buf), .on(on<3>), .op(op<3>) ); 
Latch_new_2 xi5<4> ( .ckinb(clkqb_n<4>), .inn(comp_n_buf), .inp(comp_p_buf), .on(on<4>), .op(op<4>) ); 
Latch_new_2 xi5<5> ( .ckinb(clkqb_n<5>), .inn(comp_n_buf), .inp(comp_p_buf), .on(on<5>), .op(op<5>) ); 

endmodule

module Latch_new_1 ( ckinb, inn, inp, on, op ); 
input ckinb, inn, inp, on, op;

Switch_PMOS_nfin4_nf4_m1_n12_X2_Y1_SLVT mp1 ( .D(net11), .G(ckinb), .S(VDD) ); 
Switch_PMOS_B_nfin4_nf2_m1_n12_X1_Y1_SLVT mp0 ( .B(VDD), .D(net4), .G(net22), .S(net25) ); 
Switch_PMOS_nfin4_nf4_m1_n12_X2_Y1_SLVT mp15 ( .D(net25), .G(ckinb), .S(VDD) ); 
INVERTER_1 xi5 ( .a(mp), .z(op) ); 
INVERTER_1 xi6 ( .a(mn), .z(on) ); 
INV xi4 ( .a(net17), .z(net22) ); 
NOR2 xi0 ( .a(mn), .b(mp), .z(net17) ); 
CCP_PMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mp4_mp6 ( .B(VDD), .DA(mp), .DB(mn), .S(net11) ); 
CCP_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mn0_mn5 ( .DA(mp), .DB(mn), .S(VSS) ); 
CMC_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mn2_mn1 ( .DA(mp), .DB(mn), .G(ckinb), .S(VSS) ); 
DP_PMOS_B_nfin4_nf2_m1_n12_X1_Y1_SLVT mp3_mp2 ( .B(VDD), .DA(mp), .DB(mn), .GA(inp), .GB(inn), .S(net4) ); 

endmodule

module INV<5> ( i, zn ); 
input i, zn;

Switch_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT M1 ( .D(zn), .G(i), .S(VDD) ); 

endmodule

module INV_B ( SP, i, zn ); 
input SP, i, zn;

Switch_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT M0 ( .D(zn), .G(i), .S(VSS) ); 
Switch_PMOS_B_nfin5_nf1_m1_n12_X1_Y1_SLVT M1 ( .B(VDD), .D(zn), .G(i), .S(SP) ); 

endmodule

module NOR2 ( a, b, z ); 
input a, b, z;

Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp5 ( .D(net33), .G(b), .S(VDD) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp3 ( .D(net34), .G(a), .S(VDD) ); 
INV_B mn3_mp6 ( .SP(net33), .i(a), .zn(z) ); 
INV_B mn0_mp4 ( .SP(net34), .i(b), .zn(z) ); 

endmodule

module Latch_new_2 ( ckinb, inn, inp, on, op ); 
input ckinb, inn, inp, on, op;

Switch_PMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mp1 ( .D(net11), .G(ckinb), .S(VDD) ); 
Switch_PMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mp0 ( .B(VDD), .D(net4), .G(net22), .S(net25) ); 
Switch_PMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mp15 ( .D(net25), .G(ckinb), .S(VDD) ); 
INVERTER_2 xi5 ( .a(mp), .z(op) ); 
INVERTER_2 xi6 ( .a(mn), .z(on) ); 
INV xi4 ( .a(net17), .z(net22) ); 
NOR2 xi0 ( .a(mn), .b(mp), .z(net17) ); 
CCP_PMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mp4_mp6 ( .B(VDD), .DA(mp), .DB(mn), .S(net11) ); 
CCP_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mn0_mn5 ( .DA(mp), .DB(mn), .S(VSS) ); 
CMC_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT mn2_mn1 ( .DA(mp), .DB(mn), .G(ckinb), .S(VSS) ); 
DP_PMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mp3_mp2 ( .B(VDD), .DA(mp), .DB(mn), .GA(inp), .GB(inn), .S(net4) ); 

endmodule

module Comp_CK_Gen ( comp_ck, first_ck, last_ck, rdy ); 
input comp_ck, first_ck, last_ck, rdy;

INVERTER_2 xi9 ( .a(net033), .z(comp_ck) ); 
INVERTER_2 xi18 ( .a(rdy), .z(net021) ); 
INVERTER_2 xi2 ( .a(first_ck), .z(net016) ); 
NAND3 xi1 ( .a(last_ck), .b(net021), .c(net016), .z(net033) ); 

endmodule

module CMC_S_NMOS ( DA, DB, G, SA ); 
input DA, DB, G, SA;

Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT M0 ( .B(VSS), .D(DA), .G(G), .S(SA) ); 
Switch_NMOS_nfin4_nf1_m1_n12_X1_Y1_SLVT M1 ( .D(DB), .G(G), .S(VSS) ); 

endmodule

module NAND3 ( a, b, c, z ); 
input a, b, c, z;

Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn8 ( .B(VSS), .D(z), .G(c), .S(net70) ); 
Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn2 ( .B(VSS), .D(z), .G(b), .S(net71) ); 
Switch_NMOS_B_nfin4_nf1_m1_n12_X1_Y1_SLVT mn1 ( .B(VSS), .D(z), .G(a), .S(net72) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp2 ( .D(z), .G(c), .S(VDD) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp0 ( .D(z), .G(b), .S(VDD) ); 
Switch_PMOS_nfin5_nf1_m1_n12_X1_Y1_SLVT mp1 ( .D(z), .G(a), .S(VDD) ); 
CMC_S_NMOS mn7_mn5 ( .DA(net70), .DB(net74), .G(a), .SA(net73) ); 
CMC_S_NMOS mn0_mn6 ( .DA(net72), .DB(net73), .G(b), .SA(net75) ); 
CMC_S_NMOS mn3_mn4 ( .DA(net71), .DB(net75), .G(c), .SA(net74) ); 

endmodule

module comp1_calib_v3 ( OUTN, OUTP, spi_n<1>, spi_n<2>, spi_n<3>, spi_n<4>, spi_n<5>, spi_n<6>, spi_n<7>, spi_n<8>, spi_p<1>, spi_p<2>, spi_p<3>, spi_p<4>, spi_p<5>, spi_p<6>, spi_p<7>, spi_p<8> ); 
input OUTN, OUTP, spi_n<1>, spi_n<2>, spi_n<3>, spi_n<4>, spi_n<5>, spi_n<6>, spi_n<7>, spi_n<8>, spi_p<1>, spi_p<2>, spi_p<3>, spi_p<4>, spi_p<5>, spi_p<6>, spi_p<7>, spi_p<8>;

inv_array_calib xi2 ( .ctrlp<1>(ctrln<1>), .ctrlp<2>(ctrln<2>), .ctrlp<3>(ctrln<3>), .ctrlp<4>(ctrln<4>), .ctrlp<5>(ctrln<5>), .ctrlp<6>(ctrln<6>), .ctrlp<7>(ctrln<7>), .ctrlp<8>(ctrln<8>), .spi_p<1>(spi_n<1>), .spi_p<2>(spi_n<2>), .spi_p<3>(spi_n<3>), .spi_p<4>(spi_n<4>), .spi_p<5>(spi_n<5>), .spi_p<6>(spi_n<6>), .spi_p<7>(spi_n<7>), .spi_p<8>(spi_n<8>) ); 
inv_array_calib xi1 ( .ctrlp<1>(ctrlp<1>), .ctrlp<2>(ctrlp<2>), .ctrlp<3>(ctrlp<3>), .ctrlp<4>(ctrlp<4>), .ctrlp<5>(ctrlp<5>), .ctrlp<6>(ctrlp<6>), .ctrlp<7>(ctrlp<7>), .ctrlp<8>(ctrlp<8>), .spi_p<1>(spi_p<1>), .spi_p<2>(spi_p<2>), .spi_p<3>(spi_p<3>), .spi_p<4>(spi_p<4>), .spi_p<5>(spi_p<5>), .spi_p<6>(spi_p<6>), .spi_p<7>(spi_p<7>), .spi_p<8>(spi_p<8>) ); 
res_array xi4 ( .ctrlp<1>(ctrln<1>), .ctrlp<2>(ctrln<2>), .ctrlp<3>(ctrln<3>), .ctrlp<4>(ctrln<4>), .ctrlp<5>(ctrln<5>), .ctrlp<6>(ctrln<6>), .ctrlp<7>(ctrln<7>), .ctrlp<8>(ctrln<8>), .outp(OUTN) ); 
res_array xi3 ( .ctrlp<1>(ctrlp<1>), .ctrlp<2>(ctrlp<2>), .ctrlp<3>(ctrlp<3>), .ctrlp<4>(ctrlp<4>), .ctrlp<5>(ctrlp<5>), .ctrlp<6>(ctrlp<6>), .ctrlp<7>(ctrlp<7>), .ctrlp<8>(ctrlp<8>), .outp(OUTP) ); 

endmodule

module inv_array_calib ( ctrlp<1>, ctrlp<2>, ctrlp<3>, ctrlp<4>, ctrlp<5>, ctrlp<6>, ctrlp<7>, ctrlp<8>, spi_p<1>, spi_p<2>, spi_p<3>, spi_p<4>, spi_p<5>, spi_p<6>, spi_p<7>, spi_p<8> ); 
input ctrlp<1>, ctrlp<2>, ctrlp<3>, ctrlp<4>, ctrlp<5>, ctrlp<6>, ctrlp<7>, ctrlp<8>, spi_p<1>, spi_p<2>, spi_p<3>, spi_p<4>, spi_p<5>, spi_p<6>, spi_p<7>, spi_p<8>;

inv_array_calib_1 xi1 ( .net036<0>(net036<0>), .net036<1>(net036<1>), .net036<2>(net036<2>), .net036<3>(net036<3>), .net036<4>(net036<4>), .net036<5>(net036<5>), .net036<6>(net036<6>), .net036<7>(net036<7>), .spi_p<1>(spi_p<1>), .spi_p<2>(spi_p<2>), .spi_p<3>(spi_p<3>), .spi_p<4>(spi_p<4>), .spi_p<5>(spi_p<5>), .spi_p<6>(spi_p<6>), .spi_p<7>(spi_p<7>), .spi_p<8>(spi_p<8>) ); 
inv_array_calib_2 xi2 ( .ctrlp<1>(ctrlp<1>), .ctrlp<2>(ctrlp<2>), .ctrlp<3>(ctrlp<3>), .ctrlp<4>(ctrlp<4>), .ctrlp<5>(ctrlp<5>), .ctrlp<6>(ctrlp<6>), .ctrlp<7>(ctrlp<7>), .ctrlp<8>(ctrlp<8>), .net036<0>(net036<0>), .net036<1>(net036<1>), .net036<2>(net036<2>), .net036<3>(net036<3>), .net036<4>(net036<4>), .net036<5>(net036<5>), .net036<6>(net036<6>), .net036<7>(net036<7>) ); 

endmodule

module inv_array_calib_1 ( net036<0>, net036<1>, net036<2>, net036<3>, net036<4>, net036<5>, net036<6>, net036<7>, spi_p<1>, spi_p<2>, spi_p<3>, spi_p<4>, spi_p<5>, spi_p<6>, spi_p<7>, spi_p<8> ); 
input net036<0>, net036<1>, net036<2>, net036<3>, net036<4>, net036<5>, net036<6>, net036<7>, spi_p<1>, spi_p<2>, spi_p<3>, spi_p<4>, spi_p<5>, spi_p<6>, spi_p<7>, spi_p<8>;

INV_calib xi24<1> ( .a(spi_p<8>), .z(net036<0>) ); 
INV_calib xi24<2> ( .a(spi_p<7>), .z(net036<1>) ); 
INV_calib xi24<3> ( .a(spi_p<6>), .z(net036<2>) ); 
INV_calib xi24<4> ( .a(spi_p<5>), .z(net036<3>) ); 
INV_calib xi24<5> ( .a(spi_p<4>), .z(net036<4>) ); 
INV_calib xi24<6> ( .a(spi_p<3>), .z(net036<5>) ); 
INV_calib xi24<7> ( .a(spi_p<2>), .z(net036<6>) ); 
INV_calib xi24<8> ( .a(spi_p<1>), .z(net036<7>) ); 

endmodule

module INV_calib ( a, z ); 
input a, z;

INV mn0_mp0 ( .i(a), .zn(z) ); 

endmodule

module inv_array_calib_2 ( ctrlp<1>, ctrlp<2>, ctrlp<3>, ctrlp<4>, ctrlp<5>, ctrlp<6>, ctrlp<7>, ctrlp<8>, net036<0>, net036<1>, net036<2>, net036<3>, net036<4>, net036<5>, net036<6>, net036<7> ); 
input ctrlp<1>, ctrlp<2>, ctrlp<3>, ctrlp<4>, ctrlp<5>, ctrlp<6>, ctrlp<7>, ctrlp<8>, net036<0>, net036<1>, net036<2>, net036<3>, net036<4>, net036<5>, net036<6>, net036<7>;

INV_calib xi0<1> ( .a(net036<0>), .z(ctrlp<8>) ); 
INV_calib xi0<2> ( .a(net036<1>), .z(ctrlp<7>) ); 
INV_calib xi0<3> ( .a(net036<2>), .z(ctrlp<6>) ); 
INV_calib xi0<4> ( .a(net036<3>), .z(ctrlp<5>) ); 
INV_calib xi0<5> ( .a(net036<4>), .z(ctrlp<4>) ); 
INV_calib xi0<6> ( .a(net036<5>), .z(ctrlp<3>) ); 
INV_calib xi0<7> ( .a(net036<6>), .z(ctrlp<2>) ); 
INV_calib xi0<8> ( .a(net036<7>), .z(ctrlp<1>) ); 

endmodule

module res_array ( ctrlp<1>, ctrlp<2>, ctrlp<3>, ctrlp<4>, ctrlp<5>, ctrlp<6>, ctrlp<7>, ctrlp<8>, outp ); 
input ctrlp<1>, ctrlp<2>, ctrlp<3>, ctrlp<4>, ctrlp<5>, ctrlp<6>, ctrlp<7>, ctrlp<8>, outp;

Res_1917p65 r13 ( .MINUS(net016), .PLUS(ctrlp<1>) ); 
Res_958p82 r14 ( .MINUS(net027), .PLUS(net016) ); 
Res_1917p65 r39 ( .MINUS(outp), .PLUS(net016) ); 
Res_1917p65 r40 ( .MINUS(outp), .PLUS(VSS) ); 
Cap_15f c1 ( .MINUS(outp), .PLUS(VSS) ); 
Res_1917p65 r12 ( .MINUS(net027), .PLUS(ctrlp<2>) ); 
Res_958p82 r9 ( .MINUS(net032), .PLUS(net027) ); 
Res_1917p65 r15 ( .MINUS(net032), .PLUS(ctrlp<3>) ); 
Res_958p82 r16 ( .MINUS(net032), .PLUS(net025) ); 
Res_1917p65 r10 ( .MINUS(net025), .PLUS(ctrlp<4>) ); 
Res_958p82 r5 ( .MINUS(net025), .PLUS(net024) ); 
Res_1917p65 r7 ( .MINUS(net024), .PLUS(ctrlp<5>) ); 
Res_958p82 r8 ( .MINUS(net024), .PLUS(net023) ); 
Res_1917p65 r6 ( .MINUS(net023), .PLUS(ctrlp<6>) ); 
Res_958p82 r4 ( .MINUS(net023), .PLUS(net022) ); 
Res_1917p65 r3 ( .MINUS(net022), .PLUS(ctrlp<7>) ); 
Res_958p82 r2 ( .MINUS(net022), .PLUS(net011) ); 
Res_1917p65 r1 ( .MINUS(net011), .PLUS(ctrlp<8>) ); 
Res_1917p65 r0 ( .MINUS(net011), .PLUS(VSS) ); 

endmodule

`celldefine
module global_power;
supply0 VSS;
supply1 VDD;
endmodule
`endcelldefine