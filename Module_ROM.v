`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define GAME 8'd8
`define FIN 8'd17
`define WAIT 8'd18
`define WAIT1 8'd24
`define WAIT2 8'd26
`define DIA 8'd36
`define LOOPVERTICAL 8'd39
`define LOOPHORIZONTAL 8'd40
`define REGRESOLOOPHORIZONTAL 8'd44
`define REGRESOLOOPVERTICAL 8'd48
`define RETURNGAME 8'd51
`define SOL 8'd54
`define NOCHE 8'd63
`define LOOPVERTICAL2 8'd66
`define LOOPHORIZONTAL2 8'd67
`define REGRESOLOOPHORIZONTAL2 8'd71
`define REGRESOLOOPVERTICAL2 8'd75
`define LUNA 8'd78
`define DISPLAY 8'd87

module ROM
(
  input  wire[15:0] iAddress,
  output reg [29:0] oInstruction
);
always @ (iAddress)
begin
  case (iAddress)
  0: oInstruction = {`NOP,24'd4000};
  1: oInstruction = {`STO,`R0,16'b0};
  2: oInstruction = {`STO,`R1,16'b1};
// INICIO:
  3: oInstruction = {`STO,`R11,16'b0};
  4: oInstruction = {`STO,`R12,16'b0};
  5: oInstruction = {`STO,`R13,16'd16};
  6: oInstruction = {`STO,`R14,16'd12};
  7: oInstruction = {`STO,`R3,16'd5};
// GAME:
  8: oInstruction = {`CALL,`DIA,16'b0};
  9: oInstruction = {`CALL,`SOL,16'b0};
  10: oInstruction = {`STO,`R5,16'b0};
  11: oInstruction = {`STO,`R4,16'd100};
  12: oInstruction = {`CALL,`WAIT,16'b0};
  13: oInstruction = {`CALL,`NOCHE,16'b0};
  14: oInstruction = {`CALL,`LUNA,16'b0};
  15: oInstruction = {`CALL,`WAIT,16'b0};
  16: oInstruction = {`JMP,`GAME,16'b0};
// FIN:
  17: oInstruction = {`JMP,`FIN,16'b0};
// WAIT:
  18: oInstruction = {`NOP,24'b0};
  19: oInstruction = {`PUSH,16'b0,`RA};
  20: oInstruction = {`PUSH,16'b0,`R2};
  21: oInstruction = {`PUSH,16'b0,`R3};
  22: oInstruction = {`NOP,24'b0};
  23: oInstruction = {`STO,`R3,16'b0};
// WAIT1:
  24: oInstruction = {`STO,`R2,16'b0};
  25: oInstruction = {`NOP,24'b0};
// WAIT2:
  26: oInstruction = {`ADD,`R2,`R2,`R1};
  27: oInstruction = {`BLE,`WAIT2,`R2,`R4};
  28: oInstruction = {`ADD,`R3,`R3,`R1};
  29: oInstruction = {`BLE,`WAIT1,`R3,`R4};
  30: oInstruction = {`NOP,24'b0};
  31: oInstruction = {`POP,`R2,16'b0};
  32: oInstruction = {`POP,`R3,16'b0};
  33: oInstruction = {`POP,`RA,16'b0};
  34: oInstruction = {`NOP,24'b0};
  35: oInstruction = {`RET,16'b0,`RA};
// DIA:
  36: oInstruction = {`NOP,24'd0};
  37: oInstruction = {`PUSH,16'b0,`RA};
  38: oInstruction = {`STO,`R12,16'b0};
// LOOPVERTICAL:
  39: oInstruction = {`STO,`R11,16'b0};
// LOOPHORIZONTAL:
  40: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  41: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL,`R12,`R3};
  42: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  43: oInstruction = {`JMP,`REGRESOLOOPHORIZONTAL,16'b0};
// REGRESOLOOPHORIZONTAL:
  44: oInstruction = {`BLE,`REGRESOLOOPVERTICAL,`R13,`R11};
  45: oInstruction = {`CALL,`DISPLAY,16'b0};
  46: oInstruction = {`ADD,`R11,`R11,`R1};
  47: oInstruction = {`JMP,`LOOPHORIZONTAL,16'b0};
// REGRESOLOOPVERTICAL:
  48: oInstruction = {`BLE,`RETURNGAME,`R14,`R12};
  49: oInstruction = {`ADD,`R12,`R12,`R1};
  50: oInstruction = {`JMP,`LOOPVERTICAL,16'b0};
// RETURNGAME:
  51: oInstruction = {`POP,`RA,16'b0};
  52: oInstruction = {`NOP,24'd0};
  53: oInstruction = {`RET,16'b0,`RA};
// SOL:
  54: oInstruction = {`NOP,24'd0};
  55: oInstruction = {`PUSH,16'b0,`RA};
  56: oInstruction = {`STO,`R11,16'd14};
  57: oInstruction = {`STO,`R12,16'b1};
  58: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  59: oInstruction = {`CALL,`DISPLAY,16'b0};
  60: oInstruction = {`POP,`RA,16'b0};
  61: oInstruction = {`NOP,24'd0};
  62: oInstruction = {`RET,16'b0,`RA};
// NOCHE:
  63: oInstruction = {`NOP,24'd0};
  64: oInstruction = {`PUSH,16'b0,`RA};
  65: oInstruction = {`STO,`R12,16'b0};
// LOOPVERTICAL2:
  66: oInstruction = {`STO,`R11,16'b0};
// LOOPHORIZONTAL2:
  67: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  68: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL2,`R12,`R3};
  69: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  70: oInstruction = {`JMP,`REGRESOLOOPHORIZONTAL2,16'b0};
// REGRESOLOOPHORIZONTAL2:
  71: oInstruction = {`BLE,`REGRESOLOOPVERTICAL2,`R13,`R11};
  72: oInstruction = {`CALL,`DISPLAY,16'b0};
  73: oInstruction = {`ADD,`R11,`R11,`R1};
  74: oInstruction = {`JMP,`LOOPHORIZONTAL2,16'b0};
// REGRESOLOOPVERTICAL2:
  75: oInstruction = {`BLE,`RETURNGAME,`R14,`R12};
  76: oInstruction = {`ADD,`R12,`R12,`R1};
  77: oInstruction = {`JMP,`LOOPVERTICAL2,16'b0};
// LUNA:
  78: oInstruction = {`NOP,24'd0};
  79: oInstruction = {`PUSH,16'b0,`RA};
  80: oInstruction = {`STO,`R11,16'd14};
  81: oInstruction = {`STO,`R12,16'b1};
  82: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  83: oInstruction = {`CALL,`DISPLAY,16'b0};
  84: oInstruction = {`POP,`RA,16'b0};
  85: oInstruction = {`NOP,24'd0};
  86: oInstruction = {`RET,16'b0,`RA};
// DISPLAY:
  87: oInstruction = {`NOP,24'b0};
  88: oInstruction = {`PUSH,16'b0,`RA};
  89: oInstruction = {`PUSH,16'b0,`R2};
  90: oInstruction = {`NOP,24'b0};
  91: oInstruction = {`MUL,`R2,`R12,`R13};
  92: oInstruction = {`NOP,24'b0};
  93: oInstruction = {`ADD,`R2,`R2,`R11};
  94: oInstruction = {`NOP,24'b0};
  95: oInstruction = {`VGA,8'b0,`R10,`R2};
  96: oInstruction = {`POP,`R2,16'b0};
  97: oInstruction = {`POP,`RA,16'b0};
  98: oInstruction = {`NOP,24'b0};
  99: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
