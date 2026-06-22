module SQ_3SHARE_SILVERWRAP ( clk, a0, a1, a2, r0, r1, r2, r3, r4, r5, b0, b1, 
        b2 );
(* SILVER="[1:0]_0" *)  input [1:0] a0;
(* SILVER="[1:0]_1" *)  input [1:0] a1;
(* SILVER="[1:0]_2" *)  input [1:0] a2;
(* SILVER="refresh" *)  input [1:0] r0;
(* SILVER="refresh" *)  input [1:0] r1;
(* SILVER="refresh" *)  input [1:0] r2;
(* SILVER="refresh" *)  input [1:0] r3;
(* SILVER="refresh" *)  input [1:0] r4;
(* SILVER="refresh" *)  input [1:0] r5;
(* SILVER="[1:0]_0" *)  output [1:0] b0;
(* SILVER="[1:0]_1" *)  output [1:0] b1;
(* SILVER="[1:0]_2" *)  output [1:0] b2;
(* SILVER="clock" *)  input clk;
  wire   r0_p_r, r1_p_r, r2_p_r, r3_p_r, r4_p_r, r5_p_r, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, net4417, net4418, net4419, net4420,
         net4421, net4422, net4423, RED1_n1, RED2_n1, RED3_n1,
         SQ_instance_net4416, SQ_instance_net4415, SQ_instance_net4414,
         SQ_instance_net4413, SQ_instance_net4412, SQ_instance_net4411,
         SQ_instance_net4410, SQ_instance_net4409, SQ_instance_net4408,
         SQ_instance_net4407, SQ_instance_net4406, SQ_instance_net4405,
         SQ_instance_net4404, SQ_instance_net4403, SQ_instance_net4402,
         SQ_instance_net4401, SQ_instance_net4400, SQ_instance_net4399,
         SQ_instance_net4398, SQ_instance_net4397, SQ_instance_net4396,
         SQ_instance_net4395, SQ_instance_net4394, SQ_instance_n156,
         SQ_instance_n155, SQ_instance_n154, SQ_instance_n153,
         SQ_instance_n152, SQ_instance_n151, SQ_instance_n150,
         SQ_instance_n149, SQ_instance_n148, SQ_instance_n147,
         SQ_instance_n146, SQ_instance_n145, SQ_instance_n144,
         SQ_instance_n143, SQ_instance_n142, SQ_instance_n141,
         SQ_instance_n140, SQ_instance_n139, SQ_instance_n138,
         SQ_instance_n137, SQ_instance_n136, SQ_instance_n135,
         SQ_instance_n134, SQ_instance_n133, SQ_instance_n132,
         SQ_instance_n131, SQ_instance_n130, SQ_instance_n129,
         SQ_instance_n128, SQ_instance_n127, SQ_instance_n126,
         SQ_instance_n125, SQ_instance_n124, SQ_instance_n123,
         SQ_instance_n122, SQ_instance_n121, SQ_instance_n120,
         SQ_instance_n119, SQ_instance_n118, SQ_instance_n117,
         SQ_instance_n116, SQ_instance_n115, SQ_instance_n114,
         SQ_instance_n113, SQ_instance_n112, SQ_instance_n111,
         SQ_instance_n110, SQ_instance_n109, SQ_instance_n108,
         SQ_instance_n107, SQ_instance_n106, SQ_instance_n105,
         SQ_instance_n104, SQ_instance_n103, SQ_instance_n102,
         SQ_instance_n101, SQ_instance_n100, SQ_instance_n99, SQ_instance_n98,
         SQ_instance_n97, SQ_instance_n96, SQ_instance_n95, SQ_instance_n94,
         SQ_instance_n93, SQ_instance_n92, SQ_instance_n91, SQ_instance_n90,
         SQ_instance_n89, SQ_instance_n88, SQ_instance_n87, SQ_instance_n86,
         SQ_instance_n85, SQ_instance_n84, SQ_instance_n83, SQ_instance_n82,
         SQ_instance_n81, SQ_instance_n80, SQ_instance_n79, SQ_instance_n78,
         SQ_instance_n77, SQ_instance_n76, SQ_instance_n75, SQ_instance_n74,
         SQ_instance_n73, SQ_instance_n72, SQ_instance_n71, SQ_instance_n70,
         SQ_instance_n69, SQ_instance_n68, SQ_instance_n67, SQ_instance_n66,
         SQ_instance_n65, SQ_instance_n64, SQ_instance_n63, SQ_instance_n62,
         SQ_instance_n61, SQ_instance_n60, SQ_instance_n59, SQ_instance_n58,
         SQ_instance_n57, SQ_instance_n56, SQ_instance_n55, SQ_instance_n54,
         SQ_instance_n53, SQ_instance_n52, SQ_instance_n51, SQ_instance_n50,
         SQ_instance_n49, SQ_instance_n48, SQ_instance_n47, SQ_instance_n46,
         SQ_instance_n45, SQ_instance_n44, SQ_instance_n43, SQ_instance_n42,
         SQ_instance_n41, SQ_instance_n40, SQ_instance_n39, SQ_instance_n38,
         SQ_instance_n37, SQ_instance_n36, SQ_instance_n35, SQ_instance_n34,
         SQ_instance_n33, SQ_instance_n32, SQ_instance_n31, SQ_instance_n30,
         SQ_instance_n29, SQ_instance_n28, SQ_instance_n27, SQ_instance_n26,
         SQ_instance_n25, SQ_instance_n24, SQ_instance_n23, SQ_instance_n22,
         SQ_instance_n21, SQ_instance_n20, SQ_instance_add_x_2_n6,
         SQ_instance_add_x_4_n6, SQ_instance_add_x_6_n6,
         SQ_instance_gamma_coeff_mul_beta_sub_0_1_abc_0_,
         SQ_instance_beta_coeff_muladd_1_2_cd_0_,
         SQ_instance_beta_coeff_muladd_0_2_cd_0_,
         SQ_instance_beta_coeff_muladd_0_1_cd_0_,
         SQ_instance_gamma_mul_beta_1_, SQ_instance_gamma_reg2_n5;
  wire   [5:0] a_mod;
  wire   [5:0] a_sel_r;
  wire   [5:0] a_mod_r;
  wire   [5:0] a_sel_rr;
  wire   [11:0] r_rr;
  wire   [11:0] r_r;
  wire   [4:0] SQ_instance_gamma_mul_r;
  wire   [11:6] SQ_instance_r_rr;
  wire   [5:0] SQ_instance_beta_r;
  wire   [4:0] SQ_instance_gamma_mul;
  wire   [5:0] SQ_instance_alpha_r;
  wire   [3:0] SQ_instance_a_r;
  wire   [11:7] SQ_instance_r_r;
  wire   [5:0] SQ_instance_beta;
  wire   [5:1] SQ_instance_alpha;
  wire   [3:0] SQ_instance_gamma_mul_rr;

  DFF_X1 a_mod_r_reg_5_ ( .D(a_mod[5]), .CK(clk), .Q(a_mod_r[5]) );
  DFF_X1 a_mod_r_reg_4_ ( .D(a_mod[4]), .CK(clk), .Q(a_mod_r[4]) );
  DFF_X1 a_mod_r_reg_3_ ( .D(a_mod[3]), .CK(clk), .Q(a_mod_r[3]) );
  DFF_X1 a_mod_r_reg_2_ ( .D(a_mod[2]), .CK(clk), .Q(a_mod_r[2]) );
  DFF_X1 a_mod_r_reg_1_ ( .D(a_mod[1]), .CK(clk), .Q(a_mod_r[1]) );
  DFF_X1 a_mod_r_reg_0_ ( .D(a_mod[0]), .CK(clk), .Q(a_mod_r[0]) );
  DFF_X1 r0_p_r_reg ( .D(n6), .CK(clk), .Q(r0_p_r) );
  DFF_X1 r1_p_r_reg ( .D(n7), .CK(clk), .Q(r1_p_r) );
  DFF_X1 r2_p_r_reg ( .D(n8), .CK(clk), .Q(r2_p_r) );
  DFF_X1 r3_p_r_reg ( .D(n9), .CK(clk), .Q(r3_p_r) );
  DFF_X1 r4_p_r_reg ( .D(n10), .CK(clk), .Q(r4_p_r) );
  DFF_X1 r5_p_r_reg ( .D(n11), .CK(clk), .Q(r5_p_r) );
  DFF_X1 r_r_reg_11_ ( .D(r0[1]), .CK(clk), .Q(r_r[11]) );
  DFF_X1 r_r_reg_10_ ( .D(r0[0]), .CK(clk), .Q(r_r[10]) );
  DFF_X1 r_r_reg_9_ ( .D(r1[1]), .CK(clk), .Q(r_r[9]) );
  DFF_X1 r_r_reg_8_ ( .D(r1[0]), .CK(clk), .Q(r_r[8]) );
  DFF_X1 r_r_reg_7_ ( .D(r2[1]), .CK(clk), .Q(r_r[7]) );
  DFF_X1 r_r_reg_6_ ( .D(r2[0]), .CK(clk), .Q(r_r[6]) );
  DFF_X1 r_r_reg_5_ ( .D(r3[1]), .CK(clk), .Q(r_r[5]) );
  DFF_X1 r_r_reg_4_ ( .D(r3[0]), .CK(clk), .Q(r_r[4]) );
  DFF_X1 r_r_reg_3_ ( .D(r4[1]), .CK(clk), .Q(r_r[3]) );
  DFF_X1 r_r_reg_2_ ( .D(r4[0]), .CK(clk), .Q(r_r[2]) );
  DFF_X1 r_r_reg_1_ ( .D(r5[1]), .CK(clk), .Q(r_r[1]) );
  DFF_X1 r_r_reg_0_ ( .D(r5[0]), .CK(clk), .Q(r_r[0]) );
  DFF_X1 r_rr_reg_11_ ( .D(r_r[11]), .CK(clk), .Q(r_rr[11]) );
  DFF_X1 r_rr_reg_10_ ( .D(r_r[10]), .CK(clk), .Q(r_rr[10]) );
  DFF_X1 r_rr_reg_9_ ( .D(r_r[9]), .CK(clk), .Q(r_rr[9]) );
  DFF_X1 r_rr_reg_8_ ( .D(r_r[8]), .CK(clk), .Q(r_rr[8]) );
  DFF_X1 r_rr_reg_7_ ( .D(r_r[7]), .CK(clk), .Q(r_rr[7]) );
  DFF_X1 r_rr_reg_6_ ( .D(r_r[6]), .CK(clk), .Q(r_rr[6]) );
  DFF_X1 r_rr_reg_5_ ( .D(r_r[5]), .CK(clk), .Q(r_rr[5]) );
  DFF_X1 r_rr_reg_4_ ( .D(r_r[4]), .CK(clk), .Q(r_rr[4]) );
  DFF_X1 r_rr_reg_3_ ( .D(r_r[3]), .CK(clk), .Q(r_rr[3]) );
  DFF_X1 r_rr_reg_2_ ( .D(r_r[2]), .CK(clk), .Q(r_rr[2]) );
  DFF_X1 r_rr_reg_1_ ( .D(r_r[1]), .CK(clk), .Q(r_rr[1]) );
  DFF_X1 r_rr_reg_0_ ( .D(r_r[0]), .CK(clk), .Q(r_rr[0]) );
  DFF_X1 a_sel_rr_reg_5_ ( .D(a_sel_r[5]), .CK(clk), .Q(a_sel_rr[5]) );
  DFF_X1 a_sel_rr_reg_4_ ( .D(a_sel_r[4]), .CK(clk), .Q(a_sel_rr[4]) );
  DFF_X1 a_sel_rr_reg_3_ ( .D(a_sel_r[3]), .CK(clk), .Q(a_sel_rr[3]) );
  DFF_X1 a_sel_rr_reg_2_ ( .D(a_sel_r[2]), .CK(clk), .Q(a_sel_rr[2]) );
  DFF_X1 a_sel_rr_reg_1_ ( .D(a_sel_r[1]), .CK(clk), .Q(a_sel_rr[1]) );
  DFF_X1 a_sel_rr_reg_0_ ( .D(a_sel_r[0]), .CK(clk), .Q(a_sel_rr[0]) );
  NOR2_X1 U22 ( .A1(r5_p_r), .A2(r2_p_r), .ZN(n13) );
  NOR2_X1 U23 ( .A1(r4_p_r), .A2(r0_p_r), .ZN(n12) );
  NAND2_X1 U24 ( .A1(n13), .A2(n12), .ZN(n14) );
  OR2_X1 U25 ( .A1(r3_p_r), .A2(n14), .ZN(n15) );
  NOR2_X1 U26 ( .A1(r1_p_r), .A2(n15), .ZN(n16) );
  AND2_X1 U27 ( .A1(n16), .A2(a_mod_r[4]), .ZN(a_sel_r[4]) );
  AND2_X1 U28 ( .A1(n16), .A2(a_mod_r[1]), .ZN(a_sel_r[1]) );
  AND2_X1 U29 ( .A1(n16), .A2(a_mod_r[0]), .ZN(a_sel_r[0]) );
  AND2_X1 U30 ( .A1(n16), .A2(a_mod_r[3]), .ZN(a_sel_r[3]) );
  AND2_X1 U31 ( .A1(n16), .A2(a_mod_r[5]), .ZN(a_sel_r[5]) );
  AND2_X1 U32 ( .A1(n16), .A2(a_mod_r[2]), .ZN(a_sel_r[2]) );
  NOR2_X1 U35 ( .A1(r5[0]), .A2(r5[1]), .ZN(n11) );
  NOR2_X1 U36 ( .A1(r4[0]), .A2(r4[1]), .ZN(n10) );
  NOR2_X1 U37 ( .A1(r3[0]), .A2(r3[1]), .ZN(n9) );
  NOR2_X1 U38 ( .A1(r2[0]), .A2(r2[1]), .ZN(n8) );
  NOR2_X1 U39 ( .A1(r1[0]), .A2(r1[1]), .ZN(n7) );
  NOR2_X1 U40 ( .A1(r0[0]), .A2(r0[1]), .ZN(n6) );
  NAND2_X1 RED1_U4 ( .A1(a0[1]), .A2(RED1_n1), .ZN(a_mod[0]) );
  OR2_X1 RED1_U3 ( .A1(a0[1]), .A2(RED1_n1), .ZN(a_mod[1]) );
  INV_X1 RED1_U2 ( .A(a0[0]), .ZN(RED1_n1) );
  NAND2_X1 RED2_U4 ( .A1(a1[1]), .A2(RED2_n1), .ZN(a_mod[2]) );
  OR2_X1 RED2_U3 ( .A1(a1[1]), .A2(RED2_n1), .ZN(a_mod[3]) );
  INV_X1 RED2_U2 ( .A(a1[0]), .ZN(RED2_n1) );
  NAND2_X1 RED3_U4 ( .A1(a2[1]), .A2(RED3_n1), .ZN(a_mod[4]) );
  OR2_X1 RED3_U3 ( .A1(a2[1]), .A2(RED3_n1), .ZN(a_mod[5]) );
  INV_X1 RED3_U2 ( .A(a2[0]), .ZN(RED3_n1) );
  NOR2_X1 SQ_instance_U164 ( .A1(SQ_instance_n156), .A2(SQ_instance_n155), 
        .ZN(b2[0]) );
  NOR2_X1 SQ_instance_U163 ( .A1(SQ_instance_n154), .A2(SQ_instance_n153), 
        .ZN(SQ_instance_n155) );
  NOR2_X1 SQ_instance_U162 ( .A1(
        SQ_instance_gamma_coeff_mul_beta_sub_0_1_abc_0_), .A2(SQ_instance_n152), .ZN(SQ_instance_n156) );
  XNOR2_X1 SQ_instance_U161 ( .A(SQ_instance_n154), .B(SQ_instance_n153), .ZN(
        b2[1]) );
  NAND2_X1 SQ_instance_U160 ( .A1(
        SQ_instance_gamma_coeff_mul_beta_sub_0_1_abc_0_), .A2(SQ_instance_n152), .ZN(SQ_instance_n153) );
  XNOR2_X1 SQ_instance_U159 ( .A(SQ_instance_r_rr[11]), .B(SQ_instance_n151), 
        .ZN(SQ_instance_n152) );
  NOR2_X1 SQ_instance_U158 ( .A1(SQ_instance_n150), .A2(SQ_instance_n149), 
        .ZN(SQ_instance_n154) );
  NOR2_X1 SQ_instance_U157 ( .A1(SQ_instance_gamma_mul_beta_1_), .A2(
        SQ_instance_r_rr[10]), .ZN(SQ_instance_n149) );
  NOR2_X1 SQ_instance_U156 ( .A1(SQ_instance_r_rr[11]), .A2(SQ_instance_n151), 
        .ZN(SQ_instance_n150) );
  NAND2_X1 SQ_instance_U155 ( .A1(SQ_instance_gamma_mul_beta_1_), .A2(
        SQ_instance_r_rr[10]), .ZN(SQ_instance_n151) );
  XNOR2_X1 SQ_instance_U154 ( .A(SQ_instance_n148), .B(SQ_instance_n147), .ZN(
        b1[1]) );
  NAND2_X1 SQ_instance_U153 ( .A1(SQ_instance_n146), .A2(SQ_instance_n145), 
        .ZN(SQ_instance_gamma_mul[0]) );
  NAND2_X1 SQ_instance_U152 ( .A1(a_sel_rr[1]), .A2(SQ_instance_n144), .ZN(
        SQ_instance_n145) );
  NAND2_X1 SQ_instance_U151 ( .A1(a_sel_rr[0]), .A2(SQ_instance_n143), .ZN(
        SQ_instance_n146) );
  NAND2_X1 SQ_instance_U150 ( .A1(SQ_instance_n142), .A2(SQ_instance_n141), 
        .ZN(SQ_instance_gamma_mul[1]) );
  NAND2_X1 SQ_instance_U149 ( .A1(a_sel_rr[0]), .A2(SQ_instance_n144), .ZN(
        SQ_instance_n141) );
  NAND2_X1 SQ_instance_U148 ( .A1(SQ_instance_n140), .A2(SQ_instance_n139), 
        .ZN(SQ_instance_n144) );
  OR2_X1 SQ_instance_U147 ( .A1(SQ_instance_n138), .A2(SQ_instance_n137), .ZN(
        SQ_instance_n139) );
  XOR2_X1 SQ_instance_U146 ( .A(SQ_instance_n136), .B(SQ_instance_n135), .Z(
        SQ_instance_n140) );
  NAND2_X1 SQ_instance_U145 ( .A1(a_sel_rr[1]), .A2(SQ_instance_n143), .ZN(
        SQ_instance_n142) );
  NAND2_X1 SQ_instance_U144 ( .A1(SQ_instance_n134), .A2(SQ_instance_n133), 
        .ZN(SQ_instance_n143) );
  NAND2_X1 SQ_instance_U143 ( .A1(SQ_instance_n132), .A2(SQ_instance_n136), 
        .ZN(SQ_instance_n133) );
  NOR2_X1 SQ_instance_U142 ( .A1(r_rr[4]), .A2(SQ_instance_n131), .ZN(
        SQ_instance_n136) );
  INV_X1 SQ_instance_U141 ( .A(SQ_instance_n135), .ZN(SQ_instance_n132) );
  XOR2_X1 SQ_instance_U140 ( .A(SQ_instance_n130), .B(SQ_instance_n129), .Z(
        SQ_instance_n135) );
  XNOR2_X1 SQ_instance_U139 ( .A(SQ_instance_n137), .B(SQ_instance_n138), .ZN(
        SQ_instance_n134) );
  OR2_X1 SQ_instance_U138 ( .A1(r_rr[5]), .A2(SQ_instance_n129), .ZN(
        SQ_instance_n138) );
  NOR2_X1 SQ_instance_U137 ( .A1(SQ_instance_n128), .A2(SQ_instance_n127), 
        .ZN(SQ_instance_n129) );
  XNOR2_X1 SQ_instance_U136 ( .A(SQ_instance_n126), .B(SQ_instance_n125), .ZN(
        SQ_instance_n127) );
  NAND2_X1 SQ_instance_U135 ( .A1(a_sel_rr[0]), .A2(SQ_instance_n124), .ZN(
        SQ_instance_n125) );
  NOR2_X1 SQ_instance_U134 ( .A1(r_rr[1]), .A2(SQ_instance_n123), .ZN(
        SQ_instance_n128) );
  XOR2_X1 SQ_instance_U133 ( .A(SQ_instance_n122), .B(SQ_instance_n131), .Z(
        SQ_instance_n137) );
  NOR2_X1 SQ_instance_U132 ( .A1(SQ_instance_n121), .A2(SQ_instance_n120), 
        .ZN(SQ_instance_n131) );
  XOR2_X1 SQ_instance_U131 ( .A(SQ_instance_n123), .B(SQ_instance_n119), .Z(
        SQ_instance_n120) );
  NAND2_X1 SQ_instance_U130 ( .A1(a_sel_rr[1]), .A2(SQ_instance_n118), .ZN(
        SQ_instance_n119) );
  XOR2_X1 SQ_instance_U129 ( .A(a_sel_rr[0]), .B(r_rr[0]), .Z(SQ_instance_n123) );
  AND2_X1 SQ_instance_U128 ( .A1(SQ_instance_n124), .A2(SQ_instance_n126), 
        .ZN(SQ_instance_n121) );
  XOR2_X1 SQ_instance_U127 ( .A(a_sel_rr[1]), .B(SQ_instance_n118), .Z(
        SQ_instance_n126) );
  NAND2_X1 SQ_instance_U126 ( .A1(SQ_instance_n117), .A2(SQ_instance_n116), 
        .ZN(SQ_instance_gamma_mul[2]) );
  NAND2_X1 SQ_instance_U125 ( .A1(a_sel_rr[2]), .A2(SQ_instance_n115), .ZN(
        SQ_instance_n116) );
  NAND2_X1 SQ_instance_U124 ( .A1(a_sel_rr[3]), .A2(SQ_instance_n114), .ZN(
        SQ_instance_n117) );
  NAND2_X1 SQ_instance_U123 ( .A1(SQ_instance_n113), .A2(SQ_instance_n112), 
        .ZN(SQ_instance_gamma_mul[3]) );
  NAND2_X1 SQ_instance_U122 ( .A1(a_sel_rr[3]), .A2(SQ_instance_n115), .ZN(
        SQ_instance_n112) );
  NAND2_X1 SQ_instance_U121 ( .A1(r_rr[2]), .A2(SQ_instance_n111), .ZN(
        SQ_instance_n115) );
  NAND2_X1 SQ_instance_U120 ( .A1(a_sel_rr[2]), .A2(SQ_instance_n114), .ZN(
        SQ_instance_n113) );
  NAND2_X1 SQ_instance_U119 ( .A1(r_rr[3]), .A2(SQ_instance_n110), .ZN(
        SQ_instance_n114) );
  NAND2_X1 SQ_instance_U118 ( .A1(SQ_instance_n109), .A2(SQ_instance_n108), 
        .ZN(b0[0]) );
  NAND2_X1 SQ_instance_U117 ( .A1(SQ_instance_n107), .A2(SQ_instance_n106), 
        .ZN(SQ_instance_n108) );
  NOR2_X1 SQ_instance_U116 ( .A1(SQ_instance_n105), .A2(SQ_instance_n104), 
        .ZN(SQ_instance_n109) );
  NAND2_X1 SQ_instance_U115 ( .A1(SQ_instance_n110), .A2(SQ_instance_n103), 
        .ZN(SQ_instance_add_x_6_n6) );
  NAND2_X1 SQ_instance_U114 ( .A1(SQ_instance_n111), .A2(
        SQ_instance_gamma_mul[4]), .ZN(SQ_instance_n103) );
  NAND2_X1 SQ_instance_U113 ( .A1(SQ_instance_n122), .A2(SQ_instance_n102), 
        .ZN(SQ_instance_add_x_4_n6) );
  NAND2_X1 SQ_instance_U112 ( .A1(SQ_instance_n130), .A2(
        SQ_instance_gamma_mul[4]), .ZN(SQ_instance_n102) );
  NAND2_X1 SQ_instance_U111 ( .A1(SQ_instance_n124), .A2(SQ_instance_n101), 
        .ZN(SQ_instance_add_x_2_n6) );
  NAND2_X1 SQ_instance_U110 ( .A1(SQ_instance_n118), .A2(SQ_instance_n100), 
        .ZN(SQ_instance_n101) );
  NAND2_X1 SQ_instance_U109 ( .A1(SQ_instance_n118), .A2(SQ_instance_n99), 
        .ZN(SQ_instance_alpha[1]) );
  NAND2_X1 SQ_instance_U108 ( .A1(SQ_instance_n124), .A2(SQ_instance_n100), 
        .ZN(SQ_instance_n99) );
  OR2_X1 SQ_instance_U107 ( .A1(a_sel_rr[3]), .A2(a_sel_rr[2]), .ZN(
        SQ_instance_n100) );
  INV_X1 SQ_instance_U106 ( .A(r_rr[0]), .ZN(SQ_instance_n124) );
  INV_X1 SQ_instance_U105 ( .A(r_rr[1]), .ZN(SQ_instance_n118) );
  NAND2_X1 SQ_instance_U104 ( .A1(SQ_instance_n130), .A2(SQ_instance_n98), 
        .ZN(SQ_instance_alpha[5]) );
  NAND2_X1 SQ_instance_U103 ( .A1(SQ_instance_n122), .A2(
        SQ_instance_gamma_mul[4]), .ZN(SQ_instance_n98) );
  INV_X1 SQ_instance_U102 ( .A(r_rr[4]), .ZN(SQ_instance_n122) );
  INV_X1 SQ_instance_U101 ( .A(r_rr[5]), .ZN(SQ_instance_n130) );
  NAND2_X1 SQ_instance_U100 ( .A1(SQ_instance_n111), .A2(SQ_instance_n97), 
        .ZN(SQ_instance_alpha[3]) );
  NAND2_X1 SQ_instance_U99 ( .A1(SQ_instance_n110), .A2(
        SQ_instance_gamma_mul[4]), .ZN(SQ_instance_n97) );
  INV_X1 SQ_instance_U98 ( .A(r_rr[2]), .ZN(SQ_instance_n110) );
  INV_X1 SQ_instance_U97 ( .A(r_rr[3]), .ZN(SQ_instance_n111) );
  NAND2_X1 SQ_instance_U96 ( .A1(SQ_instance_n96), .A2(SQ_instance_n95), .ZN(
        SQ_instance_beta[1]) );
  NAND2_X1 SQ_instance_U95 ( .A1(SQ_instance_alpha_r[0]), .A2(
        SQ_instance_a_r[1]), .ZN(SQ_instance_n95) );
  NOR2_X1 SQ_instance_U94 ( .A1(SQ_instance_n94), .A2(SQ_instance_n93), .ZN(
        SQ_instance_n96) );
  NOR2_X1 SQ_instance_U93 ( .A1(SQ_instance_n92), .A2(SQ_instance_n91), .ZN(
        SQ_instance_n93) );
  NOR2_X1 SQ_instance_U92 ( .A1(SQ_instance_n90), .A2(SQ_instance_n89), .ZN(
        SQ_instance_n91) );
  NOR2_X1 SQ_instance_U91 ( .A1(SQ_instance_n88), .A2(SQ_instance_alpha_r[1]), 
        .ZN(SQ_instance_n89) );
  NAND2_X1 SQ_instance_U90 ( .A1(SQ_instance_n86), .A2(SQ_instance_n85), .ZN(
        SQ_instance_beta[0]) );
  NAND2_X1 SQ_instance_U89 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[1]), .ZN(SQ_instance_n85) );
  NOR2_X1 SQ_instance_U88 ( .A1(SQ_instance_n88), .A2(SQ_instance_n84), .ZN(
        SQ_instance_n86) );
  NOR2_X1 SQ_instance_U87 ( .A1(SQ_instance_n92), .A2(SQ_instance_n83), .ZN(
        SQ_instance_n84) );
  NOR2_X1 SQ_instance_U86 ( .A1(SQ_instance_n90), .A2(SQ_instance_n82), .ZN(
        SQ_instance_n83) );
  NOR2_X1 SQ_instance_U85 ( .A1(SQ_instance_n94), .A2(SQ_instance_alpha_r[0]), 
        .ZN(SQ_instance_n82) );
  NOR2_X1 SQ_instance_U84 ( .A1(SQ_instance_n80), .A2(SQ_instance_n87), .ZN(
        SQ_instance_n94) );
  INV_X1 SQ_instance_U83 ( .A(SQ_instance_alpha_r[1]), .ZN(SQ_instance_n87) );
  NOR2_X1 SQ_instance_U82 ( .A1(SQ_instance_beta_coeff_muladd_0_1_cd_0_), .A2(
        SQ_instance_r_r[7]), .ZN(SQ_instance_n92) );
  NOR2_X1 SQ_instance_U81 ( .A1(SQ_instance_n80), .A2(SQ_instance_n81), .ZN(
        SQ_instance_n88) );
  INV_X1 SQ_instance_U80 ( .A(SQ_instance_alpha_r[0]), .ZN(SQ_instance_n81) );
  INV_X1 SQ_instance_U79 ( .A(SQ_instance_a_r[0]), .ZN(SQ_instance_n80) );
  NAND2_X1 SQ_instance_U78 ( .A1(SQ_instance_n79), .A2(SQ_instance_n78), .ZN(
        SQ_instance_beta[5]) );
  NAND2_X1 SQ_instance_U77 ( .A1(SQ_instance_a_r[0]), .A2(
        SQ_instance_alpha_r[5]), .ZN(SQ_instance_n78) );
  NOR2_X1 SQ_instance_U76 ( .A1(SQ_instance_n77), .A2(SQ_instance_n76), .ZN(
        SQ_instance_n79) );
  AND2_X1 SQ_instance_U75 ( .A1(SQ_instance_alpha_r[4]), .A2(
        SQ_instance_a_r[1]), .ZN(SQ_instance_n76) );
  NAND2_X1 SQ_instance_U74 ( .A1(SQ_instance_n75), .A2(SQ_instance_n74), .ZN(
        SQ_instance_beta[4]) );
  NAND2_X1 SQ_instance_U73 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[5]), .ZN(SQ_instance_n74) );
  NOR2_X1 SQ_instance_U72 ( .A1(SQ_instance_n77), .A2(SQ_instance_n73), .ZN(
        SQ_instance_n75) );
  AND2_X1 SQ_instance_U71 ( .A1(SQ_instance_alpha_r[4]), .A2(
        SQ_instance_a_r[0]), .ZN(SQ_instance_n73) );
  NOR2_X1 SQ_instance_U70 ( .A1(SQ_instance_n72), .A2(SQ_instance_n71), .ZN(
        SQ_instance_n77) );
  NOR2_X1 SQ_instance_U69 ( .A1(SQ_instance_beta_coeff_muladd_0_2_cd_0_), .A2(
        SQ_instance_r_r[11]), .ZN(SQ_instance_n71) );
  NOR2_X1 SQ_instance_U68 ( .A1(SQ_instance_n90), .A2(SQ_instance_n70), .ZN(
        SQ_instance_n72) );
  NOR2_X1 SQ_instance_U67 ( .A1(SQ_instance_alpha_r[4]), .A2(
        SQ_instance_alpha_r[5]), .ZN(SQ_instance_n70) );
  NOR2_X1 SQ_instance_U66 ( .A1(SQ_instance_a_r[0]), .A2(SQ_instance_a_r[1]), 
        .ZN(SQ_instance_n90) );
  NAND2_X1 SQ_instance_U65 ( .A1(SQ_instance_n69), .A2(SQ_instance_n68), .ZN(
        SQ_instance_beta[3]) );
  NOR2_X1 SQ_instance_U64 ( .A1(SQ_instance_n67), .A2(SQ_instance_n66), .ZN(
        SQ_instance_n69) );
  NOR2_X1 SQ_instance_U63 ( .A1(SQ_instance_n65), .A2(SQ_instance_n64), .ZN(
        SQ_instance_n66) );
  INV_X1 SQ_instance_U62 ( .A(SQ_instance_n63), .ZN(SQ_instance_n64) );
  NOR2_X1 SQ_instance_U61 ( .A1(SQ_instance_n62), .A2(SQ_instance_n61), .ZN(
        SQ_instance_n67) );
  NOR2_X1 SQ_instance_U60 ( .A1(SQ_instance_alpha_r[3]), .A2(SQ_instance_n60), 
        .ZN(SQ_instance_n61) );
  NOR2_X1 SQ_instance_U59 ( .A1(SQ_instance_alpha_r[2]), .A2(SQ_instance_n59), 
        .ZN(SQ_instance_n60) );
  NAND2_X1 SQ_instance_U58 ( .A1(SQ_instance_n58), .A2(SQ_instance_n57), .ZN(
        SQ_instance_beta[2]) );
  NAND2_X1 SQ_instance_U57 ( .A1(SQ_instance_n63), .A2(SQ_instance_n68), .ZN(
        SQ_instance_n57) );
  NAND2_X1 SQ_instance_U56 ( .A1(SQ_instance_alpha_r[2]), .A2(
        SQ_instance_a_r[3]), .ZN(SQ_instance_n68) );
  NOR2_X1 SQ_instance_U55 ( .A1(SQ_instance_n59), .A2(SQ_instance_a_r[2]), 
        .ZN(SQ_instance_n63) );
  NOR2_X1 SQ_instance_U54 ( .A1(SQ_instance_n65), .A2(SQ_instance_n56), .ZN(
        SQ_instance_n58) );
  NOR2_X1 SQ_instance_U53 ( .A1(SQ_instance_n55), .A2(SQ_instance_n62), .ZN(
        SQ_instance_n56) );
  INV_X1 SQ_instance_U52 ( .A(SQ_instance_a_r[2]), .ZN(SQ_instance_n62) );
  NOR2_X1 SQ_instance_U51 ( .A1(SQ_instance_alpha_r[2]), .A2(SQ_instance_n54), 
        .ZN(SQ_instance_n55) );
  NOR2_X1 SQ_instance_U50 ( .A1(SQ_instance_alpha_r[3]), .A2(SQ_instance_n59), 
        .ZN(SQ_instance_n54) );
  NOR2_X1 SQ_instance_U49 ( .A1(SQ_instance_beta_coeff_muladd_1_2_cd_0_), .A2(
        SQ_instance_r_r[9]), .ZN(SQ_instance_n59) );
  AND2_X1 SQ_instance_U48 ( .A1(SQ_instance_alpha_r[3]), .A2(
        SQ_instance_a_r[3]), .ZN(SQ_instance_n65) );
  NOR2_X1 SQ_instance_U47 ( .A1(SQ_instance_n105), .A2(SQ_instance_n53), .ZN(
        b0[1]) );
  NOR2_X1 SQ_instance_U46 ( .A1(SQ_instance_n52), .A2(SQ_instance_n51), .ZN(
        SQ_instance_n53) );
  NOR2_X1 SQ_instance_U45 ( .A1(SQ_instance_n50), .A2(SQ_instance_n104), .ZN(
        SQ_instance_n51) );
  NOR2_X1 SQ_instance_U44 ( .A1(SQ_instance_n107), .A2(SQ_instance_n106), .ZN(
        SQ_instance_n104) );
  XOR2_X1 SQ_instance_U43 ( .A(SQ_instance_n49), .B(SQ_instance_n48), .Z(
        SQ_instance_n107) );
  NOR2_X1 SQ_instance_U42 ( .A1(SQ_instance_n50), .A2(SQ_instance_n47), .ZN(
        SQ_instance_n105) );
  NAND2_X1 SQ_instance_U41 ( .A1(SQ_instance_n52), .A2(SQ_instance_n106), .ZN(
        SQ_instance_n47) );
  NAND2_X1 SQ_instance_U40 ( .A1(SQ_instance_beta_r[5]), .A2(SQ_instance_n46), 
        .ZN(SQ_instance_n106) );
  NOR2_X1 SQ_instance_U39 ( .A1(SQ_instance_n49), .A2(SQ_instance_n48), .ZN(
        SQ_instance_n52) );
  INV_X1 SQ_instance_U38 ( .A(SQ_instance_beta_r[4]), .ZN(SQ_instance_n48) );
  NOR2_X1 SQ_instance_U37 ( .A1(SQ_instance_n45), .A2(SQ_instance_n44), .ZN(
        SQ_instance_n49) );
  XOR2_X1 SQ_instance_U36 ( .A(SQ_instance_n43), .B(SQ_instance_n42), .Z(
        SQ_instance_n44) );
  NOR2_X1 SQ_instance_U35 ( .A1(SQ_instance_n41), .A2(SQ_instance_n40), .ZN(
        SQ_instance_n45) );
  NOR2_X1 SQ_instance_U34 ( .A1(SQ_instance_beta_r[5]), .A2(SQ_instance_n46), 
        .ZN(SQ_instance_n50) );
  NAND2_X1 SQ_instance_U33 ( .A1(SQ_instance_n39), .A2(SQ_instance_n38), .ZN(
        SQ_instance_n46) );
  NAND2_X1 SQ_instance_U32 ( .A1(SQ_instance_n42), .A2(SQ_instance_n43), .ZN(
        SQ_instance_n38) );
  XOR2_X1 SQ_instance_U31 ( .A(SQ_instance_beta_r[0]), .B(
        SQ_instance_gamma_mul_rr[0]), .Z(SQ_instance_n43) );
  AND2_X1 SQ_instance_U30 ( .A1(SQ_instance_beta_r[1]), .A2(
        SQ_instance_gamma_mul_rr[1]), .ZN(SQ_instance_n42) );
  XNOR2_X1 SQ_instance_U29 ( .A(SQ_instance_n40), .B(SQ_instance_n41), .ZN(
        SQ_instance_n39) );
  XNOR2_X1 SQ_instance_U28 ( .A(SQ_instance_beta_r[1]), .B(
        SQ_instance_gamma_mul_rr[1]), .ZN(SQ_instance_n41) );
  NAND2_X1 SQ_instance_U27 ( .A1(SQ_instance_beta_r[0]), .A2(
        SQ_instance_gamma_mul_rr[0]), .ZN(SQ_instance_n40) );
  OR2_X1 SQ_instance_U22 ( .A1(a_sel_rr[5]), .A2(a_sel_rr[4]), .ZN(
        SQ_instance_gamma_mul[4]) );
  AND2_X1 SQ_instance_U21 ( .A1(SQ_instance_n37), .A2(SQ_instance_n36), .ZN(
        b1[0]) );
  NAND2_X1 SQ_instance_U20 ( .A1(SQ_instance_n147), .A2(SQ_instance_n148), 
        .ZN(SQ_instance_n36) );
  OR2_X1 SQ_instance_U19 ( .A1(SQ_instance_n35), .A2(SQ_instance_n34), .ZN(
        SQ_instance_n148) );
  NOR2_X1 SQ_instance_U18 ( .A1(SQ_instance_n33), .A2(SQ_instance_r_rr[6]), 
        .ZN(SQ_instance_n34) );
  NOR2_X1 SQ_instance_U17 ( .A1(SQ_instance_r_rr[7]), .A2(SQ_instance_n32), 
        .ZN(SQ_instance_n35) );
  NOR2_X1 SQ_instance_U16 ( .A1(SQ_instance_n31), .A2(SQ_instance_n30), .ZN(
        SQ_instance_n147) );
  NAND2_X1 SQ_instance_U15 ( .A1(SQ_instance_n30), .A2(SQ_instance_n31), .ZN(
        SQ_instance_n37) );
  XOR2_X1 SQ_instance_U14 ( .A(SQ_instance_r_rr[7]), .B(SQ_instance_n32), .Z(
        SQ_instance_n31) );
  NAND2_X1 SQ_instance_U13 ( .A1(SQ_instance_n33), .A2(SQ_instance_r_rr[6]), 
        .ZN(SQ_instance_n32) );
  NOR2_X1 SQ_instance_U12 ( .A1(SQ_instance_n29), .A2(SQ_instance_n28), .ZN(
        SQ_instance_n33) );
  NOR2_X1 SQ_instance_U11 ( .A1(SQ_instance_n27), .A2(SQ_instance_n26), .ZN(
        SQ_instance_n28) );
  NAND2_X1 SQ_instance_U10 ( .A1(SQ_instance_n25), .A2(SQ_instance_n24), .ZN(
        SQ_instance_n26) );
  NAND2_X1 SQ_instance_U9 ( .A1(SQ_instance_beta_r[3]), .A2(SQ_instance_n23), 
        .ZN(SQ_instance_n25) );
  NOR2_X1 SQ_instance_U8 ( .A1(SQ_instance_n29), .A2(SQ_instance_n22), .ZN(
        SQ_instance_n30) );
  XNOR2_X1 SQ_instance_U7 ( .A(SQ_instance_n23), .B(SQ_instance_n21), .ZN(
        SQ_instance_n22) );
  NAND2_X1 SQ_instance_U6 ( .A1(SQ_instance_beta_r[3]), .A2(
        SQ_instance_gamma_mul_rr[3]), .ZN(SQ_instance_n21) );
  XOR2_X1 SQ_instance_U5 ( .A(SQ_instance_beta_r[2]), .B(
        SQ_instance_gamma_mul_rr[2]), .Z(SQ_instance_n23) );
  NOR2_X1 SQ_instance_U4 ( .A1(SQ_instance_n24), .A2(SQ_instance_n20), .ZN(
        SQ_instance_n29) );
  INV_X1 SQ_instance_U3 ( .A(SQ_instance_n27), .ZN(SQ_instance_n20) );
  XOR2_X1 SQ_instance_U2 ( .A(SQ_instance_beta_r[3]), .B(
        SQ_instance_gamma_mul_rr[3]), .Z(SQ_instance_n27) );
  NAND2_X1 SQ_instance_U1 ( .A1(SQ_instance_beta_r[2]), .A2(
        SQ_instance_gamma_mul_rr[2]), .ZN(SQ_instance_n24) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_0_ ( .D(a_sel_rr[0]), .CK(clk), .Q(
        SQ_instance_a_r[0]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_1_ ( .D(a_sel_rr[1]), .CK(clk), .Q(
        SQ_instance_a_r[1]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_2_ ( .D(a_sel_rr[2]), .CK(clk), .Q(
        SQ_instance_a_r[2]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_3_ ( .D(a_sel_rr[3]), .CK(clk), .Q(
        SQ_instance_a_r[3]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_6_ ( .D(r_rr[6]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_0_1_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_7_ ( .D(r_rr[7]), .CK(clk), .Q(
        SQ_instance_r_r[7]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_8_ ( .D(r_rr[8]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_1_2_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_9_ ( .D(r_rr[9]), .CK(clk), .Q(
        SQ_instance_r_r[9]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_10_ ( .D(r_rr[10]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_0_2_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_11_ ( .D(r_rr[11]), .CK(clk), .Q(
        SQ_instance_r_r[11]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_6_ ( .D(
        SQ_instance_beta_coeff_muladd_0_1_cd_0_), .CK(clk), .Q(
        SQ_instance_r_rr[6]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_7_ ( .D(SQ_instance_r_r[7]), .CK(clk), 
        .Q(SQ_instance_r_rr[7]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_10_ ( .D(
        SQ_instance_beta_coeff_muladd_0_2_cd_0_), .CK(clk), .Q(
        SQ_instance_r_rr[10]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_11_ ( .D(SQ_instance_r_r[11]), .CK(clk), 
        .Q(SQ_instance_r_rr[11]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_0_ ( .D(SQ_instance_add_x_2_n6), .CK(
        clk), .Q(SQ_instance_alpha_r[0]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_1_ ( .D(SQ_instance_alpha[1]), .CK(
        clk), .Q(SQ_instance_alpha_r[1]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_2_ ( .D(SQ_instance_add_x_6_n6), .CK(
        clk), .Q(SQ_instance_alpha_r[2]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_3_ ( .D(SQ_instance_alpha[3]), .CK(
        clk), .Q(SQ_instance_alpha_r[3]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_4_ ( .D(SQ_instance_add_x_4_n6), .CK(
        clk), .Q(SQ_instance_alpha_r[4]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_5_ ( .D(SQ_instance_alpha[5]), .CK(
        clk), .Q(SQ_instance_alpha_r[5]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_0_ ( .D(SQ_instance_beta[0]), .CK(clk), 
        .Q(SQ_instance_beta_r[0]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_1_ ( .D(SQ_instance_beta[1]), .CK(clk), 
        .Q(SQ_instance_beta_r[1]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_2_ ( .D(SQ_instance_beta[2]), .CK(clk), 
        .Q(SQ_instance_beta_r[2]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_3_ ( .D(SQ_instance_beta[3]), .CK(clk), 
        .Q(SQ_instance_beta_r[3]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_4_ ( .D(SQ_instance_beta[4]), .CK(clk), 
        .Q(SQ_instance_beta_r[4]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_5_ ( .D(SQ_instance_beta[5]), .CK(clk), 
        .Q(SQ_instance_beta_r[5]) );
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_0_ ( .D(SQ_instance_gamma_mul[0]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[0]) );
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_1_ ( .D(SQ_instance_gamma_mul[1]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[1]) );
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_2_ ( .D(SQ_instance_gamma_mul[2]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[2]) );
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_3_ ( .D(SQ_instance_gamma_mul[3]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[3]) );
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_4_ ( .D(SQ_instance_gamma_mul[4]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[4]) );
  INV_X1 SQ_instance_gamma_reg2_U3 ( .A(SQ_instance_gamma_mul_beta_1_), .ZN(
        SQ_instance_gamma_reg2_n5) );
  INV_X1 SQ_instance_gamma_reg2_U2 ( .A(SQ_instance_gamma_reg2_n5), .ZN(
        SQ_instance_gamma_coeff_mul_beta_sub_0_1_abc_0_) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_4_ ( .D(SQ_instance_gamma_mul_r[4]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_beta_1_) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_0_ ( .D(SQ_instance_gamma_mul_r[0]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[0]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_1_ ( .D(SQ_instance_gamma_mul_r[1]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[1]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_2_ ( .D(SQ_instance_gamma_mul_r[2]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[2]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_3_ ( .D(SQ_instance_gamma_mul_r[3]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[3]) );
endmodule

