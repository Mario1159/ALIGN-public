//Verilog block level netlist file for CTDTDSM_V3
//Generated by UMN for ALIGN project 


module CTDTDSM_V3 ( avdd_sar, avss, botep<0>, botep<1>, botep<2>, botep<3>, botp<0>, botp<1>, botp<2>, botp<3>, clk, csel<0>, csel<1>, csel<2>, dout<0>, dout<1>, dout<2>, dout<3>, ib_ota, in, ip, mclk, nsbsp<1>, nsbsp<2>, phsbuf, vb_clk, vb_samp, vcas, vcmi, vdd_int, veld, vintn<0>, vintn<1>, vintn<2>, vintp<0>, vintp<1>, vintp<2>, vrefn, vrefnd, vrefp, vrefpd, vsw, xn, xp, yn, yp ); 
input avdd_sar, avss, botep<0>, botep<1>, botep<2>, botep<3>, botp<0>, botp<1>, botp<2>, botp<3>, clk, csel<0>, csel<1>, csel<2>, dout<0>, dout<1>, dout<2>, dout<3>, ib_ota, in, ip, mclk, nsbsp<1>, nsbsp<2>, phsbuf, vb_clk, vb_samp, vcas, vcmi, vdd_int, veld, vintn<0>, vintn<1>, vintn<2>, vintp<0>, vintp<1>, vintp<2>, vrefn, vrefnd, vrefp, vrefpd, vsw, xn, xp, yn, yp;

