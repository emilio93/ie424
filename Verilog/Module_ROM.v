`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define DISPLAY 8'd9
`define FONDO 8'd22
`define MOVIMIENTO 8'd38
`define SUBIR_MOVIMIENTO 8'd45
`define BAJAR_MOVIMIENTO 8'd48
`define TERMINAR_MOVIMIENTO 8'd51
`define PINTAR_JUGADOR 8'd54
`define PINTAR_LUNA 8'd71
`define PINTAR_RECTANGULO 8'd96
`define LOOP_VERTICAL_PINTAR_RECTANGULO 8'd101
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 8'd102
`define PINTAR_SOL 8'd111
`define PONER_CIELO_DIA 8'd131
`define PONER_CIELO_NOCHE 8'd146
`define PONER_ZACATE 8'd162

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
  3: oInstruction = {`NOP,24'b0};
  4: oInstruction = {`NOP,24'b0};
  5: oInstruction = {`CALL,`MOVIMIENTO};
  6: oInstruction = {`CALL,`FONDO};
  7: oInstruction = {`CALL,`PINTAR_JUGADOR};
  8: oInstruction = {`JMP,`INICIO};
// DISPLAY:
  9: oInstruction = {`NOP,24'b0};
  10: oInstruction = {`PUSH,16'b0,`RA};
  11: oInstruction = {`PUSH,16'b0,`R2};
  12: oInstruction = {`NOP,24'b0};
  13: oInstruction = {`MUL,`R2,`R12,`R13};
  14: oInstruction = {`NOP,24'b0};
  15: oInstruction = {`ADD,`R2,`R2,`R11};
  16: oInstruction = {`NOP,24'b0};
  17: oInstruction = {`VGA,8'b0,`R10,`R2};
  18: oInstruction = {`POP,`R2,16'b0};
  19: oInstruction = {`POP,`RA,16'b0};
  20: oInstruction = {`NOP,24'b0};
  21: oInstruction = {`RET,16'b0,`RA};
// FONDO:
  22: oInstruction = {`NOP,24'b0};
  23: oInstruction = {`PUSH,16'b0,`RA};
  24: oInstruction = {`PUSH,16'b0,`R13};
  25: oInstruction = {`PUSH,16'b0,`R14};
  26: oInstruction = {`STO,`R11,16'b0};
  27: oInstruction = {`STO,`R12,16'b0};
  28: oInstruction = {`STO,`R13,16'd40};
  29: oInstruction = {`STO,`R14,16'd30};
  30: oInstruction = {`CALL,`PONER_CIELO_DIA,16'b0};
  31: oInstruction = {`CALL,`PONER_ZACATE,16'b0};
  32: oInstruction = {`CALL,`PINTAR_SOL,16'b0};
  33: oInstruction = {`POP,`R14,16'b0};
  34: oInstruction = {`POP,`R13,16'b0};
  35: oInstruction = {`POP,`RA,16'b0};
  36: oInstruction = {`NOP,24'b0};
  37: oInstruction = {`RET,`RA,16'b0};
// MOVIMIENTO:
  38: oInstruction = {`NOP,24'b0};
  39: oInstruction = {`PUSH,16'b0,`RA};
  40: oInstruction = {`STO,`T1,16'h1D};
  41: oInstruction = {`STO,`T2,16'h1B};
  42: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  43: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  44: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,16'b0};
// SUBIR_MOVIMIENTO:
  45: oInstruction = {`SUB,`R20,`R20,`R1};
  46: oInstruction = {`SUB,`R21,`R21,`R1};
  47: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// BAJAR_MOVIMIENTO:
  48: oInstruction = {`ADD,`R20,`R20,`R1};
  49: oInstruction = {`ADD,`R21,`R21,`R1};
  50: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// TERMINAR_MOVIMIENTO:
  51: oInstruction = {`POP,`RA,16'b0};
  52: oInstruction = {`NOP,24'b0};
  53: oInstruction = {`RET,16'b0,`RA};
// PINTAR_JUGADOR:
  54: oInstruction = {`NOP,24'b0};
  55: oInstruction = {`PUSH,16'b0,`RA};
  56: oInstruction = {`PUSH,16'b0,`R18};
  57: oInstruction = {`PUSH,16'b0,`R19};
  58: oInstruction = {`STO,`R10,8'b0,`COLOR_MAGENTA};
  59: oInstruction = {`STO,`R18,16'd2};
  60: oInstruction = {`STO,`R19,16'd5};
  61: oInstruction = {`ADD,`R11,`R20,`R0};
  62: oInstruction = {`ADD,`R12,`R21,`R0};
  63: oInstruction = {`ADD,`R15,`R20,`R18};
  64: oInstruction = {`ADD,`R16,`R21,`R19};
  65: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  66: oInstruction = {`POP,`R19,16'b0};
  67: oInstruction = {`POP,`R18,16'b0};
  68: oInstruction = {`POP,`RA,16'b0};
  69: oInstruction = {`NOP,24'b0};
  70: oInstruction = {`RET,16'b0,`RA};
// PINTAR_LUNA:
  71: oInstruction = {`NOP,24'b0};
  72: oInstruction = {`PUSH,16'b0,`RA};
  73: oInstruction = {`PUSH,16'b0,`R15};
  74: oInstruction = {`PUSH,16'b0,`R16};
  75: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  76: oInstruction = {`STO,`R11,16'd33};
  77: oInstruction = {`STO,`R12,16'd3};
  78: oInstruction = {`STO,`R15,16'd34};
  79: oInstruction = {`STO,`R16,16'd3};
  80: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  81: oInstruction = {`STO,`R11,16'd34};
  82: oInstruction = {`STO,`R12,16'd4};
  83: oInstruction = {`STO,`R15,16'd35};
  84: oInstruction = {`STO,`R16,16'd5};
  85: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  86: oInstruction = {`STO,`R11,16'd33};
  87: oInstruction = {`STO,`R12,16'd6};
  88: oInstruction = {`STO,`R15,16'd34};
  89: oInstruction = {`STO,`R16,16'd6};
  90: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  91: oInstruction = {`POP,`R16,16'b0};
  92: oInstruction = {`POP,`R15,16'b0};
  93: oInstruction = {`POP,`RA,16'b0};
  94: oInstruction = {`NOP,24'b0};
  95: oInstruction = {`RET,16'b0,`RA};
// PINTAR_RECTANGULO:
  96: oInstruction = {`NOP,24'b0};
  97: oInstruction = {`PUSH,16'b0,`RA};
  98: oInstruction = {`PUSH,16'b0,`R3};
  99: oInstruction = {`ADD,`R3,`R11,`R0};
  100: oInstruction = {`NOP,24'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  101: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  102: oInstruction = {`CALL,`DISPLAY,16'b0};
  103: oInstruction = {`ADD,`R11,`R11,`R1};
  104: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  105: oInstruction = {`ADD,`R12,`R12,`R1};
  106: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  107: oInstruction = {`POP,`R3,16'b0};
  108: oInstruction = {`POP,`RA,16'b0};
  109: oInstruction = {`NOP,24'b0};
  110: oInstruction = {`RET,16'b0,`RA};
// PINTAR_SOL:
  111: oInstruction = {`NOP,24'b0};
  112: oInstruction = {`PUSH,16'b0,`RA};
  113: oInstruction = {`PUSH,16'b0,`R15};
  114: oInstruction = {`PUSH,16'b0,`R16};
  115: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  116: oInstruction = {`STO,`R11,16'd34};
  117: oInstruction = {`STO,`R12,16'd3};
  118: oInstruction = {`STO,`R15,16'd36};
  119: oInstruction = {`STO,`R16,16'd7};
  120: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  121: oInstruction = {`STO,`R11,16'd33};
  122: oInstruction = {`STO,`R12,16'd4};
  123: oInstruction = {`STO,`R15,16'd37};
  124: oInstruction = {`STO,`R16,16'd6};
  125: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  126: oInstruction = {`POP,`R16,16'b0};
  127: oInstruction = {`POP,`R15,16'b0};
  128: oInstruction = {`POP,`RA,16'b0};
  129: oInstruction = {`NOP,24'b0};
  130: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_DIA:
  131: oInstruction = {`NOP,24'b0};
  132: oInstruction = {`PUSH,16'b0,`RA};
  133: oInstruction = {`PUSH,16'b0,`R16};
  134: oInstruction = {`PUSH,16'b0,`R15};
  135: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  136: oInstruction = {`STO,`R11,16'd0};
  137: oInstruction = {`STO,`R12,16'd0};
  138: oInstruction = {`STO,`R15,16'd40};
  139: oInstruction = {`STO,`R16,16'd18};
  140: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  141: oInstruction = {`POP,`R15,16'b0};
  142: oInstruction = {`POP,`R16,16'b0};
  143: oInstruction = {`POP,`RA,16'b0};
  144: oInstruction = {`NOP,24'b0};
  145: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_NOCHE:
  146: oInstruction = {`NOP,24'b0};
  147: oInstruction = {`PUSH,16'b0,`RA};
  148: oInstruction = {`PUSH,16'b0,`R16};
  149: oInstruction = {`PUSH,16'b0,`R15};
  150: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  151: oInstruction = {`STO,`R12,16'b0};
  152: oInstruction = {`STO,`R11,16'd0};
  153: oInstruction = {`STO,`R12,16'd0};
  154: oInstruction = {`STO,`R15,16'd40};
  155: oInstruction = {`STO,`R16,16'd18};
  156: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  157: oInstruction = {`POP,`R15,16'b0};
  158: oInstruction = {`POP,`R16,16'b0};
  159: oInstruction = {`POP,`RA,16'b0};
  160: oInstruction = {`NOP,24'b0};
  161: oInstruction = {`RET,16'b0,`RA};
// PONER_ZACATE:
  162: oInstruction = {`NOP,24'b0};
  163: oInstruction = {`PUSH,16'b0,`RA};
  164: oInstruction = {`PUSH,16'b0,`R16};
  165: oInstruction = {`PUSH,16'b0,`R15};
  166: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  167: oInstruction = {`STO,`R11,16'd0};
  168: oInstruction = {`STO,`R12,16'd18};
  169: oInstruction = {`STO,`R15,16'd40};
  170: oInstruction = {`STO,`R16,16'd30};
  171: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  172: oInstruction = {`POP,`R15,16'b0};
  173: oInstruction = {`POP,`R16,16'b0};
  174: oInstruction = {`POP,`RA,16'b0};
  175: oInstruction = {`NOP,24'b0};
  176: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
