module SQ_4SHARE_SILVERWRAP ( clk, a0, a1, a2, a3, r0, r1, r2, r3, r4, r5, r6, 
        r7, r8, r9, r10, r11, b0, b1, b2, b3 );
(* SILVER="[1:0]_0" *)  input [1:0] a0;
(* SILVER="[1:0]_1" *)  input [1:0] a1;
(* SILVER="[1:0]_2" *)  input [1:0] a2;
(* SILVER="[1:0]_3" *)  input [1:0] a3;
(* SILVER="refresh" *)  input [1:0] r0;
(* SILVER="refresh" *)  input [1:0] r1;
(* SILVER="refresh" *)  input [1:0] r2;
(* SILVER="refresh" *)  input [1:0] r3;
(* SILVER="refresh" *)  input [1:0] r4;
(* SILVER="refresh" *)  input [1:0] r5;
(* SILVER="refresh" *)  input [1:0] r6;
(* SILVER="refresh" *)  input [1:0] r7;
(* SILVER="refresh" *)  input [1:0] r8;
(* SILVER="refresh" *)  input [1:0] r9;
(* SILVER="refresh" *)  input [1:0] r10;
(* SILVER="refresh" *)  input [1:0] r11;
(* SILVER="[1:0]_0" *)  output [1:0] b0;
(* SILVER="[1:0]_1" *)  output [1:0] b1;
(* SILVER="[1:0]_2" *)  output [1:0] b2;
(* SILVER="[1:0]_3" *)  output [1:0] b3;
(* SILVER="clock" *)  input clk;
  wire   r0_p_r, r1_p_r, r2_p_r, r3_p_r, r4_p_r, r5_p_r, r6_p_r, r7_p_r,
         r8_p_r, r9_p_r, r10_p_r, r11_p_r, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, net6282, net6283, net6284, net6285, net6286, net6287,
         net6288, net6289, net6290, RED1_n1, RED2_n1, RED3_n1, RED4_n1,
         SQ_instance_net6281, SQ_instance_net6280, SQ_instance_net6279,
         SQ_instance_net6278, SQ_instance_net6277, SQ_instance_net6276,
         SQ_instance_net6275, SQ_instance_net6274, SQ_instance_net6273,
         SQ_instance_net6272, SQ_instance_net6271, SQ_instance_net6270,
         SQ_instance_net6269, SQ_instance_net6268, SQ_instance_net6267,
         SQ_instance_net6266, SQ_instance_net6265, SQ_instance_net6264,
         SQ_instance_net6263, SQ_instance_net6262, SQ_instance_net6261,
         SQ_instance_net6260, SQ_instance_net6259, SQ_instance_net6258,
         SQ_instance_net6257, SQ_instance_net6256, SQ_instance_net6255,
         SQ_instance_net6254, SQ_instance_net6253, SQ_instance_net6252,
         SQ_instance_net6251, SQ_instance_net6250, SQ_instance_net6249,
         SQ_instance_net6248, SQ_instance_net6247, SQ_instance_net6246,
         SQ_instance_net6245, SQ_instance_n402, SQ_instance_n401,
         SQ_instance_n400, SQ_instance_n399, SQ_instance_n398,
         SQ_instance_n397, SQ_instance_n396, SQ_instance_n395,
         SQ_instance_n394, SQ_instance_n393, SQ_instance_n392,
         SQ_instance_n391, SQ_instance_n390, SQ_instance_n389,
         SQ_instance_n388, SQ_instance_n387, SQ_instance_n386,
         SQ_instance_n385, SQ_instance_n384, SQ_instance_n383,
         SQ_instance_n382, SQ_instance_n381, SQ_instance_n380,
         SQ_instance_n379, SQ_instance_n378, SQ_instance_n377,
         SQ_instance_n376, SQ_instance_n375, SQ_instance_n374,
         SQ_instance_n373, SQ_instance_n372, SQ_instance_n371,
         SQ_instance_n370, SQ_instance_n369, SQ_instance_n368,
         SQ_instance_n367, SQ_instance_n366, SQ_instance_n365,
         SQ_instance_n364, SQ_instance_n363, SQ_instance_n362,
         SQ_instance_n361, SQ_instance_n360, SQ_instance_n359,
         SQ_instance_n358, SQ_instance_n357, SQ_instance_n356,
         SQ_instance_n355, SQ_instance_n354, SQ_instance_n353,
         SQ_instance_n352, SQ_instance_n351, SQ_instance_n350,
         SQ_instance_n349, SQ_instance_n348, SQ_instance_n347,
         SQ_instance_n346, SQ_instance_n345, SQ_instance_n344,
         SQ_instance_n343, SQ_instance_n342, SQ_instance_n341,
         SQ_instance_n340, SQ_instance_n339, SQ_instance_n338,
         SQ_instance_n337, SQ_instance_n336, SQ_instance_n335,
         SQ_instance_n334, SQ_instance_n333, SQ_instance_n332,
         SQ_instance_n331, SQ_instance_n330, SQ_instance_n329,
         SQ_instance_n328, SQ_instance_n327, SQ_instance_n326,
         SQ_instance_n325, SQ_instance_n324, SQ_instance_n323,
         SQ_instance_n322, SQ_instance_n321, SQ_instance_n320,
         SQ_instance_n319, SQ_instance_n318, SQ_instance_n317,
         SQ_instance_n316, SQ_instance_n315, SQ_instance_n314,
         SQ_instance_n313, SQ_instance_n312, SQ_instance_n311,
         SQ_instance_n310, SQ_instance_n309, SQ_instance_n308,
         SQ_instance_n307, SQ_instance_n306, SQ_instance_n305,
         SQ_instance_n304, SQ_instance_n303, SQ_instance_n302,
         SQ_instance_n301, SQ_instance_n300, SQ_instance_n299,
         SQ_instance_n298, SQ_instance_n297, SQ_instance_n296,
         SQ_instance_n295, SQ_instance_n294, SQ_instance_n293,
         SQ_instance_n292, SQ_instance_n291, SQ_instance_n290,
         SQ_instance_n289, SQ_instance_n288, SQ_instance_n287,
         SQ_instance_n286, SQ_instance_n285, SQ_instance_n284,
         SQ_instance_n283, SQ_instance_n282, SQ_instance_n281,
         SQ_instance_n280, SQ_instance_n279, SQ_instance_n278,
         SQ_instance_n277, SQ_instance_n276, SQ_instance_n275,
         SQ_instance_n274, SQ_instance_n273, SQ_instance_n272,
         SQ_instance_n271, SQ_instance_n270, SQ_instance_n269,
         SQ_instance_n268, SQ_instance_n267, SQ_instance_n266,
         SQ_instance_n265, SQ_instance_n264, SQ_instance_n263,
         SQ_instance_n262, SQ_instance_n261, SQ_instance_n260,
         SQ_instance_n259, SQ_instance_n258, SQ_instance_n257,
         SQ_instance_n256, SQ_instance_n255, SQ_instance_n254,
         SQ_instance_n253, SQ_instance_n252, SQ_instance_n251,
         SQ_instance_n250, SQ_instance_n249, SQ_instance_n248,
         SQ_instance_n247, SQ_instance_n246, SQ_instance_n245,
         SQ_instance_n244, SQ_instance_n243, SQ_instance_n242,
         SQ_instance_n241, SQ_instance_n240, SQ_instance_n239,
         SQ_instance_n238, SQ_instance_n237, SQ_instance_n236,
         SQ_instance_n235, SQ_instance_n234, SQ_instance_n233,
         SQ_instance_n232, SQ_instance_n231, SQ_instance_n230,
         SQ_instance_n229, SQ_instance_n228, SQ_instance_n227,
         SQ_instance_n226, SQ_instance_n225, SQ_instance_n224,
         SQ_instance_n223, SQ_instance_n222, SQ_instance_n221,
         SQ_instance_n220, SQ_instance_n219, SQ_instance_n218,
         SQ_instance_n217, SQ_instance_n216, SQ_instance_n215,
         SQ_instance_n214, SQ_instance_n213, SQ_instance_n212,
         SQ_instance_n211, SQ_instance_n210, SQ_instance_n209,
         SQ_instance_n208, SQ_instance_n207, SQ_instance_n206,
         SQ_instance_n205, SQ_instance_n204, SQ_instance_n203,
         SQ_instance_n202, SQ_instance_n201, SQ_instance_n200,
         SQ_instance_n199, SQ_instance_n198, SQ_instance_n197,
         SQ_instance_n196, SQ_instance_n195, SQ_instance_n194,
         SQ_instance_n193, SQ_instance_n192, SQ_instance_n191,
         SQ_instance_n190, SQ_instance_n189, SQ_instance_n188,
         SQ_instance_n187, SQ_instance_n186, SQ_instance_n185,
         SQ_instance_n184, SQ_instance_n183, SQ_instance_n182,
         SQ_instance_n181, SQ_instance_n180, SQ_instance_n179,
         SQ_instance_n178, SQ_instance_n177, SQ_instance_n176,
         SQ_instance_n175, SQ_instance_n174, SQ_instance_n173,
         SQ_instance_n172, SQ_instance_n171, SQ_instance_n170,
         SQ_instance_n169, SQ_instance_n168, SQ_instance_n167,
         SQ_instance_n166, SQ_instance_n165, SQ_instance_n164,
         SQ_instance_n163, SQ_instance_n162, SQ_instance_n161,
         SQ_instance_n160, SQ_instance_n159, SQ_instance_n158,
         SQ_instance_n157, SQ_instance_n156, SQ_instance_n155,
         SQ_instance_n154, SQ_instance_n153, SQ_instance_n152,
         SQ_instance_n151, SQ_instance_n150, SQ_instance_n149,
         SQ_instance_n148, SQ_instance_n147, SQ_instance_n146,
         SQ_instance_n145, SQ_instance_n144, SQ_instance_n143,
         SQ_instance_n142, SQ_instance_n141, SQ_instance_n140,
         SQ_instance_n139, SQ_instance_n138, SQ_instance_n137,
         SQ_instance_n136, SQ_instance_n135, SQ_instance_n134,
         SQ_instance_n133, SQ_instance_n132, SQ_instance_n131,
         SQ_instance_n130, SQ_instance_n129, SQ_instance_n128,
         SQ_instance_n127, SQ_instance_n126, SQ_instance_n125,
         SQ_instance_n124, SQ_instance_n123, SQ_instance_n122,
         SQ_instance_n121, SQ_instance_n120, SQ_instance_n119,
         SQ_instance_n118, SQ_instance_n117, SQ_instance_n116,
         SQ_instance_n115, SQ_instance_n114, SQ_instance_n113,
         SQ_instance_n112, SQ_instance_n111, SQ_instance_n110,
         SQ_instance_n109, SQ_instance_n108, SQ_instance_n107,
         SQ_instance_n106, SQ_instance_n105, SQ_instance_n104,
         SQ_instance_n103, SQ_instance_n102, SQ_instance_n101,
         SQ_instance_n100, SQ_instance_n99, SQ_instance_n98, SQ_instance_n97,
         SQ_instance_n96, SQ_instance_n95, SQ_instance_n94, SQ_instance_n93,
         SQ_instance_n92, SQ_instance_n91, SQ_instance_n90, SQ_instance_n89,
         SQ_instance_n88, SQ_instance_n87, SQ_instance_n86, SQ_instance_n85,
         SQ_instance_n84, SQ_instance_n83, SQ_instance_n82, SQ_instance_n81,
         SQ_instance_n80, SQ_instance_n79, SQ_instance_n78, SQ_instance_n77,
         SQ_instance_n76, SQ_instance_n75, SQ_instance_n74, SQ_instance_n73,
         SQ_instance_n72, SQ_instance_n71, SQ_instance_n70, SQ_instance_n69,
         SQ_instance_n68, SQ_instance_n67, SQ_instance_n66, SQ_instance_n65,
         SQ_instance_n64, SQ_instance_n63, SQ_instance_n62, SQ_instance_n61,
         SQ_instance_n60, SQ_instance_n59, SQ_instance_n58, SQ_instance_n57,
         SQ_instance_n56, SQ_instance_n55, SQ_instance_n54, SQ_instance_n53,
         SQ_instance_n52, SQ_instance_n51, SQ_instance_n50, SQ_instance_n49,
         SQ_instance_n48, SQ_instance_n47, SQ_instance_n46, SQ_instance_n45,
         SQ_instance_n44, SQ_instance_n43, SQ_instance_n42, SQ_instance_n41,
         SQ_instance_n40, SQ_instance_n39, SQ_instance_n38, SQ_instance_n37,
         SQ_instance_n36, SQ_instance_n35, SQ_instance_n34,
         SQ_instance_add_x_2_n6, SQ_instance_add_x_5_n6,
         SQ_instance_add_x_7_n6, SQ_instance_add_x_9_n6,
         SQ_instance_add_x_14_n6, SQ_instance_add_x_19_n6,
         SQ_instance_beta_coeff_muladd_2_3_cd_0_,
         SQ_instance_beta_coeff_muladd_1_3_cd_0_,
         SQ_instance_beta_coeff_muladd_0_3_cd_0_,
         SQ_instance_beta_coeff_muladd_0_1_cd_0_, SQ_instance_gamma_reg2_n8;
  wire   [7:0] a_mod;
  wire   [7:0] a_sel_r;
  wire   [7:0] a_mod_r;
  wire   [7:0] a_sel_rr;
  wire   [23:0] r_rr;
  wire   [23:0] r_r;
  wire   [6:0] SQ_instance_gamma_mul_r;
  wire   [23:12] SQ_instance_r_rr;
  wire   [11:0] SQ_instance_beta_r;
  wire   [6:0] SQ_instance_gamma_mul;
  wire   [11:0] SQ_instance_alpha_r;
  wire   [5:0] SQ_instance_a_r;
  wire   [23:13] SQ_instance_r_r;
  wire   [11:0] SQ_instance_beta;
  wire   [11:1] SQ_instance_alpha;
  wire   [1:0] SQ_instance_gamma_mul_beta;
  wire   [5:0] SQ_instance_gamma_mul_rr;

  DFF_X1 a_mod_r_reg_7_ ( .D(a_mod[7]), .CK(clk), .Q(a_mod_r[7]) );
  DFF_X1 a_mod_r_reg_6_ ( .D(a_mod[6]), .CK(clk), .Q(a_mod_r[6]) );
  DFF_X1 a_mod_r_reg_5_ ( .D(a_mod[5]), .CK(clk), .Q(a_mod_r[5]) );
  DFF_X1 a_mod_r_reg_4_ ( .D(a_mod[4]), .CK(clk), .Q(a_mod_r[4]) );
  DFF_X1 a_mod_r_reg_3_ ( .D(a_mod[3]), .CK(clk), .Q(a_mod_r[3]) );
  DFF_X1 a_mod_r_reg_2_ ( .D(a_mod[2]), .CK(clk), .Q(a_mod_r[2]) );
  DFF_X1 a_mod_r_reg_1_ ( .D(a_mod[1]), .CK(clk), .Q(a_mod_r[1]) );
  DFF_X1 a_mod_r_reg_0_ ( .D(a_mod[0]), .CK(clk), .Q(a_mod_r[0]) );
  DFF_X1 r0_p_r_reg ( .D(n12), .CK(clk), .Q(r0_p_r) );
  DFF_X1 r1_p_r_reg ( .D(n13), .CK(clk), .Q(r1_p_r) );
  DFF_X1 r2_p_r_reg ( .D(n14), .CK(clk), .Q(r2_p_r) );
  DFF_X1 r3_p_r_reg ( .D(n15), .CK(clk), .Q(r3_p_r) );
  DFF_X1 r4_p_r_reg ( .D(n16), .CK(clk), .Q(r4_p_r) );
  DFF_X1 r5_p_r_reg ( .D(n17), .CK(clk), .Q(r5_p_r) );
  DFF_X1 r6_p_r_reg ( .D(n18), .CK(clk), .Q(r6_p_r) );
  DFF_X1 r7_p_r_reg ( .D(n19), .CK(clk), .Q(r7_p_r) );
  DFF_X1 r8_p_r_reg ( .D(n20), .CK(clk), .Q(r8_p_r) );
  DFF_X1 r9_p_r_reg ( .D(n21), .CK(clk), .Q(r9_p_r) );
  DFF_X1 r10_p_r_reg ( .D(n22), .CK(clk), .Q(r10_p_r) );
  DFF_X1 r11_p_r_reg ( .D(n23), .CK(clk), .Q(r11_p_r) );
  DFF_X1 r_r_reg_23_ ( .D(r0[1]), .CK(clk), .Q(r_r[23]) );
  DFF_X1 r_r_reg_22_ ( .D(r0[0]), .CK(clk), .Q(r_r[22]) );
  DFF_X1 r_r_reg_21_ ( .D(r1[1]), .CK(clk), .Q(r_r[21]) );
  DFF_X1 r_r_reg_20_ ( .D(r1[0]), .CK(clk), .Q(r_r[20]) );
  DFF_X1 r_r_reg_19_ ( .D(r2[1]), .CK(clk), .Q(r_r[19]) );
  DFF_X1 r_r_reg_18_ ( .D(r2[0]), .CK(clk), .Q(r_r[18]) );
  DFF_X1 r_r_reg_17_ ( .D(r3[1]), .CK(clk), .Q(r_r[17]) );
  DFF_X1 r_r_reg_16_ ( .D(r3[0]), .CK(clk), .Q(r_r[16]) );
  DFF_X1 r_r_reg_15_ ( .D(r4[1]), .CK(clk), .Q(r_r[15]) );
  DFF_X1 r_r_reg_14_ ( .D(r4[0]), .CK(clk), .Q(r_r[14]) );
  DFF_X1 r_r_reg_13_ ( .D(r5[1]), .CK(clk), .Q(r_r[13]) );
  DFF_X1 r_r_reg_12_ ( .D(r5[0]), .CK(clk), .Q(r_r[12]) );
  DFF_X1 r_r_reg_11_ ( .D(r6[1]), .CK(clk), .Q(r_r[11]) );
  DFF_X1 r_r_reg_10_ ( .D(r6[0]), .CK(clk), .Q(r_r[10]) );
  DFF_X1 r_r_reg_9_ ( .D(r7[1]), .CK(clk), .Q(r_r[9]) );
  DFF_X1 r_r_reg_8_ ( .D(r7[0]), .CK(clk), .Q(r_r[8]) );
  DFF_X1 r_r_reg_7_ ( .D(r8[1]), .CK(clk), .Q(r_r[7]) );
  DFF_X1 r_r_reg_6_ ( .D(r8[0]), .CK(clk), .Q(r_r[6]) );
  DFF_X1 r_r_reg_5_ ( .D(r9[1]), .CK(clk), .Q(r_r[5]) );
  DFF_X1 r_r_reg_4_ ( .D(r9[0]), .CK(clk), .Q(r_r[4]) );
  DFF_X1 r_r_reg_3_ ( .D(r10[1]), .CK(clk), .Q(r_r[3]) );
  DFF_X1 r_r_reg_2_ ( .D(r10[0]), .CK(clk), .Q(r_r[2]) );
  DFF_X1 r_r_reg_1_ ( .D(r11[1]), .CK(clk), .Q(r_r[1]) );
  DFF_X1 r_r_reg_0_ ( .D(r11[0]), .CK(clk), .Q(r_r[0]) );
  DFF_X1 r_rr_reg_23_ ( .D(r_r[23]), .CK(clk), .Q(r_rr[23]) );
  DFF_X1 r_rr_reg_22_ ( .D(r_r[22]), .CK(clk), .Q(r_rr[22]) );
  DFF_X1 r_rr_reg_21_ ( .D(r_r[21]), .CK(clk), .Q(r_rr[21]) );
  DFF_X1 r_rr_reg_20_ ( .D(r_r[20]), .CK(clk), .Q(r_rr[20]) );
  DFF_X1 r_rr_reg_19_ ( .D(r_r[19]), .CK(clk), .Q(r_rr[19]) );
  DFF_X1 r_rr_reg_18_ ( .D(r_r[18]), .CK(clk), .Q(r_rr[18]) );
  DFF_X1 r_rr_reg_17_ ( .D(r_r[17]), .CK(clk), .Q(r_rr[17]) );
  DFF_X1 r_rr_reg_16_ ( .D(r_r[16]), .CK(clk), .Q(r_rr[16]) );
  DFF_X1 r_rr_reg_15_ ( .D(r_r[15]), .CK(clk), .Q(r_rr[15]) );
  DFF_X1 r_rr_reg_14_ ( .D(r_r[14]), .CK(clk), .Q(r_rr[14]) );
  DFF_X1 r_rr_reg_13_ ( .D(r_r[13]), .CK(clk), .Q(r_rr[13]) );
  DFF_X1 r_rr_reg_12_ ( .D(r_r[12]), .CK(clk), .Q(r_rr[12]) );
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
  DFF_X1 a_sel_rr_reg_7_ ( .D(a_sel_r[7]), .CK(clk), .Q(a_sel_rr[7]) );
  DFF_X1 a_sel_rr_reg_6_ ( .D(a_sel_r[6]), .CK(clk), .Q(a_sel_rr[6]) );
  DFF_X1 a_sel_rr_reg_5_ ( .D(a_sel_r[5]), .CK(clk), .Q(a_sel_rr[5]) );
  DFF_X1 a_sel_rr_reg_4_ ( .D(a_sel_r[4]), .CK(clk), .Q(a_sel_rr[4]) );
  DFF_X1 a_sel_rr_reg_3_ ( .D(a_sel_r[3]), .CK(clk), .Q(a_sel_rr[3]) );
  DFF_X1 a_sel_rr_reg_2_ ( .D(a_sel_r[2]), .CK(clk), .Q(a_sel_rr[2]) );
  DFF_X1 a_sel_rr_reg_1_ ( .D(a_sel_r[1]), .CK(clk), .Q(a_sel_rr[1]) );
  DFF_X1 a_sel_rr_reg_0_ ( .D(a_sel_r[0]), .CK(clk), .Q(a_sel_rr[0]) );
  OR2_X1 U36 ( .A1(r9_p_r), .A2(r11_p_r), .ZN(n33) );
  NOR2_X1 U37 ( .A1(r3_p_r), .A2(r10_p_r), .ZN(n31) );
  NOR2_X1 U38 ( .A1(r7_p_r), .A2(r0_p_r), .ZN(n25) );
  NOR2_X1 U39 ( .A1(r2_p_r), .A2(r1_p_r), .ZN(n24) );
  NAND2_X1 U40 ( .A1(n25), .A2(n24), .ZN(n29) );
  NOR2_X1 U41 ( .A1(r8_p_r), .A2(r4_p_r), .ZN(n27) );
  NOR2_X1 U42 ( .A1(r5_p_r), .A2(r6_p_r), .ZN(n26) );
  NAND2_X1 U43 ( .A1(n27), .A2(n26), .ZN(n28) );
  NOR2_X1 U44 ( .A1(n29), .A2(n28), .ZN(n30) );
  NAND2_X1 U45 ( .A1(n31), .A2(n30), .ZN(n32) );
  NOR2_X1 U46 ( .A1(n33), .A2(n32), .ZN(n34) );
  AND2_X1 U47 ( .A1(n34), .A2(a_mod_r[6]), .ZN(a_sel_r[6]) );
  AND2_X1 U48 ( .A1(n34), .A2(a_mod_r[5]), .ZN(a_sel_r[5]) );
  AND2_X1 U49 ( .A1(n34), .A2(a_mod_r[4]), .ZN(a_sel_r[4]) );
  AND2_X1 U50 ( .A1(n34), .A2(a_mod_r[7]), .ZN(a_sel_r[7]) );
  AND2_X1 U51 ( .A1(n34), .A2(a_mod_r[2]), .ZN(a_sel_r[2]) );
  AND2_X1 U52 ( .A1(n34), .A2(a_mod_r[1]), .ZN(a_sel_r[1]) );
  AND2_X1 U53 ( .A1(n34), .A2(a_mod_r[0]), .ZN(a_sel_r[0]) );
  AND2_X1 U54 ( .A1(n34), .A2(a_mod_r[3]), .ZN(a_sel_r[3]) );
  NOR2_X1 U57 ( .A1(r11[0]), .A2(r11[1]), .ZN(n23) );
  NOR2_X1 U58 ( .A1(r10[0]), .A2(r10[1]), .ZN(n22) );
  NOR2_X1 U59 ( .A1(r9[0]), .A2(r9[1]), .ZN(n21) );
  NOR2_X1 U60 ( .A1(r8[0]), .A2(r8[1]), .ZN(n20) );
  NOR2_X1 U61 ( .A1(r7[0]), .A2(r7[1]), .ZN(n19) );
  NOR2_X1 U62 ( .A1(r6[0]), .A2(r6[1]), .ZN(n18) );
  NOR2_X1 U63 ( .A1(r5[0]), .A2(r5[1]), .ZN(n17) );
  NOR2_X1 U64 ( .A1(r4[0]), .A2(r4[1]), .ZN(n16) );
  NOR2_X1 U65 ( .A1(r3[0]), .A2(r3[1]), .ZN(n15) );
  NOR2_X1 U66 ( .A1(r2[0]), .A2(r2[1]), .ZN(n14) );
  NOR2_X1 U67 ( .A1(r1[0]), .A2(r1[1]), .ZN(n13) );
  NOR2_X1 U68 ( .A1(r0[0]), .A2(r0[1]), .ZN(n12) );
  NAND2_X1 RED1_U4 ( .A1(a0[1]), .A2(RED1_n1), .ZN(a_mod[0]) );
  OR2_X1 RED1_U3 ( .A1(a0[1]), .A2(RED1_n1), .ZN(a_mod[1]) );
  INV_X1 RED1_U2 ( .A(a0[0]), .ZN(RED1_n1) );
  NAND2_X1 RED2_U4 ( .A1(a1[1]), .A2(RED2_n1), .ZN(a_mod[2]) );
  OR2_X1 RED2_U3 ( .A1(a1[1]), .A2(RED2_n1), .ZN(a_mod[3]) );
  INV_X1 RED2_U2 ( .A(a1[0]), .ZN(RED2_n1) );
  NAND2_X1 RED3_U4 ( .A1(a2[1]), .A2(RED3_n1), .ZN(a_mod[4]) );
  OR2_X1 RED3_U3 ( .A1(a2[1]), .A2(RED3_n1), .ZN(a_mod[5]) );
  INV_X1 RED3_U2 ( .A(a2[0]), .ZN(RED3_n1) );
  NAND2_X1 RED4_U4 ( .A1(a3[1]), .A2(RED4_n1), .ZN(a_mod[6]) );
  OR2_X1 RED4_U3 ( .A1(a3[1]), .A2(RED4_n1), .ZN(a_mod[7]) );
  INV_X1 RED4_U2 ( .A(a3[0]), .ZN(RED4_n1) );
  NOR2_X1 SQ_instance_U411 ( .A1(SQ_instance_n402), .A2(SQ_instance_n401), 
        .ZN(SQ_instance_alpha[6]) );
  NOR2_X1 SQ_instance_U410 ( .A1(SQ_instance_n400), .A2(SQ_instance_n399), 
        .ZN(SQ_instance_n401) );
  NOR2_X1 SQ_instance_U409 ( .A1(r_rr[6]), .A2(SQ_instance_n398), .ZN(
        SQ_instance_n402) );
  XNOR2_X1 SQ_instance_U408 ( .A(SQ_instance_n400), .B(SQ_instance_n399), .ZN(
        SQ_instance_alpha[7]) );
  NAND2_X1 SQ_instance_U407 ( .A1(r_rr[6]), .A2(SQ_instance_n398), .ZN(
        SQ_instance_n399) );
  XNOR2_X1 SQ_instance_U406 ( .A(a_sel_rr[4]), .B(SQ_instance_n397), .ZN(
        SQ_instance_n398) );
  NOR2_X1 SQ_instance_U405 ( .A1(SQ_instance_n396), .A2(SQ_instance_n395), 
        .ZN(SQ_instance_n400) );
  NOR2_X1 SQ_instance_U404 ( .A1(r_rr[7]), .A2(a_sel_rr[5]), .ZN(
        SQ_instance_n395) );
  NOR2_X1 SQ_instance_U403 ( .A1(a_sel_rr[4]), .A2(SQ_instance_n397), .ZN(
        SQ_instance_n396) );
  NAND2_X1 SQ_instance_U402 ( .A1(r_rr[7]), .A2(a_sel_rr[5]), .ZN(
        SQ_instance_n397) );
  NOR2_X1 SQ_instance_U401 ( .A1(SQ_instance_n394), .A2(SQ_instance_n393), 
        .ZN(SQ_instance_alpha[2]) );
  NOR2_X1 SQ_instance_U400 ( .A1(SQ_instance_n392), .A2(SQ_instance_n391), 
        .ZN(SQ_instance_n393) );
  NOR2_X1 SQ_instance_U399 ( .A1(r_rr[2]), .A2(SQ_instance_n390), .ZN(
        SQ_instance_n394) );
  XNOR2_X1 SQ_instance_U398 ( .A(SQ_instance_n392), .B(SQ_instance_n391), .ZN(
        SQ_instance_alpha[3]) );
  NAND2_X1 SQ_instance_U397 ( .A1(r_rr[2]), .A2(SQ_instance_n390), .ZN(
        SQ_instance_n391) );
  XNOR2_X1 SQ_instance_U396 ( .A(a_sel_rr[4]), .B(SQ_instance_n389), .ZN(
        SQ_instance_n390) );
  NOR2_X1 SQ_instance_U395 ( .A1(SQ_instance_n388), .A2(SQ_instance_n387), 
        .ZN(SQ_instance_n392) );
  NOR2_X1 SQ_instance_U394 ( .A1(r_rr[3]), .A2(a_sel_rr[5]), .ZN(
        SQ_instance_n387) );
  NOR2_X1 SQ_instance_U393 ( .A1(a_sel_rr[4]), .A2(SQ_instance_n389), .ZN(
        SQ_instance_n388) );
  NAND2_X1 SQ_instance_U392 ( .A1(r_rr[3]), .A2(a_sel_rr[5]), .ZN(
        SQ_instance_n389) );
  NAND2_X1 SQ_instance_U391 ( .A1(SQ_instance_n386), .A2(SQ_instance_n385), 
        .ZN(b3[1]) );
  NAND2_X1 SQ_instance_U390 ( .A1(SQ_instance_n384), .A2(SQ_instance_n383), 
        .ZN(SQ_instance_n385) );
  XNOR2_X1 SQ_instance_U389 ( .A(SQ_instance_n382), .B(SQ_instance_n384), .ZN(
        SQ_instance_n386) );
  XNOR2_X1 SQ_instance_U388 ( .A(SQ_instance_r_rr[17]), .B(SQ_instance_n381), 
        .ZN(SQ_instance_n382) );
  NAND2_X1 SQ_instance_U387 ( .A1(SQ_instance_n380), .A2(SQ_instance_n379), 
        .ZN(b2[0]) );
  NAND2_X1 SQ_instance_U386 ( .A1(SQ_instance_n378), .A2(SQ_instance_n377), 
        .ZN(SQ_instance_n379) );
  NAND2_X1 SQ_instance_U385 ( .A1(SQ_instance_n376), .A2(SQ_instance_n375), 
        .ZN(SQ_instance_n377) );
  NAND2_X1 SQ_instance_U384 ( .A1(SQ_instance_n374), .A2(SQ_instance_n373), 
        .ZN(SQ_instance_n380) );
  NAND2_X1 SQ_instance_U383 ( .A1(SQ_instance_n372), .A2(SQ_instance_n371), 
        .ZN(SQ_instance_n374) );
  NAND2_X1 SQ_instance_U382 ( .A1(SQ_instance_n376), .A2(SQ_instance_r_rr[19]), 
        .ZN(SQ_instance_n372) );
  NAND2_X1 SQ_instance_U381 ( .A1(SQ_instance_n370), .A2(SQ_instance_n369), 
        .ZN(b2[1]) );
  NAND2_X1 SQ_instance_U380 ( .A1(SQ_instance_n376), .A2(SQ_instance_n378), 
        .ZN(SQ_instance_n369) );
  INV_X1 SQ_instance_U379 ( .A(SQ_instance_n373), .ZN(SQ_instance_n378) );
  XOR2_X1 SQ_instance_U378 ( .A(SQ_instance_n368), .B(SQ_instance_r_rr[18]), 
        .Z(SQ_instance_n373) );
  NAND2_X1 SQ_instance_U377 ( .A1(SQ_instance_n371), .A2(SQ_instance_n367), 
        .ZN(SQ_instance_n370) );
  INV_X1 SQ_instance_U376 ( .A(SQ_instance_n375), .ZN(SQ_instance_n367) );
  NOR2_X1 SQ_instance_U375 ( .A1(SQ_instance_n366), .A2(SQ_instance_n365), 
        .ZN(SQ_instance_n375) );
  NAND2_X1 SQ_instance_U374 ( .A1(SQ_instance_n366), .A2(SQ_instance_n365), 
        .ZN(SQ_instance_n371) );
  XOR2_X1 SQ_instance_U373 ( .A(SQ_instance_n376), .B(SQ_instance_r_rr[19]), 
        .Z(SQ_instance_n365) );
  NAND2_X1 SQ_instance_U372 ( .A1(SQ_instance_n364), .A2(SQ_instance_n363), 
        .ZN(SQ_instance_n376) );
  OR2_X1 SQ_instance_U371 ( .A1(SQ_instance_n362), .A2(SQ_instance_n361), .ZN(
        SQ_instance_n363) );
  XNOR2_X1 SQ_instance_U370 ( .A(SQ_instance_n360), .B(SQ_instance_n359), .ZN(
        SQ_instance_n364) );
  NOR2_X1 SQ_instance_U369 ( .A1(SQ_instance_n368), .A2(SQ_instance_n358), 
        .ZN(SQ_instance_n366) );
  INV_X1 SQ_instance_U368 ( .A(SQ_instance_r_rr[18]), .ZN(SQ_instance_n358) );
  NOR2_X1 SQ_instance_U367 ( .A1(SQ_instance_n357), .A2(SQ_instance_n356), 
        .ZN(SQ_instance_n368) );
  XOR2_X1 SQ_instance_U366 ( .A(SQ_instance_n361), .B(SQ_instance_n362), .Z(
        SQ_instance_n356) );
  NAND2_X1 SQ_instance_U365 ( .A1(SQ_instance_gamma_mul_rr[5]), .A2(
        SQ_instance_beta_r[5]), .ZN(SQ_instance_n362) );
  XNOR2_X1 SQ_instance_U364 ( .A(SQ_instance_beta_r[4]), .B(
        SQ_instance_gamma_mul_rr[4]), .ZN(SQ_instance_n361) );
  NOR2_X1 SQ_instance_U363 ( .A1(SQ_instance_n359), .A2(SQ_instance_n360), 
        .ZN(SQ_instance_n357) );
  NAND2_X1 SQ_instance_U362 ( .A1(SQ_instance_beta_r[4]), .A2(
        SQ_instance_gamma_mul_rr[4]), .ZN(SQ_instance_n360) );
  XNOR2_X1 SQ_instance_U361 ( .A(SQ_instance_gamma_mul_rr[5]), .B(
        SQ_instance_beta_r[5]), .ZN(SQ_instance_n359) );
  NAND2_X1 SQ_instance_U360 ( .A1(SQ_instance_n355), .A2(SQ_instance_n354), 
        .ZN(b1[0]) );
  NAND2_X1 SQ_instance_U359 ( .A1(SQ_instance_n353), .A2(SQ_instance_n352), 
        .ZN(SQ_instance_n354) );
  NAND2_X1 SQ_instance_U358 ( .A1(SQ_instance_n351), .A2(SQ_instance_n350), 
        .ZN(SQ_instance_n352) );
  NAND2_X1 SQ_instance_U357 ( .A1(SQ_instance_n349), .A2(SQ_instance_n348), 
        .ZN(SQ_instance_n355) );
  NAND2_X1 SQ_instance_U356 ( .A1(SQ_instance_n347), .A2(SQ_instance_n346), 
        .ZN(SQ_instance_n349) );
  NAND2_X1 SQ_instance_U355 ( .A1(SQ_instance_n350), .A2(SQ_instance_r_rr[13]), 
        .ZN(SQ_instance_n347) );
  NAND2_X1 SQ_instance_U354 ( .A1(SQ_instance_n345), .A2(SQ_instance_n344), 
        .ZN(b1[1]) );
  NAND2_X1 SQ_instance_U353 ( .A1(SQ_instance_n350), .A2(SQ_instance_n353), 
        .ZN(SQ_instance_n344) );
  INV_X1 SQ_instance_U352 ( .A(SQ_instance_n348), .ZN(SQ_instance_n353) );
  XOR2_X1 SQ_instance_U351 ( .A(SQ_instance_n343), .B(SQ_instance_r_rr[12]), 
        .Z(SQ_instance_n348) );
  NAND2_X1 SQ_instance_U350 ( .A1(SQ_instance_n346), .A2(SQ_instance_n342), 
        .ZN(SQ_instance_n345) );
  INV_X1 SQ_instance_U349 ( .A(SQ_instance_n351), .ZN(SQ_instance_n342) );
  NOR2_X1 SQ_instance_U348 ( .A1(SQ_instance_n341), .A2(SQ_instance_n340), 
        .ZN(SQ_instance_n351) );
  NAND2_X1 SQ_instance_U347 ( .A1(SQ_instance_n341), .A2(SQ_instance_n340), 
        .ZN(SQ_instance_n346) );
  XOR2_X1 SQ_instance_U346 ( .A(SQ_instance_n350), .B(SQ_instance_r_rr[13]), 
        .Z(SQ_instance_n340) );
  NAND2_X1 SQ_instance_U345 ( .A1(SQ_instance_n339), .A2(SQ_instance_n338), 
        .ZN(SQ_instance_n350) );
  NAND2_X1 SQ_instance_U344 ( .A1(SQ_instance_n337), .A2(SQ_instance_n336), 
        .ZN(SQ_instance_n338) );
  XNOR2_X1 SQ_instance_U343 ( .A(SQ_instance_n335), .B(SQ_instance_n334), .ZN(
        SQ_instance_n339) );
  NOR2_X1 SQ_instance_U342 ( .A1(SQ_instance_n343), .A2(SQ_instance_n333), 
        .ZN(SQ_instance_n341) );
  INV_X1 SQ_instance_U341 ( .A(SQ_instance_r_rr[12]), .ZN(SQ_instance_n333) );
  NOR2_X1 SQ_instance_U340 ( .A1(SQ_instance_n332), .A2(SQ_instance_n331), 
        .ZN(SQ_instance_n343) );
  XNOR2_X1 SQ_instance_U339 ( .A(SQ_instance_n336), .B(SQ_instance_n330), .ZN(
        SQ_instance_n331) );
  NAND2_X1 SQ_instance_U338 ( .A1(SQ_instance_beta_r[9]), .A2(SQ_instance_n337), .ZN(SQ_instance_n330) );
  XOR2_X1 SQ_instance_U337 ( .A(SQ_instance_beta_r[8]), .B(SQ_instance_n329), 
        .Z(SQ_instance_n336) );
  NOR2_X1 SQ_instance_U336 ( .A1(SQ_instance_n334), .A2(SQ_instance_n335), 
        .ZN(SQ_instance_n332) );
  XNOR2_X1 SQ_instance_U335 ( .A(SQ_instance_n337), .B(SQ_instance_beta_r[9]), 
        .ZN(SQ_instance_n335) );
  OR2_X1 SQ_instance_U334 ( .A1(SQ_instance_n328), .A2(SQ_instance_n327), .ZN(
        SQ_instance_n337) );
  XNOR2_X1 SQ_instance_U333 ( .A(SQ_instance_n326), .B(SQ_instance_n325), .ZN(
        SQ_instance_n327) );
  NAND2_X1 SQ_instance_U332 ( .A1(SQ_instance_beta_r[2]), .A2(
        SQ_instance_gamma_mul_rr[2]), .ZN(SQ_instance_n325) );
  NOR2_X1 SQ_instance_U331 ( .A1(SQ_instance_n324), .A2(SQ_instance_n323), 
        .ZN(SQ_instance_n328) );
  NAND2_X1 SQ_instance_U330 ( .A1(SQ_instance_beta_r[8]), .A2(SQ_instance_n329), .ZN(SQ_instance_n334) );
  NAND2_X1 SQ_instance_U329 ( .A1(SQ_instance_n322), .A2(SQ_instance_n321), 
        .ZN(SQ_instance_n329) );
  NAND2_X1 SQ_instance_U328 ( .A1(SQ_instance_gamma_mul_rr[2]), .A2(
        SQ_instance_n326), .ZN(SQ_instance_n321) );
  XOR2_X1 SQ_instance_U327 ( .A(SQ_instance_beta_r[3]), .B(
        SQ_instance_gamma_mul_rr[3]), .Z(SQ_instance_n326) );
  XNOR2_X1 SQ_instance_U326 ( .A(SQ_instance_n323), .B(SQ_instance_n324), .ZN(
        SQ_instance_n322) );
  XNOR2_X1 SQ_instance_U325 ( .A(SQ_instance_beta_r[2]), .B(
        SQ_instance_gamma_mul_rr[2]), .ZN(SQ_instance_n324) );
  NAND2_X1 SQ_instance_U324 ( .A1(SQ_instance_beta_r[3]), .A2(
        SQ_instance_gamma_mul_rr[3]), .ZN(SQ_instance_n323) );
  NAND2_X1 SQ_instance_U323 ( .A1(SQ_instance_n320), .A2(SQ_instance_n319), 
        .ZN(SQ_instance_gamma_mul[0]) );
  NAND2_X1 SQ_instance_U322 ( .A1(a_sel_rr[1]), .A2(SQ_instance_n318), .ZN(
        SQ_instance_n319) );
  NAND2_X1 SQ_instance_U321 ( .A1(a_sel_rr[0]), .A2(SQ_instance_n317), .ZN(
        SQ_instance_n320) );
  NAND2_X1 SQ_instance_U320 ( .A1(SQ_instance_n316), .A2(SQ_instance_n315), 
        .ZN(SQ_instance_gamma_mul[1]) );
  NAND2_X1 SQ_instance_U319 ( .A1(a_sel_rr[0]), .A2(SQ_instance_n318), .ZN(
        SQ_instance_n315) );
  NAND2_X1 SQ_instance_U318 ( .A1(SQ_instance_n314), .A2(SQ_instance_n313), 
        .ZN(SQ_instance_n318) );
  OR2_X1 SQ_instance_U317 ( .A1(SQ_instance_n312), .A2(SQ_instance_n311), .ZN(
        SQ_instance_n313) );
  XNOR2_X1 SQ_instance_U316 ( .A(SQ_instance_n310), .B(SQ_instance_n309), .ZN(
        SQ_instance_n314) );
  NAND2_X1 SQ_instance_U315 ( .A1(a_sel_rr[1]), .A2(SQ_instance_n317), .ZN(
        SQ_instance_n316) );
  NAND2_X1 SQ_instance_U314 ( .A1(SQ_instance_n308), .A2(SQ_instance_n307), 
        .ZN(SQ_instance_n317) );
  OR2_X1 SQ_instance_U313 ( .A1(SQ_instance_n309), .A2(SQ_instance_n310), .ZN(
        SQ_instance_n307) );
  NAND2_X1 SQ_instance_U312 ( .A1(SQ_instance_n306), .A2(SQ_instance_n305), 
        .ZN(SQ_instance_n310) );
  XOR2_X1 SQ_instance_U311 ( .A(SQ_instance_n304), .B(SQ_instance_n303), .Z(
        SQ_instance_n309) );
  XNOR2_X1 SQ_instance_U310 ( .A(SQ_instance_n311), .B(SQ_instance_n312), .ZN(
        SQ_instance_n308) );
  OR2_X1 SQ_instance_U309 ( .A1(r_rr[11]), .A2(SQ_instance_n303), .ZN(
        SQ_instance_n312) );
  NOR2_X1 SQ_instance_U308 ( .A1(SQ_instance_n302), .A2(SQ_instance_n301), 
        .ZN(SQ_instance_n303) );
  XNOR2_X1 SQ_instance_U307 ( .A(SQ_instance_n300), .B(r_rr[6]), .ZN(
        SQ_instance_n301) );
  NOR2_X1 SQ_instance_U306 ( .A1(SQ_instance_n299), .A2(SQ_instance_n298), 
        .ZN(SQ_instance_n302) );
  XNOR2_X1 SQ_instance_U305 ( .A(SQ_instance_n306), .B(SQ_instance_n305), .ZN(
        SQ_instance_n311) );
  NAND2_X1 SQ_instance_U304 ( .A1(SQ_instance_n297), .A2(SQ_instance_n296), 
        .ZN(SQ_instance_n305) );
  NAND2_X1 SQ_instance_U303 ( .A1(SQ_instance_n300), .A2(SQ_instance_n295), 
        .ZN(SQ_instance_n296) );
  XOR2_X1 SQ_instance_U302 ( .A(r_rr[7]), .B(SQ_instance_n299), .Z(
        SQ_instance_n300) );
  AND2_X1 SQ_instance_U301 ( .A1(SQ_instance_n294), .A2(SQ_instance_n293), 
        .ZN(SQ_instance_n299) );
  NAND2_X1 SQ_instance_U300 ( .A1(SQ_instance_n292), .A2(SQ_instance_n291), 
        .ZN(SQ_instance_n293) );
  XNOR2_X1 SQ_instance_U299 ( .A(SQ_instance_n290), .B(SQ_instance_n289), .ZN(
        SQ_instance_n294) );
  XNOR2_X1 SQ_instance_U298 ( .A(SQ_instance_n298), .B(r_rr[7]), .ZN(
        SQ_instance_n297) );
  XOR2_X1 SQ_instance_U297 ( .A(r_rr[6]), .B(SQ_instance_n295), .Z(
        SQ_instance_n298) );
  NAND2_X1 SQ_instance_U296 ( .A1(SQ_instance_n288), .A2(SQ_instance_n287), 
        .ZN(SQ_instance_n295) );
  NAND2_X1 SQ_instance_U295 ( .A1(SQ_instance_n289), .A2(SQ_instance_n290), 
        .ZN(SQ_instance_n287) );
  XNOR2_X1 SQ_instance_U294 ( .A(a_sel_rr[0]), .B(r_rr[1]), .ZN(
        SQ_instance_n290) );
  NOR2_X1 SQ_instance_U293 ( .A1(r_rr[0]), .A2(SQ_instance_n286), .ZN(
        SQ_instance_n289) );
  INV_X1 SQ_instance_U292 ( .A(a_sel_rr[1]), .ZN(SQ_instance_n286) );
  XNOR2_X1 SQ_instance_U291 ( .A(SQ_instance_n292), .B(SQ_instance_n291), .ZN(
        SQ_instance_n288) );
  NOR2_X1 SQ_instance_U290 ( .A1(r_rr[1]), .A2(SQ_instance_n285), .ZN(
        SQ_instance_n291) );
  INV_X1 SQ_instance_U289 ( .A(a_sel_rr[0]), .ZN(SQ_instance_n285) );
  XNOR2_X1 SQ_instance_U288 ( .A(a_sel_rr[1]), .B(r_rr[0]), .ZN(
        SQ_instance_n292) );
  NAND2_X1 SQ_instance_U287 ( .A1(SQ_instance_n284), .A2(SQ_instance_n283), 
        .ZN(SQ_instance_gamma_mul[2]) );
  NAND2_X1 SQ_instance_U286 ( .A1(a_sel_rr[3]), .A2(SQ_instance_n282), .ZN(
        SQ_instance_n283) );
  NAND2_X1 SQ_instance_U285 ( .A1(SQ_instance_n281), .A2(a_sel_rr[2]), .ZN(
        SQ_instance_n284) );
  NAND2_X1 SQ_instance_U284 ( .A1(SQ_instance_n280), .A2(SQ_instance_n279), 
        .ZN(SQ_instance_gamma_mul[3]) );
  NAND2_X1 SQ_instance_U283 ( .A1(a_sel_rr[2]), .A2(SQ_instance_n282), .ZN(
        SQ_instance_n279) );
  NAND2_X1 SQ_instance_U282 ( .A1(SQ_instance_n278), .A2(SQ_instance_n277), 
        .ZN(SQ_instance_n282) );
  NAND2_X1 SQ_instance_U281 ( .A1(SQ_instance_n276), .A2(SQ_instance_n275), 
        .ZN(SQ_instance_n277) );
  XNOR2_X1 SQ_instance_U280 ( .A(SQ_instance_n274), .B(SQ_instance_n273), .ZN(
        SQ_instance_n278) );
  NAND2_X1 SQ_instance_U279 ( .A1(SQ_instance_n281), .A2(a_sel_rr[3]), .ZN(
        SQ_instance_n280) );
  NAND2_X1 SQ_instance_U278 ( .A1(SQ_instance_n272), .A2(SQ_instance_n271), 
        .ZN(SQ_instance_n281) );
  OR2_X1 SQ_instance_U277 ( .A1(SQ_instance_n274), .A2(SQ_instance_n273), .ZN(
        SQ_instance_n271) );
  NAND2_X1 SQ_instance_U276 ( .A1(SQ_instance_n270), .A2(SQ_instance_n269), 
        .ZN(SQ_instance_n273) );
  XNOR2_X1 SQ_instance_U275 ( .A(r_rr[9]), .B(SQ_instance_n268), .ZN(
        SQ_instance_n274) );
  XNOR2_X1 SQ_instance_U274 ( .A(SQ_instance_n275), .B(SQ_instance_n276), .ZN(
        SQ_instance_n272) );
  NOR2_X1 SQ_instance_U273 ( .A1(r_rr[9]), .A2(SQ_instance_n268), .ZN(
        SQ_instance_n276) );
  NOR2_X1 SQ_instance_U272 ( .A1(r_rr[2]), .A2(SQ_instance_n267), .ZN(
        SQ_instance_n268) );
  XOR2_X1 SQ_instance_U271 ( .A(SQ_instance_n270), .B(SQ_instance_n269), .Z(
        SQ_instance_n275) );
  NAND2_X1 SQ_instance_U270 ( .A1(r_rr[2]), .A2(SQ_instance_n267), .ZN(
        SQ_instance_n269) );
  INV_X1 SQ_instance_U269 ( .A(r_rr[3]), .ZN(SQ_instance_n267) );
  NAND2_X1 SQ_instance_U268 ( .A1(SQ_instance_n266), .A2(SQ_instance_n265), 
        .ZN(SQ_instance_gamma_mul[4]) );
  NAND2_X1 SQ_instance_U267 ( .A1(a_sel_rr[4]), .A2(SQ_instance_n264), .ZN(
        SQ_instance_n265) );
  NAND2_X1 SQ_instance_U266 ( .A1(SQ_instance_n263), .A2(SQ_instance_n262), 
        .ZN(SQ_instance_n266) );
  NOR2_X1 SQ_instance_U265 ( .A1(SQ_instance_n261), .A2(SQ_instance_n260), 
        .ZN(SQ_instance_n263) );
  NOR2_X1 SQ_instance_U264 ( .A1(SQ_instance_n259), .A2(SQ_instance_n258), 
        .ZN(SQ_instance_n260) );
  INV_X1 SQ_instance_U263 ( .A(a_sel_rr[5]), .ZN(SQ_instance_n261) );
  NAND2_X1 SQ_instance_U262 ( .A1(SQ_instance_n257), .A2(SQ_instance_n256), 
        .ZN(SQ_instance_gamma_mul[5]) );
  NAND2_X1 SQ_instance_U261 ( .A1(a_sel_rr[5]), .A2(SQ_instance_n264), .ZN(
        SQ_instance_n256) );
  NAND2_X1 SQ_instance_U260 ( .A1(SQ_instance_n262), .A2(SQ_instance_n255), 
        .ZN(SQ_instance_n264) );
  NAND2_X1 SQ_instance_U259 ( .A1(SQ_instance_n254), .A2(SQ_instance_n253), 
        .ZN(SQ_instance_n255) );
  OR2_X1 SQ_instance_U258 ( .A1(SQ_instance_n252), .A2(SQ_instance_n251), .ZN(
        SQ_instance_n253) );
  NAND2_X1 SQ_instance_U257 ( .A1(SQ_instance_n250), .A2(SQ_instance_n259), 
        .ZN(SQ_instance_n262) );
  INV_X1 SQ_instance_U256 ( .A(SQ_instance_n249), .ZN(SQ_instance_n250) );
  NAND2_X1 SQ_instance_U255 ( .A1(a_sel_rr[4]), .A2(SQ_instance_n258), .ZN(
        SQ_instance_n257) );
  NAND2_X1 SQ_instance_U254 ( .A1(SQ_instance_n249), .A2(SQ_instance_n254), 
        .ZN(SQ_instance_n258) );
  NAND2_X1 SQ_instance_U253 ( .A1(a_sel_rr[4]), .A2(SQ_instance_n252), .ZN(
        SQ_instance_n254) );
  XOR2_X1 SQ_instance_U252 ( .A(a_sel_rr[5]), .B(SQ_instance_n259), .Z(
        SQ_instance_n252) );
  XOR2_X1 SQ_instance_U251 ( .A(a_sel_rr[4]), .B(r_rr[5]), .Z(SQ_instance_n249) );
  NAND2_X1 SQ_instance_U250 ( .A1(SQ_instance_n248), .A2(SQ_instance_n247), 
        .ZN(b0[0]) );
  NAND2_X1 SQ_instance_U249 ( .A1(SQ_instance_n246), .A2(SQ_instance_n245), 
        .ZN(SQ_instance_n247) );
  NOR2_X1 SQ_instance_U248 ( .A1(SQ_instance_n244), .A2(SQ_instance_n243), 
        .ZN(SQ_instance_n248) );
  NAND2_X1 SQ_instance_U247 ( .A1(SQ_instance_n242), .A2(SQ_instance_n241), 
        .ZN(SQ_instance_add_x_19_n6) );
  NAND2_X1 SQ_instance_U246 ( .A1(SQ_instance_n240), .A2(SQ_instance_n239), 
        .ZN(SQ_instance_n241) );
  NOR2_X1 SQ_instance_U245 ( .A1(SQ_instance_n238), .A2(SQ_instance_n237), 
        .ZN(SQ_instance_n242) );
  NAND2_X1 SQ_instance_U244 ( .A1(SQ_instance_n236), .A2(SQ_instance_n235), 
        .ZN(SQ_instance_add_x_14_n6) );
  NAND2_X1 SQ_instance_U243 ( .A1(SQ_instance_n234), .A2(SQ_instance_n233), 
        .ZN(SQ_instance_n235) );
  NOR2_X1 SQ_instance_U242 ( .A1(SQ_instance_n232), .A2(SQ_instance_n231), 
        .ZN(SQ_instance_n236) );
  NAND2_X1 SQ_instance_U241 ( .A1(SQ_instance_n259), .A2(SQ_instance_n230), 
        .ZN(SQ_instance_add_x_9_n6) );
  NAND2_X1 SQ_instance_U240 ( .A1(SQ_instance_n251), .A2(
        SQ_instance_gamma_mul[6]), .ZN(SQ_instance_n230) );
  NAND2_X1 SQ_instance_U239 ( .A1(SQ_instance_n270), .A2(SQ_instance_n229), 
        .ZN(SQ_instance_add_x_7_n6) );
  NAND2_X1 SQ_instance_U238 ( .A1(SQ_instance_n228), .A2(
        SQ_instance_gamma_mul[6]), .ZN(SQ_instance_n229) );
  NAND2_X1 SQ_instance_U237 ( .A1(SQ_instance_n306), .A2(SQ_instance_n227), 
        .ZN(SQ_instance_add_x_5_n6) );
  NAND2_X1 SQ_instance_U236 ( .A1(SQ_instance_n304), .A2(
        SQ_instance_gamma_mul[6]), .ZN(SQ_instance_n227) );
  NAND2_X1 SQ_instance_U235 ( .A1(SQ_instance_n304), .A2(SQ_instance_n226), 
        .ZN(SQ_instance_alpha[11]) );
  NAND2_X1 SQ_instance_U234 ( .A1(SQ_instance_n306), .A2(
        SQ_instance_gamma_mul[6]), .ZN(SQ_instance_n226) );
  INV_X1 SQ_instance_U233 ( .A(r_rr[10]), .ZN(SQ_instance_n306) );
  INV_X1 SQ_instance_U232 ( .A(r_rr[11]), .ZN(SQ_instance_n304) );
  NAND2_X1 SQ_instance_U231 ( .A1(SQ_instance_n228), .A2(SQ_instance_n225), 
        .ZN(SQ_instance_alpha[9]) );
  NAND2_X1 SQ_instance_U230 ( .A1(SQ_instance_n270), .A2(
        SQ_instance_gamma_mul[6]), .ZN(SQ_instance_n225) );
  INV_X1 SQ_instance_U229 ( .A(r_rr[8]), .ZN(SQ_instance_n270) );
  INV_X1 SQ_instance_U228 ( .A(r_rr[9]), .ZN(SQ_instance_n228) );
  NAND2_X1 SQ_instance_U227 ( .A1(SQ_instance_n251), .A2(SQ_instance_n224), 
        .ZN(SQ_instance_alpha[5]) );
  NAND2_X1 SQ_instance_U226 ( .A1(SQ_instance_n259), .A2(
        SQ_instance_gamma_mul[6]), .ZN(SQ_instance_n224) );
  INV_X1 SQ_instance_U225 ( .A(r_rr[4]), .ZN(SQ_instance_n259) );
  INV_X1 SQ_instance_U224 ( .A(r_rr[5]), .ZN(SQ_instance_n251) );
  XNOR2_X1 SQ_instance_U223 ( .A(SQ_instance_n223), .B(SQ_instance_n222), .ZN(
        SQ_instance_beta[1]) );
  NAND2_X1 SQ_instance_U222 ( .A1(SQ_instance_n221), .A2(SQ_instance_n220), 
        .ZN(SQ_instance_n222) );
  NAND2_X1 SQ_instance_U221 ( .A1(SQ_instance_n219), .A2(SQ_instance_n218), 
        .ZN(SQ_instance_beta[0]) );
  NAND2_X1 SQ_instance_U220 ( .A1(SQ_instance_n220), .A2(SQ_instance_n223), 
        .ZN(SQ_instance_n218) );
  NAND2_X1 SQ_instance_U219 ( .A1(SQ_instance_n217), .A2(SQ_instance_n216), 
        .ZN(SQ_instance_n223) );
  NAND2_X1 SQ_instance_U218 ( .A1(SQ_instance_n215), .A2(SQ_instance_n214), 
        .ZN(SQ_instance_n216) );
  NOR2_X1 SQ_instance_U217 ( .A1(SQ_instance_n213), .A2(SQ_instance_n212), 
        .ZN(SQ_instance_n217) );
  XOR2_X1 SQ_instance_U216 ( .A(SQ_instance_n211), .B(SQ_instance_n210), .Z(
        SQ_instance_n212) );
  XOR2_X1 SQ_instance_U215 ( .A(SQ_instance_n209), .B(SQ_instance_n208), .Z(
        SQ_instance_n210) );
  NOR2_X1 SQ_instance_U214 ( .A1(SQ_instance_n207), .A2(SQ_instance_n206), 
        .ZN(SQ_instance_n213) );
  XNOR2_X1 SQ_instance_U213 ( .A(SQ_instance_n221), .B(SQ_instance_n220), .ZN(
        SQ_instance_n219) );
  XOR2_X1 SQ_instance_U212 ( .A(SQ_instance_n205), .B(SQ_instance_n204), .Z(
        SQ_instance_n220) );
  XOR2_X1 SQ_instance_U211 ( .A(SQ_instance_n215), .B(SQ_instance_n214), .Z(
        SQ_instance_n221) );
  XOR2_X1 SQ_instance_U210 ( .A(SQ_instance_n207), .B(SQ_instance_n206), .Z(
        SQ_instance_n214) );
  NAND2_X1 SQ_instance_U209 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[1]), .ZN(SQ_instance_n206) );
  NAND2_X1 SQ_instance_U208 ( .A1(SQ_instance_n203), .A2(SQ_instance_n202), 
        .ZN(SQ_instance_n207) );
  NAND2_X1 SQ_instance_U207 ( .A1(SQ_instance_n201), .A2(SQ_instance_n200), 
        .ZN(SQ_instance_n202) );
  OR2_X1 SQ_instance_U206 ( .A1(SQ_instance_n199), .A2(SQ_instance_n198), .ZN(
        SQ_instance_n200) );
  NAND2_X1 SQ_instance_U205 ( .A1(SQ_instance_n198), .A2(SQ_instance_n199), 
        .ZN(SQ_instance_n203) );
  NOR2_X1 SQ_instance_U204 ( .A1(SQ_instance_n197), .A2(SQ_instance_n196), 
        .ZN(SQ_instance_n215) );
  NOR2_X1 SQ_instance_U203 ( .A1(SQ_instance_n211), .A2(SQ_instance_n208), 
        .ZN(SQ_instance_n196) );
  NOR2_X1 SQ_instance_U202 ( .A1(SQ_instance_n209), .A2(SQ_instance_n195), 
        .ZN(SQ_instance_n197) );
  AND2_X1 SQ_instance_U201 ( .A1(SQ_instance_n208), .A2(SQ_instance_n211), 
        .ZN(SQ_instance_n195) );
  AND2_X1 SQ_instance_U200 ( .A1(SQ_instance_beta_coeff_muladd_0_1_cd_0_), 
        .A2(SQ_instance_r_r[13]), .ZN(SQ_instance_n211) );
  NOR2_X1 SQ_instance_U199 ( .A1(SQ_instance_n205), .A2(SQ_instance_n204), 
        .ZN(SQ_instance_n208) );
  NOR2_X1 SQ_instance_U198 ( .A1(SQ_instance_beta_coeff_muladd_0_1_cd_0_), 
        .A2(SQ_instance_r_r[13]), .ZN(SQ_instance_n204) );
  NAND2_X1 SQ_instance_U197 ( .A1(SQ_instance_a_r[0]), .A2(
        SQ_instance_alpha_r[0]), .ZN(SQ_instance_n205) );
  XOR2_X1 SQ_instance_U196 ( .A(SQ_instance_n199), .B(SQ_instance_n194), .Z(
        SQ_instance_n209) );
  XNOR2_X1 SQ_instance_U195 ( .A(SQ_instance_n201), .B(SQ_instance_n198), .ZN(
        SQ_instance_n194) );
  NAND2_X1 SQ_instance_U194 ( .A1(SQ_instance_a_r[0]), .A2(
        SQ_instance_alpha_r[1]), .ZN(SQ_instance_n198) );
  XNOR2_X1 SQ_instance_U193 ( .A(SQ_instance_beta_coeff_muladd_0_1_cd_0_), .B(
        SQ_instance_r_r[13]), .ZN(SQ_instance_n201) );
  NAND2_X1 SQ_instance_U192 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[0]), .ZN(SQ_instance_n199) );
  NOR2_X1 SQ_instance_U191 ( .A1(SQ_instance_n232), .A2(SQ_instance_n193), 
        .ZN(SQ_instance_beta[7]) );
  NOR2_X1 SQ_instance_U190 ( .A1(SQ_instance_n192), .A2(SQ_instance_n191), 
        .ZN(SQ_instance_n193) );
  NOR2_X1 SQ_instance_U189 ( .A1(SQ_instance_n231), .A2(SQ_instance_n190), 
        .ZN(SQ_instance_n191) );
  NOR2_X1 SQ_instance_U188 ( .A1(SQ_instance_n189), .A2(SQ_instance_n188), 
        .ZN(SQ_instance_n190) );
  NOR2_X1 SQ_instance_U187 ( .A1(SQ_instance_n234), .A2(SQ_instance_n233), 
        .ZN(SQ_instance_n231) );
  NAND2_X1 SQ_instance_U186 ( .A1(SQ_instance_n188), .A2(SQ_instance_n189), 
        .ZN(SQ_instance_n233) );
  NAND2_X1 SQ_instance_U185 ( .A1(SQ_instance_n187), .A2(SQ_instance_n186), 
        .ZN(SQ_instance_n189) );
  NAND2_X1 SQ_instance_U184 ( .A1(SQ_instance_n185), .A2(SQ_instance_n184), 
        .ZN(SQ_instance_n186) );
  NAND2_X1 SQ_instance_U183 ( .A1(SQ_instance_n183), .A2(SQ_instance_n184), 
        .ZN(SQ_instance_n187) );
  XOR2_X1 SQ_instance_U182 ( .A(SQ_instance_n182), .B(SQ_instance_n181), .Z(
        SQ_instance_n234) );
  AND2_X1 SQ_instance_U181 ( .A1(SQ_instance_n192), .A2(SQ_instance_n188), 
        .ZN(SQ_instance_n232) );
  XOR2_X1 SQ_instance_U180 ( .A(SQ_instance_n180), .B(SQ_instance_n179), .Z(
        SQ_instance_n188) );
  XOR2_X1 SQ_instance_U179 ( .A(SQ_instance_n178), .B(SQ_instance_n177), .Z(
        SQ_instance_n179) );
  AND2_X1 SQ_instance_U178 ( .A1(SQ_instance_n181), .A2(SQ_instance_n182), 
        .ZN(SQ_instance_n192) );
  XOR2_X1 SQ_instance_U177 ( .A(SQ_instance_n184), .B(SQ_instance_n176), .Z(
        SQ_instance_n182) );
  XOR2_X1 SQ_instance_U176 ( .A(SQ_instance_n183), .B(SQ_instance_n185), .Z(
        SQ_instance_n176) );
  NAND2_X1 SQ_instance_U175 ( .A1(SQ_instance_n175), .A2(SQ_instance_n174), 
        .ZN(SQ_instance_n185) );
  NAND2_X1 SQ_instance_U174 ( .A1(SQ_instance_n178), .A2(SQ_instance_n173), 
        .ZN(SQ_instance_n174) );
  NAND2_X1 SQ_instance_U173 ( .A1(SQ_instance_n180), .A2(SQ_instance_n177), 
        .ZN(SQ_instance_n173) );
  XNOR2_X1 SQ_instance_U172 ( .A(SQ_instance_r_r[18]), .B(SQ_instance_n172), 
        .ZN(SQ_instance_n178) );
  OR2_X1 SQ_instance_U171 ( .A1(SQ_instance_n177), .A2(SQ_instance_n180), .ZN(
        SQ_instance_n175) );
  NAND2_X1 SQ_instance_U170 ( .A1(SQ_instance_r_r[19]), .A2(SQ_instance_n171), 
        .ZN(SQ_instance_n180) );
  NAND2_X1 SQ_instance_U169 ( .A1(SQ_instance_a_r[0]), .A2(
        SQ_instance_alpha_r[7]), .ZN(SQ_instance_n177) );
  NOR2_X1 SQ_instance_U168 ( .A1(SQ_instance_n170), .A2(SQ_instance_n172), 
        .ZN(SQ_instance_n183) );
  NAND2_X1 SQ_instance_U167 ( .A1(SQ_instance_alpha_r[6]), .A2(
        SQ_instance_a_r[1]), .ZN(SQ_instance_n172) );
  INV_X1 SQ_instance_U166 ( .A(SQ_instance_r_r[18]), .ZN(SQ_instance_n170) );
  AND2_X1 SQ_instance_U165 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[7]), .ZN(SQ_instance_n184) );
  XOR2_X1 SQ_instance_U164 ( .A(SQ_instance_r_r[19]), .B(SQ_instance_n171), 
        .Z(SQ_instance_n181) );
  AND2_X1 SQ_instance_U163 ( .A1(SQ_instance_alpha_r[6]), .A2(
        SQ_instance_a_r[0]), .ZN(SQ_instance_n171) );
  XNOR2_X1 SQ_instance_U162 ( .A(SQ_instance_n169), .B(SQ_instance_n168), .ZN(
        SQ_instance_beta[11]) );
  NAND2_X1 SQ_instance_U161 ( .A1(SQ_instance_n167), .A2(SQ_instance_n166), 
        .ZN(SQ_instance_n168) );
  NAND2_X1 SQ_instance_U160 ( .A1(SQ_instance_n165), .A2(SQ_instance_n164), 
        .ZN(SQ_instance_beta[10]) );
  NAND2_X1 SQ_instance_U159 ( .A1(SQ_instance_n166), .A2(SQ_instance_n169), 
        .ZN(SQ_instance_n164) );
  NAND2_X1 SQ_instance_U158 ( .A1(SQ_instance_n163), .A2(SQ_instance_n162), 
        .ZN(SQ_instance_n169) );
  NAND2_X1 SQ_instance_U157 ( .A1(SQ_instance_n161), .A2(SQ_instance_n160), 
        .ZN(SQ_instance_n162) );
  NOR2_X1 SQ_instance_U156 ( .A1(SQ_instance_n159), .A2(SQ_instance_n158), 
        .ZN(SQ_instance_n163) );
  XOR2_X1 SQ_instance_U155 ( .A(SQ_instance_n157), .B(SQ_instance_n156), .Z(
        SQ_instance_n158) );
  XOR2_X1 SQ_instance_U154 ( .A(SQ_instance_n155), .B(SQ_instance_n154), .Z(
        SQ_instance_n156) );
  NOR2_X1 SQ_instance_U153 ( .A1(SQ_instance_n153), .A2(SQ_instance_n152), 
        .ZN(SQ_instance_n159) );
  XNOR2_X1 SQ_instance_U152 ( .A(SQ_instance_n167), .B(SQ_instance_n166), .ZN(
        SQ_instance_n165) );
  XOR2_X1 SQ_instance_U151 ( .A(SQ_instance_n151), .B(SQ_instance_n150), .Z(
        SQ_instance_n166) );
  XOR2_X1 SQ_instance_U150 ( .A(SQ_instance_n161), .B(SQ_instance_n160), .Z(
        SQ_instance_n167) );
  XOR2_X1 SQ_instance_U149 ( .A(SQ_instance_n153), .B(SQ_instance_n152), .Z(
        SQ_instance_n160) );
  NAND2_X1 SQ_instance_U148 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[11]), .ZN(SQ_instance_n152) );
  NAND2_X1 SQ_instance_U147 ( .A1(SQ_instance_n149), .A2(SQ_instance_n148), 
        .ZN(SQ_instance_n153) );
  NAND2_X1 SQ_instance_U146 ( .A1(SQ_instance_n147), .A2(SQ_instance_n146), 
        .ZN(SQ_instance_n148) );
  OR2_X1 SQ_instance_U145 ( .A1(SQ_instance_n145), .A2(SQ_instance_n144), .ZN(
        SQ_instance_n146) );
  NAND2_X1 SQ_instance_U144 ( .A1(SQ_instance_n144), .A2(SQ_instance_n145), 
        .ZN(SQ_instance_n149) );
  NOR2_X1 SQ_instance_U143 ( .A1(SQ_instance_n143), .A2(SQ_instance_n142), 
        .ZN(SQ_instance_n161) );
  NOR2_X1 SQ_instance_U142 ( .A1(SQ_instance_n157), .A2(SQ_instance_n154), 
        .ZN(SQ_instance_n142) );
  NOR2_X1 SQ_instance_U141 ( .A1(SQ_instance_n155), .A2(SQ_instance_n141), 
        .ZN(SQ_instance_n143) );
  AND2_X1 SQ_instance_U140 ( .A1(SQ_instance_n154), .A2(SQ_instance_n157), 
        .ZN(SQ_instance_n141) );
  AND2_X1 SQ_instance_U139 ( .A1(SQ_instance_beta_coeff_muladd_0_3_cd_0_), 
        .A2(SQ_instance_r_r[23]), .ZN(SQ_instance_n157) );
  NOR2_X1 SQ_instance_U138 ( .A1(SQ_instance_n151), .A2(SQ_instance_n150), 
        .ZN(SQ_instance_n154) );
  NOR2_X1 SQ_instance_U137 ( .A1(SQ_instance_beta_coeff_muladd_0_3_cd_0_), 
        .A2(SQ_instance_r_r[23]), .ZN(SQ_instance_n150) );
  NAND2_X1 SQ_instance_U136 ( .A1(SQ_instance_a_r[0]), .A2(
        SQ_instance_alpha_r[10]), .ZN(SQ_instance_n151) );
  XOR2_X1 SQ_instance_U135 ( .A(SQ_instance_n145), .B(SQ_instance_n140), .Z(
        SQ_instance_n155) );
  XNOR2_X1 SQ_instance_U134 ( .A(SQ_instance_n147), .B(SQ_instance_n144), .ZN(
        SQ_instance_n140) );
  NAND2_X1 SQ_instance_U133 ( .A1(SQ_instance_a_r[0]), .A2(
        SQ_instance_alpha_r[11]), .ZN(SQ_instance_n144) );
  XNOR2_X1 SQ_instance_U132 ( .A(SQ_instance_beta_coeff_muladd_0_3_cd_0_), .B(
        SQ_instance_r_r[23]), .ZN(SQ_instance_n147) );
  NAND2_X1 SQ_instance_U131 ( .A1(SQ_instance_a_r[1]), .A2(
        SQ_instance_alpha_r[10]), .ZN(SQ_instance_n145) );
  NOR2_X1 SQ_instance_U130 ( .A1(SQ_instance_n238), .A2(SQ_instance_n139), 
        .ZN(SQ_instance_beta[3]) );
  NOR2_X1 SQ_instance_U129 ( .A1(SQ_instance_n138), .A2(SQ_instance_n137), 
        .ZN(SQ_instance_n139) );
  NOR2_X1 SQ_instance_U128 ( .A1(SQ_instance_n237), .A2(SQ_instance_n136), 
        .ZN(SQ_instance_n137) );
  NOR2_X1 SQ_instance_U127 ( .A1(SQ_instance_n135), .A2(SQ_instance_n134), 
        .ZN(SQ_instance_n136) );
  NOR2_X1 SQ_instance_U126 ( .A1(SQ_instance_n240), .A2(SQ_instance_n239), 
        .ZN(SQ_instance_n237) );
  NAND2_X1 SQ_instance_U125 ( .A1(SQ_instance_n135), .A2(SQ_instance_n134), 
        .ZN(SQ_instance_n239) );
  NAND2_X1 SQ_instance_U124 ( .A1(SQ_instance_n133), .A2(SQ_instance_n132), 
        .ZN(SQ_instance_n134) );
  NAND2_X1 SQ_instance_U123 ( .A1(SQ_instance_n131), .A2(SQ_instance_n130), 
        .ZN(SQ_instance_n132) );
  NAND2_X1 SQ_instance_U122 ( .A1(SQ_instance_n129), .A2(SQ_instance_n130), 
        .ZN(SQ_instance_n133) );
  XOR2_X1 SQ_instance_U121 ( .A(SQ_instance_n128), .B(SQ_instance_n127), .Z(
        SQ_instance_n240) );
  AND2_X1 SQ_instance_U120 ( .A1(SQ_instance_n138), .A2(SQ_instance_n135), 
        .ZN(SQ_instance_n238) );
  XOR2_X1 SQ_instance_U119 ( .A(SQ_instance_n126), .B(SQ_instance_n125), .Z(
        SQ_instance_n135) );
  XOR2_X1 SQ_instance_U118 ( .A(SQ_instance_n124), .B(SQ_instance_n123), .Z(
        SQ_instance_n125) );
  AND2_X1 SQ_instance_U117 ( .A1(SQ_instance_n127), .A2(SQ_instance_n128), 
        .ZN(SQ_instance_n138) );
  XOR2_X1 SQ_instance_U116 ( .A(SQ_instance_n130), .B(SQ_instance_n122), .Z(
        SQ_instance_n128) );
  XOR2_X1 SQ_instance_U115 ( .A(SQ_instance_n129), .B(SQ_instance_n131), .Z(
        SQ_instance_n122) );
  NAND2_X1 SQ_instance_U114 ( .A1(SQ_instance_n121), .A2(SQ_instance_n120), 
        .ZN(SQ_instance_n131) );
  NAND2_X1 SQ_instance_U113 ( .A1(SQ_instance_n124), .A2(SQ_instance_n119), 
        .ZN(SQ_instance_n120) );
  NAND2_X1 SQ_instance_U112 ( .A1(SQ_instance_n126), .A2(SQ_instance_n123), 
        .ZN(SQ_instance_n119) );
  XNOR2_X1 SQ_instance_U111 ( .A(SQ_instance_r_r[14]), .B(SQ_instance_n118), 
        .ZN(SQ_instance_n124) );
  OR2_X1 SQ_instance_U110 ( .A1(SQ_instance_n123), .A2(SQ_instance_n126), .ZN(
        SQ_instance_n121) );
  NAND2_X1 SQ_instance_U109 ( .A1(SQ_instance_n117), .A2(SQ_instance_r_r[15]), 
        .ZN(SQ_instance_n126) );
  NAND2_X1 SQ_instance_U108 ( .A1(SQ_instance_a_r[2]), .A2(
        SQ_instance_alpha_r[3]), .ZN(SQ_instance_n123) );
  NOR2_X1 SQ_instance_U107 ( .A1(SQ_instance_n116), .A2(SQ_instance_n118), 
        .ZN(SQ_instance_n129) );
  NAND2_X1 SQ_instance_U106 ( .A1(SQ_instance_alpha_r[2]), .A2(
        SQ_instance_a_r[3]), .ZN(SQ_instance_n118) );
  INV_X1 SQ_instance_U105 ( .A(SQ_instance_r_r[14]), .ZN(SQ_instance_n116) );
  AND2_X1 SQ_instance_U104 ( .A1(SQ_instance_a_r[3]), .A2(
        SQ_instance_alpha_r[3]), .ZN(SQ_instance_n130) );
  XOR2_X1 SQ_instance_U103 ( .A(SQ_instance_r_r[15]), .B(SQ_instance_n117), 
        .Z(SQ_instance_n127) );
  AND2_X1 SQ_instance_U102 ( .A1(SQ_instance_alpha_r[2]), .A2(
        SQ_instance_a_r[2]), .ZN(SQ_instance_n117) );
  NAND2_X1 SQ_instance_U101 ( .A1(SQ_instance_n115), .A2(SQ_instance_n114), 
        .ZN(SQ_instance_beta[9]) );
  NOR2_X1 SQ_instance_U100 ( .A1(SQ_instance_n113), .A2(SQ_instance_n112), 
        .ZN(SQ_instance_n115) );
  NOR2_X1 SQ_instance_U99 ( .A1(SQ_instance_n111), .A2(SQ_instance_n110), .ZN(
        SQ_instance_n112) );
  INV_X1 SQ_instance_U98 ( .A(SQ_instance_n109), .ZN(SQ_instance_n110) );
  NOR2_X1 SQ_instance_U97 ( .A1(SQ_instance_n108), .A2(SQ_instance_n107), .ZN(
        SQ_instance_n113) );
  NOR2_X1 SQ_instance_U96 ( .A1(SQ_instance_alpha_r[9]), .A2(SQ_instance_n106), 
        .ZN(SQ_instance_n107) );
  NOR2_X1 SQ_instance_U95 ( .A1(SQ_instance_alpha_r[8]), .A2(SQ_instance_n105), 
        .ZN(SQ_instance_n106) );
  NAND2_X1 SQ_instance_U94 ( .A1(SQ_instance_n104), .A2(SQ_instance_n103), 
        .ZN(SQ_instance_beta[8]) );
  NAND2_X1 SQ_instance_U93 ( .A1(SQ_instance_n109), .A2(SQ_instance_n114), 
        .ZN(SQ_instance_n103) );
  NAND2_X1 SQ_instance_U92 ( .A1(SQ_instance_alpha_r[8]), .A2(
        SQ_instance_a_r[3]), .ZN(SQ_instance_n114) );
  NOR2_X1 SQ_instance_U91 ( .A1(SQ_instance_a_r[2]), .A2(SQ_instance_n105), 
        .ZN(SQ_instance_n109) );
  NOR2_X1 SQ_instance_U90 ( .A1(SQ_instance_n111), .A2(SQ_instance_n102), .ZN(
        SQ_instance_n104) );
  NOR2_X1 SQ_instance_U89 ( .A1(SQ_instance_n101), .A2(SQ_instance_n108), .ZN(
        SQ_instance_n102) );
  INV_X1 SQ_instance_U88 ( .A(SQ_instance_a_r[2]), .ZN(SQ_instance_n108) );
  NOR2_X1 SQ_instance_U87 ( .A1(SQ_instance_alpha_r[8]), .A2(SQ_instance_n100), 
        .ZN(SQ_instance_n101) );
  NOR2_X1 SQ_instance_U86 ( .A1(SQ_instance_alpha_r[9]), .A2(SQ_instance_n105), 
        .ZN(SQ_instance_n100) );
  NOR2_X1 SQ_instance_U85 ( .A1(SQ_instance_beta_coeff_muladd_1_3_cd_0_), .A2(
        SQ_instance_r_r[21]), .ZN(SQ_instance_n105) );
  AND2_X1 SQ_instance_U84 ( .A1(SQ_instance_a_r[3]), .A2(
        SQ_instance_alpha_r[9]), .ZN(SQ_instance_n111) );
  NAND2_X1 SQ_instance_U83 ( .A1(SQ_instance_n99), .A2(SQ_instance_n98), .ZN(
        SQ_instance_beta[5]) );
  NOR2_X1 SQ_instance_U82 ( .A1(SQ_instance_n97), .A2(SQ_instance_n96), .ZN(
        SQ_instance_n99) );
  NOR2_X1 SQ_instance_U81 ( .A1(SQ_instance_n95), .A2(SQ_instance_n94), .ZN(
        SQ_instance_n96) );
  INV_X1 SQ_instance_U80 ( .A(SQ_instance_n93), .ZN(SQ_instance_n94) );
  NOR2_X1 SQ_instance_U79 ( .A1(SQ_instance_n92), .A2(SQ_instance_n91), .ZN(
        SQ_instance_n97) );
  NOR2_X1 SQ_instance_U78 ( .A1(SQ_instance_alpha_r[5]), .A2(SQ_instance_n90), 
        .ZN(SQ_instance_n91) );
  NOR2_X1 SQ_instance_U77 ( .A1(SQ_instance_alpha_r[4]), .A2(SQ_instance_n89), 
        .ZN(SQ_instance_n90) );
  NAND2_X1 SQ_instance_U76 ( .A1(SQ_instance_n88), .A2(SQ_instance_n87), .ZN(
        SQ_instance_beta[4]) );
  NAND2_X1 SQ_instance_U75 ( .A1(SQ_instance_n93), .A2(SQ_instance_n98), .ZN(
        SQ_instance_n87) );
  NAND2_X1 SQ_instance_U74 ( .A1(SQ_instance_alpha_r[4]), .A2(
        SQ_instance_a_r[5]), .ZN(SQ_instance_n98) );
  NOR2_X1 SQ_instance_U73 ( .A1(SQ_instance_n89), .A2(SQ_instance_a_r[4]), 
        .ZN(SQ_instance_n93) );
  NOR2_X1 SQ_instance_U72 ( .A1(SQ_instance_n95), .A2(SQ_instance_n86), .ZN(
        SQ_instance_n88) );
  NOR2_X1 SQ_instance_U71 ( .A1(SQ_instance_n85), .A2(SQ_instance_n92), .ZN(
        SQ_instance_n86) );
  INV_X1 SQ_instance_U70 ( .A(SQ_instance_a_r[4]), .ZN(SQ_instance_n92) );
  NOR2_X1 SQ_instance_U69 ( .A1(SQ_instance_alpha_r[4]), .A2(SQ_instance_n84), 
        .ZN(SQ_instance_n85) );
  NOR2_X1 SQ_instance_U68 ( .A1(SQ_instance_alpha_r[5]), .A2(SQ_instance_n89), 
        .ZN(SQ_instance_n84) );
  NOR2_X1 SQ_instance_U67 ( .A1(SQ_instance_beta_coeff_muladd_2_3_cd_0_), .A2(
        SQ_instance_r_r[17]), .ZN(SQ_instance_n89) );
  AND2_X1 SQ_instance_U66 ( .A1(SQ_instance_alpha_r[5]), .A2(
        SQ_instance_a_r[5]), .ZN(SQ_instance_n95) );
  NOR2_X1 SQ_instance_U65 ( .A1(SQ_instance_n244), .A2(SQ_instance_n83), .ZN(
        b0[1]) );
  NOR2_X1 SQ_instance_U64 ( .A1(SQ_instance_n82), .A2(SQ_instance_n81), .ZN(
        SQ_instance_n83) );
  NOR2_X1 SQ_instance_U63 ( .A1(SQ_instance_n80), .A2(SQ_instance_n243), .ZN(
        SQ_instance_n81) );
  NOR2_X1 SQ_instance_U62 ( .A1(SQ_instance_n246), .A2(SQ_instance_n245), .ZN(
        SQ_instance_n243) );
  XNOR2_X1 SQ_instance_U61 ( .A(SQ_instance_n79), .B(SQ_instance_beta_r[10]), 
        .ZN(SQ_instance_n246) );
  NOR2_X1 SQ_instance_U60 ( .A1(SQ_instance_n80), .A2(SQ_instance_n78), .ZN(
        SQ_instance_n244) );
  NAND2_X1 SQ_instance_U59 ( .A1(SQ_instance_n82), .A2(SQ_instance_n245), .ZN(
        SQ_instance_n78) );
  NAND2_X1 SQ_instance_U58 ( .A1(SQ_instance_beta_r[11]), .A2(SQ_instance_n77), 
        .ZN(SQ_instance_n245) );
  NOR2_X1 SQ_instance_U57 ( .A1(SQ_instance_n79), .A2(SQ_instance_n76), .ZN(
        SQ_instance_n82) );
  INV_X1 SQ_instance_U56 ( .A(SQ_instance_beta_r[10]), .ZN(SQ_instance_n76) );
  NOR2_X1 SQ_instance_U55 ( .A1(SQ_instance_n75), .A2(SQ_instance_n74), .ZN(
        SQ_instance_n79) );
  XOR2_X1 SQ_instance_U54 ( .A(SQ_instance_n73), .B(SQ_instance_n72), .Z(
        SQ_instance_n74) );
  NOR2_X1 SQ_instance_U53 ( .A1(SQ_instance_n71), .A2(SQ_instance_n70), .ZN(
        SQ_instance_n75) );
  NOR2_X1 SQ_instance_U52 ( .A1(SQ_instance_beta_r[11]), .A2(SQ_instance_n77), 
        .ZN(SQ_instance_n80) );
  NAND2_X1 SQ_instance_U51 ( .A1(SQ_instance_n69), .A2(SQ_instance_n68), .ZN(
        SQ_instance_n77) );
  XNOR2_X1 SQ_instance_U50 ( .A(SQ_instance_n71), .B(SQ_instance_n70), .ZN(
        SQ_instance_n68) );
  XNOR2_X1 SQ_instance_U49 ( .A(SQ_instance_n67), .B(SQ_instance_beta_r[7]), 
        .ZN(SQ_instance_n70) );
  NAND2_X1 SQ_instance_U48 ( .A1(SQ_instance_beta_r[6]), .A2(SQ_instance_n66), 
        .ZN(SQ_instance_n71) );
  NAND2_X1 SQ_instance_U47 ( .A1(SQ_instance_n73), .A2(SQ_instance_n72), .ZN(
        SQ_instance_n69) );
  AND2_X1 SQ_instance_U46 ( .A1(SQ_instance_n67), .A2(SQ_instance_beta_r[7]), 
        .ZN(SQ_instance_n72) );
  OR2_X1 SQ_instance_U45 ( .A1(SQ_instance_n65), .A2(SQ_instance_n64), .ZN(
        SQ_instance_n67) );
  XNOR2_X1 SQ_instance_U44 ( .A(SQ_instance_n63), .B(SQ_instance_n62), .ZN(
        SQ_instance_n64) );
  NAND2_X1 SQ_instance_U43 ( .A1(SQ_instance_beta_r[0]), .A2(
        SQ_instance_gamma_mul_rr[0]), .ZN(SQ_instance_n62) );
  NOR2_X1 SQ_instance_U42 ( .A1(SQ_instance_n61), .A2(SQ_instance_n60), .ZN(
        SQ_instance_n65) );
  XOR2_X1 SQ_instance_U41 ( .A(SQ_instance_beta_r[6]), .B(SQ_instance_n66), 
        .Z(SQ_instance_n73) );
  NAND2_X1 SQ_instance_U40 ( .A1(SQ_instance_n59), .A2(SQ_instance_n58), .ZN(
        SQ_instance_n66) );
  NAND2_X1 SQ_instance_U39 ( .A1(SQ_instance_gamma_mul_rr[0]), .A2(
        SQ_instance_n63), .ZN(SQ_instance_n58) );
  XOR2_X1 SQ_instance_U38 ( .A(SQ_instance_beta_r[1]), .B(
        SQ_instance_gamma_mul_rr[1]), .Z(SQ_instance_n63) );
  XNOR2_X1 SQ_instance_U37 ( .A(SQ_instance_n60), .B(SQ_instance_n61), .ZN(
        SQ_instance_n59) );
  XNOR2_X1 SQ_instance_U36 ( .A(SQ_instance_beta_r[0]), .B(
        SQ_instance_gamma_mul_rr[0]), .ZN(SQ_instance_n61) );
  NAND2_X1 SQ_instance_U35 ( .A1(SQ_instance_beta_r[1]), .A2(
        SQ_instance_gamma_mul_rr[1]), .ZN(SQ_instance_n60) );
  OR2_X1 SQ_instance_U31 ( .A1(a_sel_rr[7]), .A2(a_sel_rr[6]), .ZN(
        SQ_instance_gamma_mul[6]) );
  OR2_X1 SQ_instance_U30 ( .A1(r_rr[1]), .A2(SQ_instance_n57), .ZN(
        SQ_instance_alpha[1]) );
  NOR2_X1 SQ_instance_U29 ( .A1(r_rr[0]), .A2(SQ_instance_n56), .ZN(
        SQ_instance_n57) );
  OR2_X1 SQ_instance_U28 ( .A1(r_rr[0]), .A2(SQ_instance_n55), .ZN(
        SQ_instance_add_x_2_n6) );
  NOR2_X1 SQ_instance_U27 ( .A1(r_rr[1]), .A2(SQ_instance_n56), .ZN(
        SQ_instance_n55) );
  NOR2_X1 SQ_instance_U26 ( .A1(a_sel_rr[3]), .A2(a_sel_rr[2]), .ZN(
        SQ_instance_n56) );
  OR2_X1 SQ_instance_U25 ( .A1(SQ_instance_n54), .A2(SQ_instance_n53), .ZN(
        b3[0]) );
  XNOR2_X1 SQ_instance_U24 ( .A(SQ_instance_n383), .B(SQ_instance_n52), .ZN(
        SQ_instance_n53) );
  NAND2_X1 SQ_instance_U23 ( .A1(SQ_instance_n384), .A2(SQ_instance_r_rr[17]), 
        .ZN(SQ_instance_n52) );
  XOR2_X1 SQ_instance_U22 ( .A(SQ_instance_n51), .B(SQ_instance_r_rr[16]), .Z(
        SQ_instance_n383) );
  NOR2_X1 SQ_instance_U21 ( .A1(SQ_instance_n381), .A2(SQ_instance_n50), .ZN(
        SQ_instance_n54) );
  NOR2_X1 SQ_instance_U20 ( .A1(SQ_instance_n384), .A2(SQ_instance_r_rr[17]), 
        .ZN(SQ_instance_n50) );
  NOR2_X1 SQ_instance_U19 ( .A1(SQ_instance_n49), .A2(SQ_instance_n48), .ZN(
        SQ_instance_n384) );
  NOR2_X1 SQ_instance_U18 ( .A1(SQ_instance_n47), .A2(SQ_instance_n46), .ZN(
        SQ_instance_n48) );
  NAND2_X1 SQ_instance_U17 ( .A1(SQ_instance_r_rr[23]), .A2(SQ_instance_n45), 
        .ZN(SQ_instance_n46) );
  NAND2_X1 SQ_instance_U16 ( .A1(SQ_instance_n44), .A2(SQ_instance_n43), .ZN(
        SQ_instance_n45) );
  NOR2_X1 SQ_instance_U15 ( .A1(SQ_instance_n42), .A2(SQ_instance_n43), .ZN(
        SQ_instance_n47) );
  NOR2_X1 SQ_instance_U14 ( .A1(SQ_instance_r_rr[23]), .A2(SQ_instance_n41), 
        .ZN(SQ_instance_n49) );
  XNOR2_X1 SQ_instance_U13 ( .A(SQ_instance_gamma_mul_beta[1]), .B(
        SQ_instance_n44), .ZN(SQ_instance_n41) );
  NAND2_X1 SQ_instance_U12 ( .A1(SQ_instance_r_rr[16]), .A2(SQ_instance_n51), 
        .ZN(SQ_instance_n381) );
  OR2_X1 SQ_instance_U11 ( .A1(SQ_instance_n40), .A2(SQ_instance_n39), .ZN(
        SQ_instance_n51) );
  NAND2_X1 SQ_instance_U10 ( .A1(SQ_instance_n38), .A2(SQ_instance_n37), .ZN(
        SQ_instance_n39) );
  NAND2_X1 SQ_instance_U9 ( .A1(SQ_instance_r_rr[23]), .A2(SQ_instance_n36), 
        .ZN(SQ_instance_n37) );
  XNOR2_X1 SQ_instance_U8 ( .A(SQ_instance_n35), .B(SQ_instance_n34), .ZN(
        SQ_instance_n38) );
  NOR2_X1 SQ_instance_U7 ( .A1(SQ_instance_n36), .A2(SQ_instance_n42), .ZN(
        SQ_instance_n34) );
  NOR2_X1 SQ_instance_U6 ( .A1(SQ_instance_r_rr[22]), .A2(
        SQ_instance_gamma_mul_beta[0]), .ZN(SQ_instance_n42) );
  INV_X1 SQ_instance_U5 ( .A(SQ_instance_n44), .ZN(SQ_instance_n36) );
  AND2_X1 SQ_instance_U4 ( .A1(SQ_instance_r_rr[23]), .A2(
        SQ_instance_gamma_mul_beta[1]), .ZN(SQ_instance_n35) );
  NOR2_X1 SQ_instance_U3 ( .A1(SQ_instance_n44), .A2(SQ_instance_n43), .ZN(
        SQ_instance_n40) );
  INV_X1 SQ_instance_U2 ( .A(SQ_instance_gamma_mul_beta[1]), .ZN(
        SQ_instance_n43) );
  NAND2_X1 SQ_instance_U1 ( .A1(SQ_instance_r_rr[22]), .A2(
        SQ_instance_gamma_mul_beta[0]), .ZN(SQ_instance_n44) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_0_ ( .D(a_sel_rr[0]), .CK(clk), .Q(
        SQ_instance_a_r[0]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_1_ ( .D(a_sel_rr[1]), .CK(clk), .Q(
        SQ_instance_a_r[1]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_2_ ( .D(a_sel_rr[2]), .CK(clk), .Q(
        SQ_instance_a_r[2]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_3_ ( .D(a_sel_rr[3]), .CK(clk), .Q(
        SQ_instance_a_r[3]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_4_ ( .D(a_sel_rr[4]), .CK(clk), .Q(
        SQ_instance_a_r[4]) );
  DFF_X1 SQ_instance_a_reg_outpt_reg_5_ ( .D(a_sel_rr[5]), .CK(clk), .Q(
        SQ_instance_a_r[5]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_12_ ( .D(r_rr[12]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_0_1_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_13_ ( .D(r_rr[13]), .CK(clk), .Q(
        SQ_instance_r_r[13]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_14_ ( .D(r_rr[14]), .CK(clk), .Q(
        SQ_instance_r_r[14]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_15_ ( .D(r_rr[15]), .CK(clk), .Q(
        SQ_instance_r_r[15]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_16_ ( .D(r_rr[16]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_2_3_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_17_ ( .D(r_rr[17]), .CK(clk), .Q(
        SQ_instance_r_r[17]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_18_ ( .D(r_rr[18]), .CK(clk), .Q(
        SQ_instance_r_r[18]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_19_ ( .D(r_rr[19]), .CK(clk), .Q(
        SQ_instance_r_r[19]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_20_ ( .D(r_rr[20]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_1_3_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_21_ ( .D(r_rr[21]), .CK(clk), .Q(
        SQ_instance_r_r[21]) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_22_ ( .D(r_rr[22]), .CK(clk), .Q(
        SQ_instance_beta_coeff_muladd_0_3_cd_0_) );
  DFF_X1 SQ_instance_r_reg1_outpt_reg_23_ ( .D(r_rr[23]), .CK(clk), .Q(
        SQ_instance_r_r[23]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_12_ ( .D(
        SQ_instance_beta_coeff_muladd_0_1_cd_0_), .CK(clk), .Q(
        SQ_instance_r_rr[12]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_13_ ( .D(SQ_instance_r_r[13]), .CK(clk), 
        .Q(SQ_instance_r_rr[13]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_16_ ( .D(
        SQ_instance_beta_coeff_muladd_2_3_cd_0_), .CK(clk), .Q(
        SQ_instance_r_rr[16]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_17_ ( .D(SQ_instance_r_r[17]), .CK(clk), 
        .Q(SQ_instance_r_rr[17]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_18_ ( .D(SQ_instance_r_r[18]), .CK(clk), 
        .Q(SQ_instance_r_rr[18]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_19_ ( .D(SQ_instance_r_r[19]), .CK(clk), 
        .Q(SQ_instance_r_rr[19]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_22_ ( .D(
        SQ_instance_beta_coeff_muladd_0_3_cd_0_), .CK(clk), .Q(
        SQ_instance_r_rr[22]) );
  DFF_X1 SQ_instance_r_reg2_outpt_reg_23_ ( .D(SQ_instance_r_r[23]), .CK(clk), 
        .Q(SQ_instance_r_rr[23]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_0_ ( .D(SQ_instance_add_x_2_n6), .CK(
        clk), .Q(SQ_instance_alpha_r[0]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_1_ ( .D(SQ_instance_alpha[1]), .CK(
        clk), .Q(SQ_instance_alpha_r[1]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_2_ ( .D(SQ_instance_alpha[2]), .CK(
        clk), .Q(SQ_instance_alpha_r[2]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_3_ ( .D(SQ_instance_alpha[3]), .CK(
        clk), .Q(SQ_instance_alpha_r[3]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_4_ ( .D(SQ_instance_add_x_9_n6), .CK(
        clk), .Q(SQ_instance_alpha_r[4]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_5_ ( .D(SQ_instance_alpha[5]), .CK(
        clk), .Q(SQ_instance_alpha_r[5]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_6_ ( .D(SQ_instance_alpha[6]), .CK(
        clk), .Q(SQ_instance_alpha_r[6]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_7_ ( .D(SQ_instance_alpha[7]), .CK(
        clk), .Q(SQ_instance_alpha_r[7]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_8_ ( .D(SQ_instance_add_x_7_n6), .CK(
        clk), .Q(SQ_instance_alpha_r[8]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_9_ ( .D(SQ_instance_alpha[9]), .CK(
        clk), .Q(SQ_instance_alpha_r[9]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_10_ ( .D(SQ_instance_add_x_5_n6), 
        .CK(clk), .Q(SQ_instance_alpha_r[10]) );
  DFF_X1 SQ_instance_alpha_reg_outpt_reg_11_ ( .D(SQ_instance_alpha[11]), .CK(
        clk), .Q(SQ_instance_alpha_r[11]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_0_ ( .D(SQ_instance_beta[0]), .CK(clk), 
        .Q(SQ_instance_beta_r[0]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_1_ ( .D(SQ_instance_beta[1]), .CK(clk), 
        .Q(SQ_instance_beta_r[1]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_2_ ( .D(SQ_instance_add_x_19_n6), .CK(
        clk), .Q(SQ_instance_beta_r[2]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_3_ ( .D(SQ_instance_beta[3]), .CK(clk), 
        .Q(SQ_instance_beta_r[3]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_4_ ( .D(SQ_instance_beta[4]), .CK(clk), 
        .Q(SQ_instance_beta_r[4]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_5_ ( .D(SQ_instance_beta[5]), .CK(clk), 
        .Q(SQ_instance_beta_r[5]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_6_ ( .D(SQ_instance_add_x_14_n6), .CK(
        clk), .Q(SQ_instance_beta_r[6]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_7_ ( .D(SQ_instance_beta[7]), .CK(clk), 
        .Q(SQ_instance_beta_r[7]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_8_ ( .D(SQ_instance_beta[8]), .CK(clk), 
        .Q(SQ_instance_beta_r[8]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_9_ ( .D(SQ_instance_beta[9]), .CK(clk), 
        .Q(SQ_instance_beta_r[9]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_10_ ( .D(SQ_instance_beta[10]), .CK(
        clk), .Q(SQ_instance_beta_r[10]) );
  DFF_X1 SQ_instance_beta_reg_outpt_reg_11_ ( .D(SQ_instance_beta[11]), .CK(
        clk), .Q(SQ_instance_beta_r[11]) );
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
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_5_ ( .D(SQ_instance_gamma_mul[5]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[5]) );
  DFF_X1 SQ_instance_gamma_reg1_outpt_reg_6_ ( .D(SQ_instance_gamma_mul[6]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_r[6]) );
  INV_X1 SQ_instance_gamma_reg2_U2 ( .A(SQ_instance_gamma_reg2_n8), .ZN(
        SQ_instance_gamma_mul_beta[0]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_6_ ( .D(SQ_instance_gamma_mul_r[6]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_beta[1]), .QN(
        SQ_instance_gamma_reg2_n8) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_0_ ( .D(SQ_instance_gamma_mul_r[0]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[0]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_1_ ( .D(SQ_instance_gamma_mul_r[1]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[1]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_2_ ( .D(SQ_instance_gamma_mul_r[2]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[2]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_3_ ( .D(SQ_instance_gamma_mul_r[3]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[3]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_4_ ( .D(SQ_instance_gamma_mul_r[4]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[4]) );
  DFF_X1 SQ_instance_gamma_reg2_outpt_reg_5_ ( .D(SQ_instance_gamma_mul_r[5]), 
        .CK(clk), .Q(SQ_instance_gamma_mul_rr[5]) );
endmodule