NSSAR4B_wELD_V2A xi58 ( .avdd(avdd_sar), .avss(avss), .botep<3>(botep<3>), .botep<2>(botep<2>), .botep<1>(botep<1>), .botep<0>(botep<0>), .botp<3>(botp<3>), .botp<2>(botp<2>), .botp<1>(botp<1>), .botp<0>(botp<0>), .clk(clk), .clkb(clkb), .d<3>(d<3>), .d<2>(d<2>), .d<1>(d<1>), .d<0>(d<0>), .db<3>(db<3>), .db<2>(db<2>), .db<1>(db<1>), .db<0>(db<0>), .din(din), .dip(dip), .dout<3>(dout<3>), .dout<2>(dout<2>), .dout<1>(dout<1>), .dout<0>(dout<0>), .f1(mclk), .gt(net036), .ns<2>(ns<2>), .ns<1>(ns<1>), .nsbs<2>(nsbsp<2>), .nsbs<1>(nsbsp<1>), .phsbuf(phsbuf), .s<4>(net046<0>), .s<3>(net046<1>), .s<2>(net046<2>), .s<1>(net046<3>), .sc<4>(sc<4>), .sc<3>(sc<3>), .sc<2>(sc<2>), .sc<1>(sc<1>), .vb_clk(vb_clk), .vb_samp(vb_samp), .veld(veld), .vin(yn), .vintn<2>(vintn<2>), .vintn<1>(vintn<1>), .vintn<0>(vintn<0>), .vintp<2>(vintp<2>), .vintp<1>(vintp<1>), .vintp<0>(vintp<0>), .vip(yp), .vref(vcmi), .vrefn(vrefn), .vrefp(vrefp), .vsw(vsw) ); 
INVX4 xi60<2> ( .i(dout<2>), .vdd(dvdd), .vss(dvss), .zn(net026<0>) ); 
INVX4 xi60<1> ( .i(dout<1>), .vdd(dvdd), .vss(dvss), .zn(net026<1>) ); 
INVX4 xi60<0> ( .i(dout<0>), .vdd(dvdd), .vss(dvss), .zn(net026<2>) ); 
Res_100 xr7 ( .PLUS(ip), .MINUS(xp) ); 
Res_100 xr6 ( .PLUS(in), .MINUS(xn) ); 
INT_V3 xi39 ( .cs<2>(net043<0>), .cs<1>(net043<1>), .cs<0>(net043<2>), .c_sel<2>(csel<2>), .c_sel<1>(csel<1>), .c_sel<0>(csel<0>), .ib(ib_ota), .vcas(vcas), .vcmi(vcmi), .vdd(vdd_int), ._net0(xn), ._net1(xp), ._net3(yp), ._net2(yn), .vss(avss) ); 
INVX12 xi54 ( .i(net015), .vdd(dvdd), .vss(dvss), .zn(doutl<3>) ); 
INVX12 xi53 ( .i(phsbuf), .vdd(avdd_sar), .vss(avss), .zn(net045) ); 
INVX8 xi56<2> ( .i(net026<0>), .vdd(dvdd), .vss(dvss), .zn(doutl<2>) ); 
INVX8 xi56<1> ( .i(net026<1>), .vdd(dvdd), .vss(dvss), .zn(doutl<1>) ); 
INVX8 xi56<0> ( .i(net026<2>), .vdd(dvdd), .vss(dvss), .zn(doutl<0>) ); 
INVX6 xi59 ( .i(dout<3>), .vdd(dvdd), .vss(dvss), .zn(net015) ); 
Retiming_DAC xi7<15> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<14> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<13> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<12> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<11> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<10> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<9> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<8> ( .clkb(net045), .d(doutl<3>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<7> ( .clkb(net045), .d(doutl<2>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<6> ( .clkb(net045), .d(doutl<2>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<5> ( .clkb(net045), .d(doutl<2>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<4> ( .clkb(net045), .d(doutl<2>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<3> ( .clkb(net045), .d(doutl<1>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<2> ( .clkb(net045), .d(doutl<1>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 
Retiming_DAC xi7<1> ( .clkb(net045), .d(doutl<0>), .ion(xp), .iop(xn), .vdd(dvdd), .vrefn(vrefnd), .vrefp(vrefpd), .vss(dvss) ); 

endmodule

module NSSAR4B_wELD_V2A ( avdd, avss, botep<0>, botep<1>, botep<2>, botep<3>, botp<0>, botp<1>, botp<2>, botp<3>, clk, clkb, d<0>, d<1>, d<2>, d<3>, db<0>, db<1>, db<2>, db<3>, din, dip, dout<0>, dout<1>, dout<2>, dout<3>, f1, gt, ns<1>, ns<2>, nsbs<1>, nsbs<2>, phsbuf, s<1>, s<2>, s<3>, s<4>, sc<1>, sc<2>, sc<3>, sc<4>, vb_clk, vb_samp, veld, vin, vintn<0>, vintn<1>, vintn<2>, vintp<0>, vintp<1>, vintp<2>, vip, vref, vrefn, vrefp, vsw ); 
input avdd, avss, botep<0>, botep<1>, botep<2>, botep<3>, botp<0>, botp<1>, botp<2>, botp<3>, clk, clkb, d<0>, d<1>, d<2>, d<3>, db<0>, db<1>, db<2>, db<3>, din, dip, dout<0>, dout<1>, dout<2>, dout<3>, f1, gt, ns<1>, ns<2>, nsbs<1>, nsbs<2>, phsbuf, s<1>, s<2>, s<3>, s<4>, sc<1>, sc<2>, sc<3>, sc<4>, vb_clk, vb_samp, veld, vin, vintn<0>, vintn<1>, vintn<2>, vintp<0>, vintp<1>, vintp<2>, vip, vref, vrefn, vrefp, vsw;

INVX2 xi4<1> ( .i(ns<2>), .vdd(avdd), .vss(avss), .zn(net011<0>) ); 
INVX2 xi4<2> ( .i(ns<1>), .vdd(avdd), .vss(avss), .zn(net011<1>) ); 
INVX2 xi198 ( .i(net07), .vdd(avdd), .vss(avss), .zn(net06) ); 
INVX4 xi197<1> ( .i(net011<0>), .vdd(avdd), .vss(avss), .zn(net012<0>) ); 
INVX4 xi197<2> ( .i(net011<1>), .vdd(avdd), .vss(avss), .zn(net012<1>) ); 
INVX4 xi199 ( .i(net06), .vdd(avdd), .vss(avss), .zn(phs) ); 
Dcap_NMOS_n12_X1_Y1 xm0 ( .B(avss), .S(avss), .G(avdd) ); 
LOGIC_DOUT_V2 xi177 ( .clk(clke), .d<3>(dbn<3>), .d<2>(dbn<2>), .d<1>(dbn<1>), .d<0>(dbn<0>), .doe<3>(dop<3>), .doe<2>(dop<2>), .doe<1>(dop<1>), .doe<0>(dop<0>), .doeb<3>(don<3>), .doeb<2>(don<2>), .doeb<1>(don<1>), .doeb<0>(don<0>), .dout<3>(dout<3>), .dout<2>(dout<2>), .dout<1>(dout<1>), .dout<0>(dout<0>), .vdd(dvdd), .vss(dvss) ); 
SC4B_wELD_V2 xi172 ( .avdd(avdd), .avss(avss), .bot<3>(botn<3>), .bot<2>(botn<2>), .bot<1>(botn<1>), .bot<0>(botn<0>), .bote<3>(boten<3>), .bote<2>(boten<2>), .bote<1>(boten<1>), .bote<0>(boten<0>), .d<3>(d<3>), .d<2>(db<2>), .d<1>(db<1>), .d<0>(db<0>), .de<3>(deb<3>), .de<2>(deb<2>), .de<1>(deb<1>), .de<0>(deb<0>), .ns<2>(net012<0>), .ns<1>(net012<1>), .nsbs<2>(net38<0>), .nsbs<1>(net38<1>), .phs(phs), .veld(veld), .vin(vin), .vint<2>(vintn<2>), .vint<1>(vintn<1>), .vint<0>(vintn<0>), .vref(vref), .vrefn(vrefn), .vrefp(vrefp), .vsw(net03) ); 
SC4B_wELD_V2 xi170 ( .avdd(avdd), .avss(avss), .bot<3>(botp<3>), .bot<2>(botp<2>), .bot<1>(botp<1>), .bot<0>(botp<0>), .bote<3>(botep<3>), .bote<2>(botep<2>), .bote<1>(botep<1>), .bote<0>(botep<0>), .d<3>(db<3>), .d<2>(d<2>), .d<1>(d<1>), .d<0>(d<0>), .de<3>(de<3>), .de<2>(de<2>), .de<1>(de<1>), .de<0>(de<0>), .ns<2>(net012<0>), .ns<1>(net012<1>), .nsbs<2>(nsbs<2>), .nsbs<1>(nsbs<1>), .phs(phs), .veld(veld), .vin(vip), .vint<2>(vintp<2>), .vint<1>(vintp<1>), .vint<0>(vintp<0>), .vref(vref), .vrefn(vrefn), .vrefp(vrefp), .vsw(vsw) ); 
LOGIC_ELD xi176 ( .de<3>(deb<3>), .de<2>(deb<2>), .de<1>(deb<1>), .de<0>(deb<0>), .do<3>(don<3>), .do<2>(don<2>), .do<1>(don<1>), .do<0>(don<0>), .phe(phe), .vdd(dvdd), .vss(dvss) ); 
LOGIC_ELD xi173 ( .de<3>(de<3>), .de<2>(de<2>), .de<1>(de<1>), .de<0>(de<0>), .do<3>(dop<3>), .do<2>(dop<2>), .do<1>(dop<1>), .do<0>(dop<0>), .phe(phe), .vdd(dvdd), .vss(dvss) ); 
CLK_COMP xi189 ( .clk(clk), .clkbo(clkb), .dn(din), .dp(dip), .gt(gt), .vb(vb_clk), .vdd(avdd), .vin(vintp<0>), .vinb(vintn<0>), .vintn<2>(vintn<2>), .vintn<1>(vintn<1>), .vintp<2>(vintp<2>), .vintp<1>(vintp<1>), .vss(avss) ); 
Dcap_PMOS_n12_X1_Y1 xm1 ( .B(avdd), .S(avss), .G(avdd) ); 
BUF248 xi206 ( .in(phs), .out(phsbuf), .outa(net05) ); 
NSSAR_LOGIC_ELD_V2 xi174 ( .clk(clkb), .clke(clke), .d<3>(d<3>), .d<2>(d<2>), .d<1>(d<1>), .d<0>(d<0>), .db<3>(db<3>), .db<2>(db<2>), .db<1>(db<1>), .db<0>(db<0>), .dbn<3>(dbn<3>), .dbn<2>(dbn<2>), .dbn<1>(dbn<1>), .dbn<0>(dbn<0>), .din(din), .dip(dip), .f1(f1), .gt(gt), .ns<2>(ns<2>), .ns<1>(ns<1>), .phe(phe), .phs(net07), .s<4>(s<4>), .s<3>(s<3>), .s<2>(s<2>), .s<1>(s<1>), .sc<4>(sc<4>), .sc<3>(sc<3>), .sc<2>(sc<2>), .sc<1>(sc<1>), .vb(vb_samp) ); 

endmodule

module INVX2 ( i, vdd, vss, zn ); 
input i, vdd, vss, zn;

Switch_NMOS_n12_X1_Y1 xm1 ( .B(vss), .D(zn), .G(i), .S(vss) ); 
Switch_PMOS_n12_X1_Y1 xm0 ( .B(vdd), .D(zn), .G(i), .S(vdd) ); 

endmodule

module INVX4 ( i, vdd, vss, zn ); 
input i, vdd, vss, zn;

Switch_NMOS_n12_X1_Y1 xm1 ( .B(vss), .D(zn), .G(i), .S(vss) ); 
Switch_PMOS_n12_X1_Y1 xm0 ( .B(vdd), .D(zn), .G(i), .S(vdd) ); 

endmodule

module LOGIC_DOUT_V2 ( clk, d<0>, d<1>, d<2>, d<3>, doe<0>, doe<1>, doe<2>, doe<3>, doeb<0>, doeb<1>, doeb<2>, doeb<3>, dout<0>, dout<1>, dout<2>, dout<3>, vdd, vss ); 
input clk, d<0>, d<1>, d<2>, d<3>, doe<0>, doe<1>, doe<2>, doe<3>, doeb<0>, doeb<1>, doeb<2>, doeb<3>, dout<0>, dout<1>, dout<2>, dout<3>, vdd, vss;

INVX4 xi3 ( .i(net10), .vdd(vdd), .vss(vss), .zn(clkd) ); 
INVX2 xi2 ( .i(clk), .vdd(vdd), .vss(vss), .zn(net10) ); 
DFF_TSPC_V2 xi1<3> ( .clk(clkd), .d(d<3>), .q(dop<3>) ); 
DFF_TSPC_V2 xi1<2> ( .clk(clkd), .d(d<2>), .q(dop<2>) ); 
DFF_TSPC_V2 xi1<1> ( .clk(clkd), .d(d<1>), .q(dop<1>) ); 
DFF_TSPC_V2 xi1<0> ( .clk(clkd), .d(d<0>), .q(dop<0>) ); 
BUF22444 xi18 ( .in(dop<3>), .out(doe<3>), .outb(doeb<3>), .outbb(dout<3>) ); 
BUF22444 xi36 ( .in(dop<0>), .out(doe<0>), .outb(doeb<0>), .outbb(dout<0>) ); 
BUF22444 xi35 ( .in(dop<1>), .out(doe<1>), .outb(doeb<1>), .outbb(dout<1>) ); 
BUF22444 xi34 ( .in(dop<2>), .out(doe<2>), .outb(doeb<2>), .outbb(dout<2>) ); 

endmodule

module DFF_TSPC_V2 ( clk, d, q ); 
input clk, d, q;

Switch_NMOS_n12_X1_Y1 xm20 ( .B(dvss), .D(net018), .G(net09), .S(dvss) ); 
Switch_NMOS_n12_X1_Y1 xm19 ( .B(dvss), .D(net012), .G(clk), .S(net018) ); 
Switch_NMOS_n12_X1_Y1 xm16 ( .B(dvss), .D(q), .G(net012), .S(dvss) ); 
Switch_NMOS_n12_X1_Y1 xm0 ( .B(dvss), .D(net13), .G(d), .S(dvss) ); 
Switch_NMOS_n12_X1_Y1 xm1 ( .B(dvss), .D(net019), .G(clk), .S(dvss) ); 
Switch_NMOS_n12_X1_Y1 xm10 ( .B(dvss), .D(net09), .G(net13), .S(net019) ); 
Switch_PMOS_n12_X1_Y1 xm17 ( .B(dvdd), .D(q), .G(net012), .S(dvdd) ); 
Switch_PMOS_n12_X1_Y1 xm18 ( .B(dvdd), .D(net012), .G(net09), .S(dvdd) ); 
Switch_PMOS_n12_X1_Y1 xm4 ( .B(dvdd), .D(net09), .G(clk), .S(dvdd) ); 
Switch_PMOS_n12_X1_Y1 xm5 ( .B(dvdd), .D(net7), .G(d), .S(dvdd) ); 
Switch_PMOS_n12_X1_Y1 xm9 ( .B(dvdd), .D(net13), .G(clk), .S(net7) ); 

endmodule

module BUF22444 ( in, out, outb, outbb ); 
input in, out, outb, outbb;

INVX2 xi0 ( .i(net21), .vdd(dvdd), .vss(dvss), .zn(net07) ); 
INVX2 xi184 ( .i(in), .vdd(dvdd), .vss(dvss), .zn(net21) ); 
INVX4 xi187 ( .i(outb), .vdd(dvdd), .vss(dvss), .zn(out) ); 
INVX4 xi185 ( .i(net07), .vdd(dvdd), .vss(dvss), .zn(outb) ); 
INVX4 xi186 ( .i(out), .vdd(dvdd), .vss(dvss), .zn(outbb) ); 

endmodule

module SC4B_wELD_V2 ( avdd, avss, bot<0>, bot<1>, bot<2>, bot<3>, bote<0>, bote<1>, bote<2>, bote<3>, d<0>, d<1>, d<2>, d<3>, de<0>, de<1>, de<2>, de<3>, ns<1>, ns<2>, nsbs<1>, nsbs<2>, phs, veld, vin, vint<0>, vint<1>, vint<2>, vref, vrefn, vrefp, vsw ); 
input avdd, avss, bot<0>, bot<1>, bot<2>, bot<3>, bote<0>, bote<1>, bote<2>, bote<3>, d<0>, d<1>, d<2>, d<3>, de<0>, de<1>, de<2>, de<3>, ns<1>, ns<2>, nsbs<1>, nsbs<2>, phs, veld, vin, vint<0>, vint<1>, vint<2>, vref, vrefn, vrefp, vsw;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(avss), .D(vint<0>), .G(nsbs<1>), .S(vint<1>) ); 
Switch_NMOS_n12_X1_Y1 xm1 ( .B(avss), .D(vint<0>), .G(nsbs<2>), .S(vint<2>) ); 
BSSW_WOTOD xi159 ( .avdd(avdd), .avss(avss), .phi(phs), .vg(vsw), .vin(vin), .vout(vint<0>) ); 
BSSW_WOTOD_NS xi2<2> ( .avdd(avdd), .avss(avss), .phi(ns<2>), .vcm(vref), .vg(nsbs<2>) ); 
BSSW_WOTOD_NS xi2<1> ( .avdd(avdd), .avss(avss), .phi(ns<1>), .vcm(vref), .vg(nsbs<1>) ); 
INVX1NB xi151 ( .i(de<0>), .vb(avss), .vdd(veld), .vss(vrefn), .zn(bote<0>) ); 
INVX1NB xi164 ( .i(d<1>), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(bot<1>) ); 
INVX1NB xi165 ( .i(d<1>), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(botb<1>) ); 
INVX1NB xi167 ( .i(d<0>), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(bot<0>) ); 
INVX8NB xi150 ( .i(de<3>), .vb(avss), .vdd(veld), .vss(vrefn), .zn(bote<3>) ); 
INVX2NB xi153 ( .i(de<1>), .vb(avss), .vdd(veld), .vss(vrefn), .zn(bote<1>) ); 
INVX2NB xi162 ( .i(d<2>), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(bot<2>) ); 
INVX2NB xi163 ( .i(d<2>), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(botb<2>) ); 
INVX4NB xi152 ( .i(de<2>), .vb(avss), .vdd(veld), .vss(vrefn), .zn(bote<2>) ); 
INVX4NB xi170 ( .i(d<3>), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(net4) ); 
INVX4NB xi169 ( .i(net4), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(bot<3>) ); 
INVX4NB xi161 ( .i(net4), .vb(avss), .vdd(vrefp), .vss(vrefn), .zn(botb<3>) ); 

endmodule

module INV_LVT ( SN, SP, i, zn ); 
input SN, SP, i, zn;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(SN), .D(zn), .G(i), .S(SN) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(SP), .D(zn), .G(i), .S(SP) ); 

endmodule

module stage2_inv ( G1, G2, SN, SP ); 
input G1, G2, SN, SP;

INV_LVT MM0_MM2 ( .zn(G1), .i(D), .SN(SN), .SP(SP) ); 
INV_LVT MM1_MM3 ( .zn(D), .i(G2), .SN(SN), .SP(SP) ); 

endmodule

module BSSW_WOTOD ( avdd, avss, phi, vg, vin, vout ); 
input avdd, avss, phi, vg, vin, vout;

Switch_NMOS_n12_X1_Y1 xm13 ( .B(avss), .D(phie), .G(phieb), .S(avss) ); 
Switch_NMOS_n12_X1_Y1 xm5 ( .B(avss), .D(net13), .G(phieb), .S(net06) ); 
Switch_NMOS_n12_X1_Y1 xm2 ( .B(avss), .D(net13), .G(vg), .S(net06) ); 
Switch_NMOS_n12_X1_Y1 xm3 ( .B(avss), .D(net016), .G(avdd), .S(vg) ); 
Switch_NMOS_n12_X1_Y1 xm28 ( .B(avss), .D(avss), .G(phie), .S(net016) ); 
Switch_NMOS_n12_X1_Y1 xm24 ( .B(avss), .D(net13), .G(phie), .S(avss) ); 
Switch_NMOS_n12_X1_Y1 xm25 ( .B(avss), .D(vout), .G(vg), .S(vin) ); 
Switch_NMOS_n12_X1_Y1 xm26 ( .B(avss), .D(vin), .G(vg), .S(net13) ); 
Switch_PMOS_n12_X1_Y1 xm12 ( .B(avdd), .D(phie), .G(phieb), .S(avdd) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(net8), .D(vg), .G(net06), .S(net8) ); 
Switch_PMOS_n12_X1_Y1 xm4 ( .B(avdd), .D(net06), .G(phieb), .S(avdd) ); 
Switch_PMOS_n12_X1_Y1 xm0 ( .B(net8), .D(net8), .G(vg), .S(avdd) ); 
Cap_10f xc0 ( .PLUS(net13), .MINUS(net8) ); 
stage2_inv xm10_xm9_xm11_xm8 ( .G1(phieb), .SN(avss), .G2(phi), .SP(avdd) ); 

endmodule

module BSSW_WOTOD_NS ( avdd, avss, phi, vcm, vg ); 
input avdd, avss, phi, vcm, vg;

Switch_NMOS_n12_X1_Y1 xm5 ( .B(avss), .D(net019), .G(phieb), .S(net018) ); 
Switch_NMOS_n12_X1_Y1 xm3 ( .B(avss), .D(net016), .G(avdd), .S(vg) ); 
Switch_NMOS_n12_X1_Y1 xm28 ( .B(avss), .D(avss), .G(phie), .S(net016) ); 
Switch_NMOS_n12_X1_Y1 xm24 ( .B(avss), .D(net019), .G(phie), .S(avss) ); 
Switch_NMOS_n12_X1_Y1 xm7 ( .B(avss), .D(vcm), .G(phieb), .S(net019) ); 
Switch_NMOS_n12_X1_Y1 xm26 ( .B(avss), .D(vcm), .G(vg), .S(net019) ); 
Switch_PMOS_n12_X1_Y1 xm6 ( .B(avdd), .D(net018), .G(phie), .S(net019) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(net8), .D(vg), .G(net018), .S(net8) ); 
Switch_PMOS_n12_X1_Y1 xm4 ( .B(avdd), .D(net018), .G(phieb), .S(avdd) ); 
Switch_PMOS_n12_X1_Y1 xm0 ( .B(net8), .D(net8), .G(phieb), .S(avdd) ); 
Cap_10f xc0 ( .PLUS(net019), .MINUS(net8) ); 
stage2_inv xm12_xm10_xm11_xm9 ( .G1(phieb), .SN(avss), .G2(phi), .SP(avdd) ); 

endmodule
