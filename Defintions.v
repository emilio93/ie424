`timescale 1ns / 1ps
`ifndef DEFINTIONS_V
`define DEFINTIONS_V

`default_nettype none
`define NOP   4'd0 // 0000
`define LED   4'd2 // 0010
`define BLE   4'd3 // 0011
`define STO   4'd4 // 0100
`define ADD   4'd5 // 0101
`define JMP   4'd6 // 0110
`define SUB   4'd7 // 0111
`define LCD   4'd8 // 1000
`define MUL   4'd9
`define PUSH   4'd10
`define POP   4'd11
`define CALL  4'd12
`define RET   4'd13

`define SW   4'd14
`define LW   4'd15

`define R0 8'd0 // 00000000
`define R1 8'd1 // 00000001
`define R2 8'd2 // 00000010
`define R3 8'd3 // 00000011
`define R4 8'd4 // 00000100
`define R5 8'd5 // 00000101
`define R6 8'd6 // 00000110
`define R7 8'd7 // 00000111
`define R8 8'd8
`define R9 8'd9
`define R10 8'd10
`define R11 8'd11
`define R12 8'd12
`define R13 8'd13
`define R14 8'd14
`define R15 8'd15


`define H 16'b0000000001001000
`define O 16'h8F
`define L 16'h8C
`define A 16'h81
`define ESPACIO 16'h00
`define M 16'h8D
`define U 16'h95
`define N 16'h8E
`define D 16'h84

`define RA 8'h1F

`endif
