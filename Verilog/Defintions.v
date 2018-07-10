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
`define PUSH  6'd10
`define POP   6'd11
`define CALL  6'd12
`define RET   6'd13
`define VGA   6'd14 // 1101
`define ADDI  6'd15
`define BEQ   6'd16
`define AND   6'd17
`define OR    6'd18
`define NOR   6'd19
`define SLL   6'd20 // shift logical left
`define SLR   6'd21 // shift logical right


`define R0 10'd0 // 00000000
`define R1 10'd1 // 00000001
`define R2 10'd2 // 00000010
`define R3 10'd3 // 00000011
`define R4 10'd4 // 00000100
`define R5 10'd5 // 00000101
`define R6 10'd6 // 00000110
`define R7 10'd7 // 00000111
`define R8 10'd8
`define R9 10'd9
`define R10 10'd10
`define R11 10'd11
`define R12 10'd12
`define R13 10'd13
`define R14 10'd14
`define R15 10'd15
`define R16 10'd16
`define R17 10'd17
`define R18 10'd18
`define R19 10'd19
`define R20 10'd20 //posicion x jugador
`define R21 10'd21 //posicion y jugador
`define R22 10'd22 //tecla que se presiona
`define R23 10'd23
`define R24 10'd24
`define R25 10'd25

`define T1 10'd54
`define T2 10'd55
`define T3 10'd56
`define T4 10'd57
`define T5 10'd58
`define T6 10'd59
`define T7 10'd60
`define T8 10'd61
`define T9 10'd62

`define RA 10'd63

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
`define COLOR_BLACK 10'b000
`define COLOR_WHITE 10'b111

`define COLOR_RED 10'b100
`define COLOR_GREEN 10'b010
`define COLOR_BLUE 10'b001

`define COLOR_MAGENTA 10'b101
`define COLOR_YELLOW 10'b110
`define COLOR_CYAN 10'b011

`endif
