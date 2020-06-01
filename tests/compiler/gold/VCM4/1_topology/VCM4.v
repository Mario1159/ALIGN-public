//Verilog block level netlist file for VCM4
//Generated by UMN for ALIGN project 


module CMB_PMOS_2 ( B, DA, DB, DC, S ); 
input B, DA, DB, DC, S;

Switch_PMOS_n12_X1_Y1 M2 ( .B(B), .D(DC), .G(DA), .S(S) ); 
SCM_PMOS_n12_X1_Y1 M0_M1 ( .B(B), .DA(DA), .S(S), .DB(DB) ); 

endmodule

module VCM4 ( ibias, vcm, vfb ); 
input ibias, vcm, vfb;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(gnd), .D(vfb), .G(net84), .S(gnd) ); 
Dcap_PMOS_n12_X1_Y1 xm4 ( .B(vfb), .S(vfb), .G(net84) ); 
CMB_PMOS_2 xm29_xm1_xm17 ( .B(vdd), .DA(ibias), .S(vdd), .DB(vfb), .DC(net022) ); 
SCM_NMOS_n12_X1_Y1 xm3_xm2 ( .B(gnd), .DA(net80), .S(gnd), .DB(net84) ); 
DP_PMOS_n12_X1_Y1 xm19_xm21 ( .B(vdd), .DA(net84), .GA(vcm), .S(net022), .DB(net80), .GB(vfb) ); 

endmodule

`celldefine
module global_power;
supply0 gnd;
supply1 vdd;
endmodule
`endcelldefine
