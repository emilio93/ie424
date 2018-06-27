`timescale 1ns / 1ps
`ifndef DEFINTIONS_V
`define DEFINTIONS_V

`default_nettype none
`define NOP   6'd0 // 0000
`define TEC   6'd1
`define LED   6'd2 // 0010
`define BLE   6'd3 // 0011
`define STO   6'd4 // 0100
`define ADD   6'd5 // 0101
`define JMP   6'd6 // 0110
`define SUB   6'd7 // 0111
`define LCD   6'd8 // 1000
`define MUL   6'd9
`define PUSH   6'd10
`define POP   6'd11
`define CALL  6'd12
`define RET   6'd13
`define VGA   6'd14 // 1101
`define ADDI   6'd15
`define BEQ 6'd16
`define AND 6'd17
`define OR 6'd18
`define NOR 6'd19


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
`define R16 8'd16
`define R17 8'd17
`define R18 8'd18
`define R19 8'd19
`define R20 8'd20
`define R21 8'd21



`define RA 8'h1F

// LETRAS LCD
`define H 16'h48
`define O 16'h4F
`define L 16'h4C
`define A 16'h41
`define ESPACIO 16'h20
`define M 16'h4D
`define U 16'h55
`define N 16'h4E
`define D 16'h44

// COLORES VGA
`define COLOR_BLACK 8'b000
`define COLOR_WHITE 8'b111

`define COLOR_RED 8'b100
`define COLOR_GREEN 8'b010
`define COLOR_BLUE 8'b001

`define COLOR_MAGENTA 8'b101
`define COLOR_YELLOW 8'b110
`define COLOR_CYAN 8'b011

`endif
