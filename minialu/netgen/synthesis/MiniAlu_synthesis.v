////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: MiniAlu_synthesis.v
// /___/   /\     Timestamp: Sat May 19 09:39:10 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim MiniAlu.ngc MiniAlu_synthesis.v 
// Device	: xc3s500e-4-fg320
// Input file	: MiniAlu.ngc
// Output file	: /home/emanuel/Desktop/Laboratorio-de-Digitales/Lab2git/minialu/minialu/netgen/synthesis/MiniAlu_synthesis.v
// # of Modules	: 1
// Design Name	: MiniAlu
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module MiniAlu_synth (
  LCD_E, Reset, LCD_RS, LCD_RW, Clock, No_se, oLed, SF_D
);
  output LCD_E;
  input Reset;
  output LCD_RS;
  output LCD_RW;
  input Clock;
  output No_se;
  output [7 : 0] oLed;
  output [11 : 8] SF_D;
  wire Clock_BUFGP_1;
  wire \InstructionRom/oInstruction_and0000 ;
  wire LCD_E_OBUF_4;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<0>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<10>1 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>_1_rt_12 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<2>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<3>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<4>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<5>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>_1_rt_18 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<7>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<8>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_cy<9>1 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<0>2_22 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<10>1_23 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<2>2_26 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<3>2_27 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<4>2_28 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<5>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<7>2_30 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<8>2_31 ;
  wire \LSD/Mcompar_rCurrentState_cmp_le0002_lut<9>2_32 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<10>1 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<11>1 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>_3_rt_41 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>1 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>2 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>_2_rt_54 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<9>1 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>2_56 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>3_57 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<10>1_58 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<11>1_59 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>5 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<2>3_62 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>4_63 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>5_64 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>4_65 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>5_66 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>3_67 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>4_69 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>5_70 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>3_71 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>4 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<8>2_73 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>1_74 ;
  wire \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>2_75 ;
  wire \LSD/Mcount_rTimeCount_cy<10>_rt_78 ;
  wire \LSD/Mcount_rTimeCount_cy<11>_rt_80 ;
  wire \LSD/Mcount_rTimeCount_cy<12>_rt_82 ;
  wire \LSD/Mcount_rTimeCount_cy<13>_rt_84 ;
  wire \LSD/Mcount_rTimeCount_cy<14>_rt_86 ;
  wire \LSD/Mcount_rTimeCount_cy<15>_rt_88 ;
  wire \LSD/Mcount_rTimeCount_cy<16>_rt_90 ;
  wire \LSD/Mcount_rTimeCount_cy<17>_rt_92 ;
  wire \LSD/Mcount_rTimeCount_cy<18>_rt_94 ;
  wire \LSD/Mcount_rTimeCount_cy<19>_rt_96 ;
  wire \LSD/Mcount_rTimeCount_cy<1>_rt_98 ;
  wire \LSD/Mcount_rTimeCount_cy<20>_rt_100 ;
  wire \LSD/Mcount_rTimeCount_cy<21>_rt_102 ;
  wire \LSD/Mcount_rTimeCount_cy<22>_rt_104 ;
  wire \LSD/Mcount_rTimeCount_cy<23>_rt_106 ;
  wire \LSD/Mcount_rTimeCount_cy<24>_rt_108 ;
  wire \LSD/Mcount_rTimeCount_cy<25>_rt_110 ;
  wire \LSD/Mcount_rTimeCount_cy<26>_rt_112 ;
  wire \LSD/Mcount_rTimeCount_cy<27>_rt_114 ;
  wire \LSD/Mcount_rTimeCount_cy<28>_rt_116 ;
  wire \LSD/Mcount_rTimeCount_cy<29>_rt_118 ;
  wire \LSD/Mcount_rTimeCount_cy<2>_rt_120 ;
  wire \LSD/Mcount_rTimeCount_cy<30>_rt_122 ;
  wire \LSD/Mcount_rTimeCount_cy<3>_rt_124 ;
  wire \LSD/Mcount_rTimeCount_cy<4>_rt_126 ;
  wire \LSD/Mcount_rTimeCount_cy<5>_rt_128 ;
  wire \LSD/Mcount_rTimeCount_cy<6>_rt_130 ;
  wire \LSD/Mcount_rTimeCount_cy<7>_rt_132 ;
  wire \LSD/Mcount_rTimeCount_cy<8>_rt_134 ;
  wire \LSD/Mcount_rTimeCount_cy<9>_rt_136 ;
  wire \LSD/Mcount_rTimeCount_xor<31>_rt_138 ;
  wire \LSD/rCurrentState_FSM_FFd1_171 ;
  wire \LSD/rCurrentState_FSM_FFd1-In1 ;
  wire \LSD/rCurrentState_FSM_FFd2_173 ;
  wire \LSD/rCurrentState_FSM_FFd2-In ;
  wire \LSD/rCurrentState_cmp_ge0000 ;
  wire \LSD/rTimeCount_or0000_208 ;
  wire N17;
  wire N18;
  wire Reset_IBUF_213;
  wire oLed_0_OBUF_226;
  wire [12 : 11] \LSD/Mcompar_rCurrentState_cmp_le0002_cy ;
  wire [12 : 11] \LSD/Mcompar_rCurrentState_cmp_le0002_lut ;
  wire [30 : 0] \LSD/Mcount_rTimeCount_cy ;
  wire [0 : 0] \LSD/Mcount_rTimeCount_lut ;
  wire [31 : 0] \LSD/Result ;
  wire [31 : 0] \LSD/rTimeCount ;
  GND   XST_GND (
    .G(oLed_0_OBUF_226)
  );
  VCC   XST_VCC (
    .P(\InstructionRom/oInstruction_and0000 )
  );
  FDR   \LSD/rCurrentState_FSM_FFd2  (
    .C(Clock_BUFGP_1),
    .D(\LSD/rCurrentState_FSM_FFd2-In ),
    .R(Reset_IBUF_213),
    .Q(\LSD/rCurrentState_FSM_FFd2_173 )
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<31>  (
    .CI(\LSD/Mcount_rTimeCount_cy [30]),
    .LI(\LSD/Mcount_rTimeCount_xor<31>_rt_138 ),
    .O(\LSD/Result [31])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<30>  (
    .CI(\LSD/Mcount_rTimeCount_cy [29]),
    .LI(\LSD/Mcount_rTimeCount_cy<30>_rt_122 ),
    .O(\LSD/Result [30])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<30>  (
    .CI(\LSD/Mcount_rTimeCount_cy [29]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<30>_rt_122 ),
    .O(\LSD/Mcount_rTimeCount_cy [30])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<29>  (
    .CI(\LSD/Mcount_rTimeCount_cy [28]),
    .LI(\LSD/Mcount_rTimeCount_cy<29>_rt_118 ),
    .O(\LSD/Result [29])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<29>  (
    .CI(\LSD/Mcount_rTimeCount_cy [28]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<29>_rt_118 ),
    .O(\LSD/Mcount_rTimeCount_cy [29])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<28>  (
    .CI(\LSD/Mcount_rTimeCount_cy [27]),
    .LI(\LSD/Mcount_rTimeCount_cy<28>_rt_116 ),
    .O(\LSD/Result [28])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<28>  (
    .CI(\LSD/Mcount_rTimeCount_cy [27]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<28>_rt_116 ),
    .O(\LSD/Mcount_rTimeCount_cy [28])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<27>  (
    .CI(\LSD/Mcount_rTimeCount_cy [26]),
    .LI(\LSD/Mcount_rTimeCount_cy<27>_rt_114 ),
    .O(\LSD/Result [27])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<27>  (
    .CI(\LSD/Mcount_rTimeCount_cy [26]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<27>_rt_114 ),
    .O(\LSD/Mcount_rTimeCount_cy [27])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<26>  (
    .CI(\LSD/Mcount_rTimeCount_cy [25]),
    .LI(\LSD/Mcount_rTimeCount_cy<26>_rt_112 ),
    .O(\LSD/Result [26])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<26>  (
    .CI(\LSD/Mcount_rTimeCount_cy [25]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<26>_rt_112 ),
    .O(\LSD/Mcount_rTimeCount_cy [26])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<25>  (
    .CI(\LSD/Mcount_rTimeCount_cy [24]),
    .LI(\LSD/Mcount_rTimeCount_cy<25>_rt_110 ),
    .O(\LSD/Result [25])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<25>  (
    .CI(\LSD/Mcount_rTimeCount_cy [24]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<25>_rt_110 ),
    .O(\LSD/Mcount_rTimeCount_cy [25])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<24>  (
    .CI(\LSD/Mcount_rTimeCount_cy [23]),
    .LI(\LSD/Mcount_rTimeCount_cy<24>_rt_108 ),
    .O(\LSD/Result [24])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<24>  (
    .CI(\LSD/Mcount_rTimeCount_cy [23]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<24>_rt_108 ),
    .O(\LSD/Mcount_rTimeCount_cy [24])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<23>  (
    .CI(\LSD/Mcount_rTimeCount_cy [22]),
    .LI(\LSD/Mcount_rTimeCount_cy<23>_rt_106 ),
    .O(\LSD/Result [23])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<23>  (
    .CI(\LSD/Mcount_rTimeCount_cy [22]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<23>_rt_106 ),
    .O(\LSD/Mcount_rTimeCount_cy [23])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<22>  (
    .CI(\LSD/Mcount_rTimeCount_cy [21]),
    .LI(\LSD/Mcount_rTimeCount_cy<22>_rt_104 ),
    .O(\LSD/Result [22])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<22>  (
    .CI(\LSD/Mcount_rTimeCount_cy [21]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<22>_rt_104 ),
    .O(\LSD/Mcount_rTimeCount_cy [22])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<21>  (
    .CI(\LSD/Mcount_rTimeCount_cy [20]),
    .LI(\LSD/Mcount_rTimeCount_cy<21>_rt_102 ),
    .O(\LSD/Result [21])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<21>  (
    .CI(\LSD/Mcount_rTimeCount_cy [20]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<21>_rt_102 ),
    .O(\LSD/Mcount_rTimeCount_cy [21])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<20>  (
    .CI(\LSD/Mcount_rTimeCount_cy [19]),
    .LI(\LSD/Mcount_rTimeCount_cy<20>_rt_100 ),
    .O(\LSD/Result [20])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<20>  (
    .CI(\LSD/Mcount_rTimeCount_cy [19]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<20>_rt_100 ),
    .O(\LSD/Mcount_rTimeCount_cy [20])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<19>  (
    .CI(\LSD/Mcount_rTimeCount_cy [18]),
    .LI(\LSD/Mcount_rTimeCount_cy<19>_rt_96 ),
    .O(\LSD/Result [19])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<19>  (
    .CI(\LSD/Mcount_rTimeCount_cy [18]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<19>_rt_96 ),
    .O(\LSD/Mcount_rTimeCount_cy [19])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<18>  (
    .CI(\LSD/Mcount_rTimeCount_cy [17]),
    .LI(\LSD/Mcount_rTimeCount_cy<18>_rt_94 ),
    .O(\LSD/Result [18])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<18>  (
    .CI(\LSD/Mcount_rTimeCount_cy [17]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<18>_rt_94 ),
    .O(\LSD/Mcount_rTimeCount_cy [18])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<17>  (
    .CI(\LSD/Mcount_rTimeCount_cy [16]),
    .LI(\LSD/Mcount_rTimeCount_cy<17>_rt_92 ),
    .O(\LSD/Result [17])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<17>  (
    .CI(\LSD/Mcount_rTimeCount_cy [16]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<17>_rt_92 ),
    .O(\LSD/Mcount_rTimeCount_cy [17])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<16>  (
    .CI(\LSD/Mcount_rTimeCount_cy [15]),
    .LI(\LSD/Mcount_rTimeCount_cy<16>_rt_90 ),
    .O(\LSD/Result [16])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<16>  (
    .CI(\LSD/Mcount_rTimeCount_cy [15]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<16>_rt_90 ),
    .O(\LSD/Mcount_rTimeCount_cy [16])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<15>  (
    .CI(\LSD/Mcount_rTimeCount_cy [14]),
    .LI(\LSD/Mcount_rTimeCount_cy<15>_rt_88 ),
    .O(\LSD/Result [15])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<15>  (
    .CI(\LSD/Mcount_rTimeCount_cy [14]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<15>_rt_88 ),
    .O(\LSD/Mcount_rTimeCount_cy [15])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<14>  (
    .CI(\LSD/Mcount_rTimeCount_cy [13]),
    .LI(\LSD/Mcount_rTimeCount_cy<14>_rt_86 ),
    .O(\LSD/Result [14])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<14>  (
    .CI(\LSD/Mcount_rTimeCount_cy [13]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<14>_rt_86 ),
    .O(\LSD/Mcount_rTimeCount_cy [14])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<13>  (
    .CI(\LSD/Mcount_rTimeCount_cy [12]),
    .LI(\LSD/Mcount_rTimeCount_cy<13>_rt_84 ),
    .O(\LSD/Result [13])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<13>  (
    .CI(\LSD/Mcount_rTimeCount_cy [12]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<13>_rt_84 ),
    .O(\LSD/Mcount_rTimeCount_cy [13])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<12>  (
    .CI(\LSD/Mcount_rTimeCount_cy [11]),
    .LI(\LSD/Mcount_rTimeCount_cy<12>_rt_82 ),
    .O(\LSD/Result [12])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<12>  (
    .CI(\LSD/Mcount_rTimeCount_cy [11]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<12>_rt_82 ),
    .O(\LSD/Mcount_rTimeCount_cy [12])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<11>  (
    .CI(\LSD/Mcount_rTimeCount_cy [10]),
    .LI(\LSD/Mcount_rTimeCount_cy<11>_rt_80 ),
    .O(\LSD/Result [11])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<11>  (
    .CI(\LSD/Mcount_rTimeCount_cy [10]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<11>_rt_80 ),
    .O(\LSD/Mcount_rTimeCount_cy [11])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<10>  (
    .CI(\LSD/Mcount_rTimeCount_cy [9]),
    .LI(\LSD/Mcount_rTimeCount_cy<10>_rt_78 ),
    .O(\LSD/Result [10])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<10>  (
    .CI(\LSD/Mcount_rTimeCount_cy [9]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<10>_rt_78 ),
    .O(\LSD/Mcount_rTimeCount_cy [10])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<9>  (
    .CI(\LSD/Mcount_rTimeCount_cy [8]),
    .LI(\LSD/Mcount_rTimeCount_cy<9>_rt_136 ),
    .O(\LSD/Result [9])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<9>  (
    .CI(\LSD/Mcount_rTimeCount_cy [8]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<9>_rt_136 ),
    .O(\LSD/Mcount_rTimeCount_cy [9])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<8>  (
    .CI(\LSD/Mcount_rTimeCount_cy [7]),
    .LI(\LSD/Mcount_rTimeCount_cy<8>_rt_134 ),
    .O(\LSD/Result [8])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<8>  (
    .CI(\LSD/Mcount_rTimeCount_cy [7]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<8>_rt_134 ),
    .O(\LSD/Mcount_rTimeCount_cy [8])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<7>  (
    .CI(\LSD/Mcount_rTimeCount_cy [6]),
    .LI(\LSD/Mcount_rTimeCount_cy<7>_rt_132 ),
    .O(\LSD/Result [7])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<7>  (
    .CI(\LSD/Mcount_rTimeCount_cy [6]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<7>_rt_132 ),
    .O(\LSD/Mcount_rTimeCount_cy [7])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<6>  (
    .CI(\LSD/Mcount_rTimeCount_cy [5]),
    .LI(\LSD/Mcount_rTimeCount_cy<6>_rt_130 ),
    .O(\LSD/Result [6])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<6>  (
    .CI(\LSD/Mcount_rTimeCount_cy [5]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<6>_rt_130 ),
    .O(\LSD/Mcount_rTimeCount_cy [6])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<5>  (
    .CI(\LSD/Mcount_rTimeCount_cy [4]),
    .LI(\LSD/Mcount_rTimeCount_cy<5>_rt_128 ),
    .O(\LSD/Result [5])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<5>  (
    .CI(\LSD/Mcount_rTimeCount_cy [4]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<5>_rt_128 ),
    .O(\LSD/Mcount_rTimeCount_cy [5])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<4>  (
    .CI(\LSD/Mcount_rTimeCount_cy [3]),
    .LI(\LSD/Mcount_rTimeCount_cy<4>_rt_126 ),
    .O(\LSD/Result [4])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<4>  (
    .CI(\LSD/Mcount_rTimeCount_cy [3]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<4>_rt_126 ),
    .O(\LSD/Mcount_rTimeCount_cy [4])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<3>  (
    .CI(\LSD/Mcount_rTimeCount_cy [2]),
    .LI(\LSD/Mcount_rTimeCount_cy<3>_rt_124 ),
    .O(\LSD/Result [3])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<3>  (
    .CI(\LSD/Mcount_rTimeCount_cy [2]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<3>_rt_124 ),
    .O(\LSD/Mcount_rTimeCount_cy [3])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<2>  (
    .CI(\LSD/Mcount_rTimeCount_cy [1]),
    .LI(\LSD/Mcount_rTimeCount_cy<2>_rt_120 ),
    .O(\LSD/Result [2])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<2>  (
    .CI(\LSD/Mcount_rTimeCount_cy [1]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<2>_rt_120 ),
    .O(\LSD/Mcount_rTimeCount_cy [2])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<1>  (
    .CI(\LSD/Mcount_rTimeCount_cy [0]),
    .LI(\LSD/Mcount_rTimeCount_cy<1>_rt_98 ),
    .O(\LSD/Result [1])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<1>  (
    .CI(\LSD/Mcount_rTimeCount_cy [0]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcount_rTimeCount_cy<1>_rt_98 ),
    .O(\LSD/Mcount_rTimeCount_cy [1])
  );
  XORCY   \LSD/Mcount_rTimeCount_xor<0>  (
    .CI(oLed_0_OBUF_226),
    .LI(\LSD/Mcount_rTimeCount_lut [0]),
    .O(\LSD/Result [0])
  );
  MUXCY   \LSD/Mcount_rTimeCount_cy<0>  (
    .CI(oLed_0_OBUF_226),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcount_rTimeCount_lut [0]),
    .O(\LSD/Mcount_rTimeCount_cy [0])
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<11>_0  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<10>1 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<11>1_59 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<11>1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<11>1  (
    .I0(\LSD/rTimeCount [28]),
    .I1(\LSD/rTimeCount [29]),
    .I2(\LSD/rTimeCount [30]),
    .I3(\LSD/rTimeCount [31]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<11>1_59 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<10>_0  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<9>1 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<10>1_58 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<10>1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<10>1  (
    .I0(\LSD/rTimeCount [24]),
    .I1(\LSD/rTimeCount [25]),
    .I2(\LSD/rTimeCount [26]),
    .I3(\LSD/rTimeCount [27]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<10>1_58 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<9>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>2 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>2_75 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<9>1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>2  (
    .I0(\LSD/rTimeCount [20]),
    .I1(\LSD/rTimeCount [21]),
    .I2(\LSD/rTimeCount [22]),
    .I3(\LSD/rTimeCount [23]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>2_75 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>_2  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>5 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>_2_rt_54 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>2 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>5 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>4 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>5 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>5 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>5_70 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>5 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>5  (
    .I0(\LSD/rTimeCount [16]),
    .I1(\LSD/rTimeCount [17]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>5_70 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>5 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>4 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>5 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>5 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>5_66 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>5 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>5  (
    .I0(\LSD/rTimeCount [12]),
    .I1(\LSD/rTimeCount [13]),
    .I2(\LSD/rTimeCount [14]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>5_66 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>5 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>5_64 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>5 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>5  (
    .I0(\LSD/rTimeCount [9]),
    .I1(\LSD/rTimeCount [10]),
    .I2(\LSD/rTimeCount [11]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>5_64 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>5 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<2>3_62 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>5 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<2>3  (
    .I0(\LSD/rTimeCount [7]),
    .I1(\LSD/rTimeCount [8]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<2>3_62 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>_4  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>5 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>5 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>5 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>_4  (
    .CI(\InstructionRom/oInstruction_and0000 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>3_57 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>5 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>3  (
    .I0(\LSD/rTimeCount [4]),
    .I1(\LSD/rTimeCount [5]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>3_57 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<9>_0  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>1 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>1_74 ),
    .O(\LSD/rCurrentState_cmp_ge0000 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>1  (
    .I0(\LSD/rTimeCount [28]),
    .I1(\LSD/rTimeCount [29]),
    .I2(\LSD/rTimeCount [30]),
    .I3(\LSD/rTimeCount [31]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<9>1_74 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<8>2_73 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<8>2  (
    .I0(\LSD/rTimeCount [24]),
    .I1(\LSD/rTimeCount [25]),
    .I2(\LSD/rTimeCount [26]),
    .I3(\LSD/rTimeCount [27]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<8>2_73 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>3_71 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<7>4 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>3  (
    .I0(\LSD/rTimeCount [20]),
    .I1(\LSD/rTimeCount [21]),
    .I2(\LSD/rTimeCount [22]),
    .I3(\LSD/rTimeCount [23]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>3_71 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>4_69 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<6>4 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>4  (
    .I0(\LSD/rTimeCount [16]),
    .I1(\LSD/rTimeCount [17]),
    .I2(\LSD/rTimeCount [18]),
    .I3(\LSD/rTimeCount [19]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<6>4_69 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>3_67 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<5>4 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>3  (
    .I0(\LSD/rTimeCount [12]),
    .I1(\LSD/rTimeCount [13]),
    .I2(\LSD/rTimeCount [14]),
    .I3(\LSD/rTimeCount [15]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>3_67 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>4_65 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<4>4 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>4  (
    .I0(\LSD/rTimeCount [8]),
    .I1(\LSD/rTimeCount [9]),
    .I2(\LSD/rTimeCount [10]),
    .I3(\LSD/rTimeCount [11]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<4>4_65 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>4_63 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<3>4 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>4  (
    .I0(\LSD/rTimeCount [4]),
    .I1(\LSD/rTimeCount [5]),
    .I2(\LSD/rTimeCount [6]),
    .I3(\LSD/rTimeCount [7]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<3>4_63 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>4 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>_3_rt_41 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>4 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>_3  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>4 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>4 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<1>4 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>_3  (
    .CI(\InstructionRom/oInstruction_and0000 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>2_56 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<0>4 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>2  (
    .I0(\LSD/rTimeCount [0]),
    .I1(\LSD/rTimeCount [1]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<0>2_56 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<12>  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy [11]),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut [12]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<12>  (
    .I0(\LSD/rTimeCount [30]),
    .I1(\LSD/rTimeCount [31]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut [12])
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<11>  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<10>1 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut [11]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy [11])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<11>  (
    .I0(\LSD/rTimeCount [26]),
    .I1(\LSD/rTimeCount [27]),
    .I2(\LSD/rTimeCount [28]),
    .I3(\LSD/rTimeCount [29]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut [11])
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<10>_0  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<9>1 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<10>1_23 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<10>1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<10>1  (
    .I0(\LSD/rTimeCount [22]),
    .I1(\LSD/rTimeCount [23]),
    .I2(\LSD/rTimeCount [24]),
    .I3(\LSD/rTimeCount [25]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<10>1_23 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<9>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<8>2 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<9>2_32 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<9>1 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<9>2  (
    .I0(\LSD/rTimeCount [18]),
    .I1(\LSD/rTimeCount [19]),
    .I2(\LSD/rTimeCount [20]),
    .I3(\LSD/rTimeCount [21]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<9>2_32 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<8>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<7>2 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<8>2_31 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<8>2 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<8>2  (
    .I0(\LSD/rTimeCount [16]),
    .I1(\LSD/rTimeCount [17]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<8>2_31 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<7>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>2 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<7>2_30 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<7>2 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<7>2  (
    .I0(\LSD/rTimeCount [14]),
    .I1(\LSD/rTimeCount [15]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<7>2_30 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<5>2 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>_1_rt_18 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>2 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<5>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<4>2 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<5>2 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<5>2 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<4>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<3>2 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<4>2_28 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<4>2 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<4>2  (
    .I0(\LSD/rTimeCount [8]),
    .I1(\LSD/rTimeCount [9]),
    .I2(\LSD/rTimeCount [10]),
    .I3(\LSD/rTimeCount [11]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<4>2_28 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<3>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<2>2 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<3>2_27 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<3>2 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<3>2  (
    .I0(\LSD/rTimeCount [6]),
    .I1(\LSD/rTimeCount [7]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<3>2_27 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<2>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>2 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<2>2_26 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<2>2 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<2>2  (
    .I0(\LSD/rTimeCount [4]),
    .I1(\LSD/rTimeCount [5]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<2>2_26 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>_1  (
    .CI(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<0>2 ),
    .DI(\InstructionRom/oInstruction_and0000 ),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>_1_rt_12 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>2 )
  );
  MUXCY   \LSD/Mcompar_rCurrentState_cmp_le0002_cy<0>_1  (
    .CI(\InstructionRom/oInstruction_and0000 ),
    .DI(oLed_0_OBUF_226),
    .S(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<0>2_22 ),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<0>2 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_lut<0>2  (
    .I0(\LSD/rTimeCount [0]),
    .I1(\LSD/rTimeCount [1]),
    .I2(\LSD/rTimeCount [2]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<0>2_22 )
  );
  FDR   \LSD/rTimeCount_31  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [31]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [31])
  );
  FDR   \LSD/rTimeCount_30  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [30]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [30])
  );
  FDR   \LSD/rTimeCount_29  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [29]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [29])
  );
  FDR   \LSD/rTimeCount_28  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [28]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [28])
  );
  FDR   \LSD/rTimeCount_27  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [27]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [27])
  );
  FDR   \LSD/rTimeCount_26  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [26]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [26])
  );
  FDR   \LSD/rTimeCount_25  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [25]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [25])
  );
  FDR   \LSD/rTimeCount_24  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [24]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [24])
  );
  FDR   \LSD/rTimeCount_23  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [23]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [23])
  );
  FDR   \LSD/rTimeCount_22  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [22]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [22])
  );
  FDR   \LSD/rTimeCount_21  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [21]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [21])
  );
  FDR   \LSD/rTimeCount_20  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [20]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [20])
  );
  FDR   \LSD/rTimeCount_19  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [19]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [19])
  );
  FDR   \LSD/rTimeCount_18  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [18]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [18])
  );
  FDR   \LSD/rTimeCount_17  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [17]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [17])
  );
  FDR   \LSD/rTimeCount_16  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [16]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [16])
  );
  FDR   \LSD/rTimeCount_15  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [15]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [15])
  );
  FDR   \LSD/rTimeCount_14  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [14]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [14])
  );
  FDR   \LSD/rTimeCount_13  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [13]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [13])
  );
  FDR   \LSD/rTimeCount_12  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [12]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [12])
  );
  FDR   \LSD/rTimeCount_11  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [11]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [11])
  );
  FDR   \LSD/rTimeCount_10  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [10]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [10])
  );
  FDR   \LSD/rTimeCount_9  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [9]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [9])
  );
  FDR   \LSD/rTimeCount_8  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [8]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [8])
  );
  FDR   \LSD/rTimeCount_7  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [7]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [7])
  );
  FDR   \LSD/rTimeCount_6  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [6]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [6])
  );
  FDR   \LSD/rTimeCount_5  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [5]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [5])
  );
  FDR   \LSD/rTimeCount_4  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [4]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [4])
  );
  FDR   \LSD/rTimeCount_3  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [3]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [3])
  );
  FDR   \LSD/rTimeCount_2  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [2]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [2])
  );
  FDR   \LSD/rTimeCount_1  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [1]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [1])
  );
  FDR   \LSD/rTimeCount_0  (
    .C(Clock_BUFGP_1),
    .D(\LSD/Result [0]),
    .R(\LSD/rTimeCount_or0000_208 ),
    .Q(\LSD/rTimeCount [0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/rCurrentState_FSM_Out21  (
    .I0(\LSD/rCurrentState_FSM_FFd2_173 ),
    .I1(\LSD/rCurrentState_FSM_FFd1_171 ),
    .O(LCD_E_OBUF_4)
  );
  IBUF   Reset_IBUF (
    .I(Reset),
    .O(Reset_IBUF_213)
  );
  OBUF   LCD_E_OBUF (
    .I(LCD_E_OBUF_4),
    .O(LCD_E)
  );
  OBUF   LCD_RS_OBUF (
    .I(oLed_0_OBUF_226),
    .O(LCD_RS)
  );
  OBUF   LCD_RW_OBUF (
    .I(oLed_0_OBUF_226),
    .O(LCD_RW)
  );
  OBUF   No_se_OBUF (
    .I(\InstructionRom/oInstruction_and0000 ),
    .O(No_se)
  );
  OBUF   oLed_7_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[7])
  );
  OBUF   oLed_6_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[6])
  );
  OBUF   oLed_5_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[5])
  );
  OBUF   oLed_4_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[4])
  );
  OBUF   oLed_3_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[3])
  );
  OBUF   oLed_2_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[2])
  );
  OBUF   oLed_1_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[1])
  );
  OBUF   oLed_0_OBUF (
    .I(oLed_0_OBUF_226),
    .O(oLed[0])
  );
  OBUF   SF_D_11_OBUF (
    .I(oLed_0_OBUF_226),
    .O(SF_D[11])
  );
  OBUF   SF_D_10_OBUF (
    .I(oLed_0_OBUF_226),
    .O(SF_D[10])
  );
  OBUF   SF_D_9_OBUF (
    .I(LCD_E_OBUF_4),
    .O(SF_D[9])
  );
  OBUF   SF_D_8_OBUF (
    .I(LCD_E_OBUF_4),
    .O(SF_D[8])
  );
  FDRS   \LSD/rCurrentState_FSM_FFd1  (
    .C(Clock_BUFGP_1),
    .D(\LSD/rCurrentState_FSM_FFd1-In1 ),
    .R(Reset_IBUF_213),
    .S(\LSD/rCurrentState_FSM_FFd1_171 ),
    .Q(\LSD/rCurrentState_FSM_FFd1_171 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<30>_rt  (
    .I0(\LSD/rTimeCount [30]),
    .O(\LSD/Mcount_rTimeCount_cy<30>_rt_122 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<29>_rt  (
    .I0(\LSD/rTimeCount [29]),
    .O(\LSD/Mcount_rTimeCount_cy<29>_rt_118 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<28>_rt  (
    .I0(\LSD/rTimeCount [28]),
    .O(\LSD/Mcount_rTimeCount_cy<28>_rt_116 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<27>_rt  (
    .I0(\LSD/rTimeCount [27]),
    .O(\LSD/Mcount_rTimeCount_cy<27>_rt_114 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<26>_rt  (
    .I0(\LSD/rTimeCount [26]),
    .O(\LSD/Mcount_rTimeCount_cy<26>_rt_112 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<25>_rt  (
    .I0(\LSD/rTimeCount [25]),
    .O(\LSD/Mcount_rTimeCount_cy<25>_rt_110 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<24>_rt  (
    .I0(\LSD/rTimeCount [24]),
    .O(\LSD/Mcount_rTimeCount_cy<24>_rt_108 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<23>_rt  (
    .I0(\LSD/rTimeCount [23]),
    .O(\LSD/Mcount_rTimeCount_cy<23>_rt_106 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<22>_rt  (
    .I0(\LSD/rTimeCount [22]),
    .O(\LSD/Mcount_rTimeCount_cy<22>_rt_104 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<21>_rt  (
    .I0(\LSD/rTimeCount [21]),
    .O(\LSD/Mcount_rTimeCount_cy<21>_rt_102 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<20>_rt  (
    .I0(\LSD/rTimeCount [20]),
    .O(\LSD/Mcount_rTimeCount_cy<20>_rt_100 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<19>_rt  (
    .I0(\LSD/rTimeCount [19]),
    .O(\LSD/Mcount_rTimeCount_cy<19>_rt_96 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<18>_rt  (
    .I0(\LSD/rTimeCount [18]),
    .O(\LSD/Mcount_rTimeCount_cy<18>_rt_94 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<17>_rt  (
    .I0(\LSD/rTimeCount [17]),
    .O(\LSD/Mcount_rTimeCount_cy<17>_rt_92 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<16>_rt  (
    .I0(\LSD/rTimeCount [16]),
    .O(\LSD/Mcount_rTimeCount_cy<16>_rt_90 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<15>_rt  (
    .I0(\LSD/rTimeCount [15]),
    .O(\LSD/Mcount_rTimeCount_cy<15>_rt_88 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<14>_rt  (
    .I0(\LSD/rTimeCount [14]),
    .O(\LSD/Mcount_rTimeCount_cy<14>_rt_86 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<13>_rt  (
    .I0(\LSD/rTimeCount [13]),
    .O(\LSD/Mcount_rTimeCount_cy<13>_rt_84 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<12>_rt  (
    .I0(\LSD/rTimeCount [12]),
    .O(\LSD/Mcount_rTimeCount_cy<12>_rt_82 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<11>_rt  (
    .I0(\LSD/rTimeCount [11]),
    .O(\LSD/Mcount_rTimeCount_cy<11>_rt_80 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<10>_rt  (
    .I0(\LSD/rTimeCount [10]),
    .O(\LSD/Mcount_rTimeCount_cy<10>_rt_78 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<9>_rt  (
    .I0(\LSD/rTimeCount [9]),
    .O(\LSD/Mcount_rTimeCount_cy<9>_rt_136 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<8>_rt  (
    .I0(\LSD/rTimeCount [8]),
    .O(\LSD/Mcount_rTimeCount_cy<8>_rt_134 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<7>_rt  (
    .I0(\LSD/rTimeCount [7]),
    .O(\LSD/Mcount_rTimeCount_cy<7>_rt_132 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<6>_rt  (
    .I0(\LSD/rTimeCount [6]),
    .O(\LSD/Mcount_rTimeCount_cy<6>_rt_130 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<5>_rt  (
    .I0(\LSD/rTimeCount [5]),
    .O(\LSD/Mcount_rTimeCount_cy<5>_rt_128 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<4>_rt  (
    .I0(\LSD/rTimeCount [4]),
    .O(\LSD/Mcount_rTimeCount_cy<4>_rt_126 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<3>_rt  (
    .I0(\LSD/rTimeCount [3]),
    .O(\LSD/Mcount_rTimeCount_cy<3>_rt_124 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<2>_rt  (
    .I0(\LSD/rTimeCount [2]),
    .O(\LSD/Mcount_rTimeCount_cy<2>_rt_120 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_cy<1>_rt  (
    .I0(\LSD/rTimeCount [1]),
    .O(\LSD/Mcount_rTimeCount_cy<1>_rt_98 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>_2_rt  (
    .I0(\LSD/rTimeCount [19]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<8>_2_rt_54 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>_3_rt  (
    .I0(\LSD/rTimeCount [3]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<2>_3_rt_41 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>_1_rt  (
    .I0(\LSD/rTimeCount [13]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<6>_1_rt_18 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>_1_rt  (
    .I0(\LSD/rTimeCount [3]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_cy<1>_1_rt_12 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \LSD/Mcount_rTimeCount_xor<31>_rt  (
    .I0(\LSD/rTimeCount [31]),
    .O(\LSD/Mcount_rTimeCount_xor<31>_rt_138 )
  );
  LUT4 #(
    .INIT ( 16'h27FF ))
  \LSD/rCurrentState_FSM_FFd2-In1  (
    .I0(\LSD/rCurrentState_FSM_FFd2_173 ),
    .I1(\LSD/rCurrentState_cmp_ge0000 ),
    .I2(\LSD/Mcompar_rCurrentState_cmp_le0002_cy [12]),
    .I3(\LSD/rCurrentState_FSM_FFd1_171 ),
    .O(\LSD/rCurrentState_FSM_FFd2-In )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \LSD/rCurrentState_FSM_FFd1-In11  (
    .I0(\LSD/rCurrentState_FSM_FFd2_173 ),
    .I1(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<11>1 ),
    .O(\LSD/rCurrentState_FSM_FFd1-In1 )
  );
  MUXF5   \LSD/rTimeCount_or0000  (
    .I0(N17),
    .I1(N18),
    .S(\LSD/rCurrentState_FSM_FFd1_171 ),
    .O(\LSD/rTimeCount_or0000_208 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \LSD/rTimeCount_or0000_F  (
    .I0(\LSD/Mcompar_rCurrentState_cmp_lt0003_cy<11>1 ),
    .I1(\LSD/rCurrentState_FSM_FFd2_173 ),
    .I2(Reset_IBUF_213),
    .O(N17)
  );
  LUT4 #(
    .INIT ( 16'hFBAB ))
  \LSD/rTimeCount_or0000_G  (
    .I0(Reset_IBUF_213),
    .I1(\LSD/Mcompar_rCurrentState_cmp_le0002_cy [12]),
    .I2(\LSD/rCurrentState_FSM_FFd2_173 ),
    .I3(\LSD/rCurrentState_cmp_ge0000 ),
    .O(N18)
  );
  BUFGP   Clock_BUFGP (
    .I(Clock),
    .O(Clock_BUFGP_1)
  );
  INV   \LSD/Mcount_rTimeCount_lut<0>_INV_0  (
    .I(\LSD/rTimeCount [0]),
    .O(\LSD/Mcount_rTimeCount_lut [0])
  );
  INV   \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>4_INV_0  (
    .I(\LSD/rTimeCount [18]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<7>4 )
  );
  INV   \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>4_INV_0  (
    .I(\LSD/rTimeCount [15]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<5>4 )
  );
  INV   \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>5_INV_0  (
    .I(\LSD/rTimeCount [6]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>5 )
  );
  INV   \LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>4_INV_0  (
    .I(\LSD/rTimeCount [2]),
    .O(\LSD/Mcompar_rCurrentState_cmp_lt0003_lut<1>4 )
  );
  INV   \LSD/Mcompar_rCurrentState_cmp_le0002_lut<5>2_INV_0  (
    .I(\LSD/rTimeCount [12]),
    .O(\LSD/Mcompar_rCurrentState_cmp_le0002_lut<5>2 )
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

