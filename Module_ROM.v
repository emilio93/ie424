`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define LOOPVERTICAL 8'd14
`define LOOPHORIZONTAL 8'd15
`define REGRESOLOOPHORIZONTAL1 8'd27
`define Continue1 8'd42
`define REGRESOLOOPHORIZONTAL2 8'd45
`define Continue2 8'd60
`define REGRESOLOOPVERTICAL 8'd63
`define FIN 8'd66
`define DISPLAY 8'd68


module ROM
(
  input  wire[15:0] iAddress,
  output reg [27:0] oInstruction
);
always @ (iAddress)
begin
  case (iAddress)
  0: oInstruction = {`NOP,24'd4000};
  1: oInstruction = {`STO,`R0,16'b0};
  2: oInstruction = {`STO,`R1,16'b1};
// INICIO:
  3: oInstruction = {`STO,`R11,16'b0}; //contador horizontal
  4: oInstruction = {`STO,`R12,16'b0}; //contador vertical
  5: oInstruction = {`STO,`R13,16'd16}; //límite horizontal
  6: oInstruction = {`STO,`R14,16'd12}; //límite vertical
  7: oInstruction = {`STO,`R3,16'd1};
  8: oInstruction = {`STO,`R4,16'd3};
  9: oInstruction = {`STO,`R5,16'd5};
  10: oInstruction = {`STO,`R6,16'd7};
  11: oInstruction = {`STO,`R7,16'd9};
  12: oInstruction = {`STO,`R8,16'd11};
  13: oInstruction = {`STO,`R9,16'd13};
// LOOPVERTICAL:
  14: oInstruction = {`STO,`R11,16'b0};
// LOOPHORIZONTAL:
  15: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  16: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL1,`R12,`R3};
  17: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  18: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL2,`R12,`R4};
  19: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  20: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL1,`R12,`R5};
  21: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  22: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL2,`R12,`R6};
  23: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  24: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL1,`R12,`R7};
  25: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  26: oInstruction = {`JMP,`REGRESOLOOPHORIZONTAL2,16'b0};
// REGRESOLOOPHORIZONTAL1:
  27: oInstruction = {`BLE,`REGRESOLOOPVERTICAL,`R13,`R11};
  28: oInstruction = {`BLE,`Continue1,`R11,`R3};
  29: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  30: oInstruction = {`BLE,`Continue1,`R11,`R4};
  31: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  32: oInstruction = {`BLE,`Continue1,`R11,`R5};
  33: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  34: oInstruction = {`BLE,`Continue1,`R11,`R6};
  35: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  36: oInstruction = {`BLE,`Continue1,`R11,`R7};
  37: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  38: oInstruction = {`BLE,`Continue1,`R11,`R8};
  39: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  40: oInstruction = {`BLE,`Continue1,`R11,`R9};
  41: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  //Continue1
  42: oInstruction = {`CALL,`DISPLAY,16'b0};
  43: oInstruction = {`ADD,`R11,`R11,`R1};
  44: oInstruction = {`JMP,`LOOPHORIZONTAL,16'b0};
  // REGRESOLOOPHORIZONTAL2:
  45: oInstruction = {`BLE,`REGRESOLOOPVERTICAL,`R13,`R11};
  46: oInstruction = {`BLE,`Continue2,`R11,`R3};
  47: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  48: oInstruction = {`BLE,`Continue2,`R11,`R4};
  49: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  50: oInstruction = {`BLE,`Continue2,`R11,`R5};
  51: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  52: oInstruction = {`BLE,`Continue2,`R11,`R6};
  53: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  54: oInstruction = {`BLE,`Continue2,`R11,`R7};
  55: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  56: oInstruction = {`BLE,`Continue2,`R11,`R8};
  57: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  58: oInstruction = {`BLE,`Continue2,`R11,`R9};
  59: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  //Continue2
  60: oInstruction = {`CALL,`DISPLAY,16'b0};
  61: oInstruction = {`ADD,`R11,`R11,`R1};
  62: oInstruction = {`JMP,`LOOPHORIZONTAL,16'b0};
// REGRESOLOOPVERTICAL:
  63: oInstruction = {`BLE,`FIN,`R14,`R12};
  64: oInstruction = {`ADD,`R12,`R12,`R1};
  65: oInstruction = {`JMP,`LOOPVERTICAL,16'b0};
// FIN:
  66: oInstruction = {`TEC,`R7,`R7,1'b0};	 
  67: oInstruction = {`JMP,`FIN,16'b0};
// DISPLAY:
  68: oInstruction = {`NOP,24'b0};
  69: oInstruction = {`PUSH,16'b0,`RA};
  70: oInstruction = {`PUSH,16'b0,`R2};
  71: oInstruction = {`NOP,24'b0};
  72: oInstruction = {`MUL,`R2,`R12,`R13};
  73: oInstruction = {`NOP,24'b0};
  74: oInstruction = {`ADD,`R2,`R2,`R11};
  75: oInstruction = {`NOP,24'b0};
  76: oInstruction = {`VGA,8'b0,`R10,`R2};
  77: oInstruction = {`POP,`R2,16'b0};
  78: oInstruction = {`POP,`RA,16'b0};
  79: oInstruction = {`NOP,24'b0};
  80: oInstruction = {`RET,16'b0,`RA};
  81: oInstruction = {`TEC,`R7,`R7,1'b0};
  82: oInstruction = {`LED ,8'b0,`R7,8'b0};
  83: oInstruction = {`JMP,8'd41,16'b0};  

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
