`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define GAME 8'd10
`define WAIT1 8'd13
`define WAIT2 8'd14
`define CONTINUE 8'd18
`define FIN 8'd19
`define DIA 8'd20
`define LOOPVERTICAL 8'd23
`define LOOPHORIZONTAL 8'd24
`define REGRESOLOOPHORIZONTAL 8'd28
`define REGRESOLOOPVERTICAL 8'd32
`define SOL 8'd35
`define NOCHE 8'd43
`define LOOPVERTICAL2 8'd46
`define LOOPHORIZONTAL2 8'd47
`define REGRESOLOOPHORIZONTAL2 8'd51
`define REGRESOLOOPVERTICAL2 8'd55
`define LUNA 8'd58
`define DISPLAY 8'd66

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
  3: oInstruction = {`STO,`R11,16'b0};
  4: oInstruction = {`STO,`R12,16'b0};
  5: oInstruction = {`STO,`R13,16'd16};
  6: oInstruction = {`STO,`R14,16'd12};
  7: oInstruction = {`STO,`R3,16'd5};
  8: oInstruction = {`STO,`R4,16'd5};
  9: oInstruction = {`STO,`R5,16'd8};
// GAME:
  10: oInstruction = {`CALL,`DIA,16'b0};
  11: oInstruction = {`STO,`R3,16'b0};
  12: oInstruction = {`STO,`R4,16'd25000};
// WAIT1:
  13: oInstruction = {`STO,`R2,1'b0};
// WAIT2:
  14: oInstruction = {`ADD,`R2,`R2,`R1};
  15: oInstruction = {`BLE,`WAIT2,`R2,`R4};
  16: oInstruction = {`ADD,`R3,`R3,`R1};
  17: oInstruction = {`BLE,`WAIT1,`R2,`R4};
// CONTINUE:
  18: oInstruction = {`CALL,`NOCHE,15'b0};
// FIN:
  19: oInstruction = {`JMP,`FIN,16'b0};
// DIA:
  20: oInstruction = {`NOP,24'd0};
  21: oInstruction = {`PUSH,16'b0,`RA};
  22: oInstruction = {`STO,`R12,16'b0};
// LOOPVERTICAL:
  23: oInstruction = {`STO,`R11,16'b0};
// LOOPHORIZONTAL:
  24: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  25: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL,`R12,`R3};
  26: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  27: oInstruction = {`JMP,`REGRESOLOOPHORIZONTAL,16'b0};
// REGRESOLOOPHORIZONTAL:
  28: oInstruction = {`BLE,`REGRESOLOOPVERTICAL,`R13,`R11};
  29: oInstruction = {`CALL,`DISPLAY,16'b0};
  30: oInstruction = {`ADD,`R11,`R11,`R1};
  31: oInstruction = {`JMP,`LOOPHORIZONTAL,16'b0};
// REGRESOLOOPVERTICAL:
  32: oInstruction = {`BLE,`SOL,`R14,`R12};
  33: oInstruction = {`ADD,`R12,`R12,`R1};
  34: oInstruction = {`JMP,`LOOPVERTICAL,16'b0};
// SOL:
  35: oInstruction = {`NOP,24'd0};
  36: oInstruction = {`STO,`R11,16'd14};
  37: oInstruction = {`STO,`R12,16'b1};
  38: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  39: oInstruction = {`CALL,`DISPLAY,16'b0};
  40: oInstruction = {`POP,`RA,16'b0};
  41: oInstruction = {`NOP,24'd0};
  42: oInstruction = {`RET,16'b0,`RA};
// NOCHE:
  43: oInstruction = {`NOP,24'd0};
  44: oInstruction = {`PUSH,16'b0,`RA};
  45: oInstruction = {`STO,`R12,16'b0};
// LOOPVERTICAL2:
  46: oInstruction = {`STO,`R11,16'b0};
// LOOPHORIZONTAL2:
  47: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  48: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL2,`R12,`R3};
  49: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  50: oInstruction = {`JMP,`REGRESOLOOPHORIZONTAL2,16'b0};
// REGRESOLOOPHORIZONTAL2:
  51: oInstruction = {`BLE,`REGRESOLOOPVERTICAL2,`R13,`R11};
  52: oInstruction = {`CALL,`DISPLAY,16'b0};
  53: oInstruction = {`ADD,`R11,`R11,`R1};
  54: oInstruction = {`JMP,`LOOPHORIZONTAL2,16'b0};
// REGRESOLOOPVERTICAL2:
  55: oInstruction = {`BLE,`LUNA,`R14,`R12};
  56: oInstruction = {`ADD,`R12,`R12,`R1};
  57: oInstruction = {`JMP,`LOOPVERTICAL2,16'b0};
// LUNA:
  58: oInstruction = {`NOP,24'd0};
  59: oInstruction = {`STO,`R11,16'd14};
  60: oInstruction = {`STO,`R12,16'b1};
  61: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  62: oInstruction = {`CALL,`DISPLAY,16'b0};
  63: oInstruction = {`POP,`RA,16'b0};
  64: oInstruction = {`NOP,24'd0};
  65: oInstruction = {`RET,16'b0,`RA};
// DISPLAY:
  66: oInstruction = {`NOP,24'b0};
  67: oInstruction = {`PUSH,16'b0,`RA};
  68: oInstruction = {`PUSH,16'b0,`R2};
  69: oInstruction = {`NOP,24'b0};
  70: oInstruction = {`MUL,`R2,`R12,`R13};
  71: oInstruction = {`NOP,24'b0};
  72: oInstruction = {`ADD,`R2,`R2,`R11};
  73: oInstruction = {`NOP,24'b0};
  74: oInstruction = {`VGA,8'b0,`R10,`R2};
  75: oInstruction = {`POP,`R2,16'b0};
  76: oInstruction = {`POP,`RA,16'b0};
  77: oInstruction = {`NOP,24'b0};
  78: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
