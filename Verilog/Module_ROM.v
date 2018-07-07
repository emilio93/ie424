`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define JUEGO 8'd7
`define FIN 8'd18
`define DELAYMS 8'd19
`define DELAYMS_LOOP_1 8'd26
`define DELAYMS_LOOP_2 8'd27
`define DELAYMS_LOOP_3 8'd28
`define DISPLAY 8'd36
`define FONDO 8'd47
`define MOVIMIENTO 8'd60
`define SUBIR_MOVIMIENTO 8'd67
`define BAJAR_MOVIMIENTO 8'd70
`define TERMINAR_MOVIMIENTO 8'd73
`define PINTAR_JUGADOR 8'd76
`define PINTAR_LUNA 8'd93
`define PINTAR_RECTANGULO 8'd118
`define LOOP_VERTICAL_PINTAR_RECTANGULO 8'd123
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 8'd124
`define PINTAR_SOL 8'd135
`define PONER_CIELO_DIA 8'd155
`define PONER_CIELO_NOCHE 8'd176
`define PONER_ZACATE 8'd192

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
  3: oInstruction = {`STO,`R13,16'd40};
  4: oInstruction = {`STO,`R14,16'd30};
  5: oInstruction = {`STO,`R20,16'd5};
  6: oInstruction = {`STO,`R21,16'd20};
// JUEGO:
  7: oInstruction = {`CALL,`MOVIMIENTO,16'b0};
  8: oInstruction = {`CALL,`PONER_CIELO_NOCHE,16'b0};
  9: oInstruction = {`CALL,`PINTAR_LUNA,16'b0};
  10: oInstruction = {`CALL,`PONER_ZACATE,16'b0};
  11: oInstruction = {`CALL,`PINTAR_JUGADOR,16'b0};
  12: oInstruction = {`CALL,`DELAYMS,16'b0};
  13: oInstruction = {`CALL,`PONER_CIELO_DIA,16'b0};
  14: oInstruction = {`CALL,`PINTAR_SOL,16'b0};
  15: oInstruction = {`CALL,`PINTAR_JUGADOR,16'b0};
  16: oInstruction = {`CALL,`DELAYMS,16'b0};
  17: oInstruction = {`JMP,`JUEGO,16'b0};
// FIN:
  18: oInstruction = {`JMP,`FIN,16'b0};
// DELAYMS:
  19: oInstruction = {`NOP,24'b0};
  20: oInstruction = {`STO,`T1,16'b0};
  21: oInstruction = {`STO,`T2,16'b0};
  22: oInstruction = {`STO,`T3,16'b0};
  23: oInstruction = {`STO,`T4,16'd10000};
  24: oInstruction = {`STO,`T5,16'd10000};
  25: oInstruction = {`STO,`T6,16'd10000};
// DELAYMS_LOOP_1:
  26: oInstruction = {`STO,`T2,16'b0};
// DELAYMS_LOOP_2:
  27: oInstruction = {`STO,`T3,16'b0};
// DELAYMS_LOOP_3:
  28: oInstruction = {`ADD,`T3,`T3,`R1};
  29: oInstruction = {`BLE,`DELAYMS_LOOP_3,`T3,`T6};
  30: oInstruction = {`ADD,`T2,`T2,`R1};
  31: oInstruction = {`BLE,`DELAYMS_LOOP_2,`T2,`T5};
  32: oInstruction = {`ADD,`T1,`T1,`R1};
  33: oInstruction = {`BLE,`DELAYMS_LOOP_1,`T1,`T4};
  34: oInstruction = {`NOP,24'b0};
  35: oInstruction = {`RET,16'b0,`RA};
// DISPLAY:
  36: oInstruction = {`NOP,24'b0};
  37: oInstruction = {`PUSH,16'b0,`RA};
  38: oInstruction = {`NOP,24'b0};
  39: oInstruction = {`MUL,`T1,`R12,`R13};
  40: oInstruction = {`NOP,24'b0};
  41: oInstruction = {`ADD,`T1,`T1,`R11};
  42: oInstruction = {`NOP,24'b0};
  43: oInstruction = {`VGA,8'b0,`R10,`T1};
  44: oInstruction = {`POP,`RA,16'b0};
  45: oInstruction = {`NOP,24'b0};
  46: oInstruction = {`RET,16'b0,`RA};
// FONDO:
  47: oInstruction = {`NOP,24'b0};
  48: oInstruction = {`PUSH,16'b0,`RA};
  49: oInstruction = {`STO,`R11,16'b0};
  50: oInstruction = {`STO,`R12,16'b0};
  51: oInstruction = {`CALL,`PONER_CIELO_DIA,16'b0};
  52: oInstruction = {`CALL,`PINTAR_SOL,16'b0};
  53: oInstruction = {`CALL,`PONER_CIELO_NOCHE,16'b0};
  54: oInstruction = {`CALL,`PINTAR_LUNA,16'b0};
  55: oInstruction = {`CALL,`PONER_ZACATE,16'b0};
  56: oInstruction = {`NOP,24'b0};
  57: oInstruction = {`POP,`RA,16'b0};
  58: oInstruction = {`NOP,24'b0};
  59: oInstruction = {`RET,16'b0,`RA};
// MOVIMIENTO:
  60: oInstruction = {`NOP,24'b0};
  61: oInstruction = {`PUSH,16'b0,`RA};
  62: oInstruction = {`STO,`T1,16'h1D};
  63: oInstruction = {`STO,`T2,16'h1B};
  64: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  65: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  66: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,16'b0};
// SUBIR_MOVIMIENTO:
  67: oInstruction = {`SUB,`R20,`R20,`R1};
  68: oInstruction = {`SUB,`R21,`R21,`R1};
  69: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// BAJAR_MOVIMIENTO:
  70: oInstruction = {`ADD,`R20,`R20,`R1};
  71: oInstruction = {`ADD,`R21,`R21,`R1};
  72: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// TERMINAR_MOVIMIENTO:
  73: oInstruction = {`POP,`RA,16'b0};
  74: oInstruction = {`NOP,24'b0};
  75: oInstruction = {`RET,16'b0,`RA};
// PINTAR_JUGADOR:
  76: oInstruction = {`NOP,24'b0};
  77: oInstruction = {`PUSH,16'b0,`RA};
  78: oInstruction = {`PUSH,16'b0,`R18};
  79: oInstruction = {`PUSH,16'b0,`R19};
  80: oInstruction = {`STO,`R10,8'b0,`COLOR_MAGENTA};
  81: oInstruction = {`STO,`R18,16'd2};
  82: oInstruction = {`STO,`R19,16'd5};
  83: oInstruction = {`ADD,`R11,`R20,`R0};
  84: oInstruction = {`ADD,`R12,`R21,`R0};
  85: oInstruction = {`ADD,`R15,`R20,`R18};
  86: oInstruction = {`ADD,`R16,`R21,`R19};
  87: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  88: oInstruction = {`POP,`R19,16'b0};
  89: oInstruction = {`POP,`R18,16'b0};
  90: oInstruction = {`POP,`RA,16'b0};
  91: oInstruction = {`NOP,24'b0};
  92: oInstruction = {`RET,16'b0,`RA};
// PINTAR_LUNA:
  93: oInstruction = {`NOP,24'b0};
  94: oInstruction = {`PUSH,16'b0,`RA};
  95: oInstruction = {`PUSH,16'b0,`R15};
  96: oInstruction = {`PUSH,16'b0,`R16};
  97: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  98: oInstruction = {`STO,`R11,16'd33};
  99: oInstruction = {`STO,`R12,16'd3};
  100: oInstruction = {`STO,`R15,16'd34};
  101: oInstruction = {`STO,`R16,16'd3};
  102: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  103: oInstruction = {`STO,`R11,16'd34};
  104: oInstruction = {`STO,`R12,16'd4};
  105: oInstruction = {`STO,`R15,16'd35};
  106: oInstruction = {`STO,`R16,16'd5};
  107: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  108: oInstruction = {`STO,`R11,16'd33};
  109: oInstruction = {`STO,`R12,16'd6};
  110: oInstruction = {`STO,`R15,16'd34};
  111: oInstruction = {`STO,`R16,16'd6};
  112: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  113: oInstruction = {`POP,`R16,16'b0};
  114: oInstruction = {`POP,`R15,16'b0};
  115: oInstruction = {`POP,`RA,16'b0};
  116: oInstruction = {`NOP,24'b0};
  117: oInstruction = {`RET,16'b0,`RA};
// PINTAR_RECTANGULO:
  118: oInstruction = {`NOP,24'b0};
  119: oInstruction = {`PUSH,16'b0,`RA};
  120: oInstruction = {`PUSH,16'b0,`R3};
  121: oInstruction = {`ADD,`R3,`R11,`R0};
  122: oInstruction = {`NOP,24'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  123: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  124: oInstruction = {`CALL,`DISPLAY,16'b0};
  125: oInstruction = {`ADD,`R11,`R11,`R1};
  126: oInstruction = {`NOP,24'b0};
  127: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  128: oInstruction = {`ADD,`R12,`R12,`R1};
  129: oInstruction = {`NOP,24'b0};
  130: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  131: oInstruction = {`POP,`R3,16'b0};
  132: oInstruction = {`POP,`RA,16'b0};
  133: oInstruction = {`NOP,24'b0};
  134: oInstruction = {`RET,16'b0,`RA};
// PINTAR_SOL:
  135: oInstruction = {`NOP,24'b0};
  136: oInstruction = {`PUSH,16'b0,`RA};
  137: oInstruction = {`PUSH,16'b0,`R15};
  138: oInstruction = {`PUSH,16'b0,`R16};
  139: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  140: oInstruction = {`STO,`R11,16'd34};
  141: oInstruction = {`STO,`R12,16'd3};
  142: oInstruction = {`STO,`R15,16'd36};
  143: oInstruction = {`STO,`R16,16'd7};
  144: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  145: oInstruction = {`STO,`R11,16'd33};
  146: oInstruction = {`STO,`R12,16'd4};
  147: oInstruction = {`STO,`R15,16'd37};
  148: oInstruction = {`STO,`R16,16'd6};
  149: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  150: oInstruction = {`POP,`R16,16'b0};
  151: oInstruction = {`POP,`R15,16'b0};
  152: oInstruction = {`POP,`RA,16'b0};
  153: oInstruction = {`NOP,24'b0};
  154: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_DIA:
  155: oInstruction = {`NOP,24'b0};
  156: oInstruction = {`PUSH,16'b0,`RA};
  157: oInstruction = {`PUSH,16'b0,`R16};
  158: oInstruction = {`PUSH,16'b0,`R15};
  159: oInstruction = {`PUSH,16'b0,`R12};
  160: oInstruction = {`PUSH,16'b0,`R11};
  161: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  162: oInstruction = {`STO,`R11,16'd0};
  163: oInstruction = {`STO,`R12,16'd0};
  164: oInstruction = {`STO,`R15,16'd40};
  165: oInstruction = {`STO,`R16,16'd18};
  166: oInstruction = {`STO,`R13,16'd40};
  167: oInstruction = {`STO,`R14,16'd30};
  168: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  169: oInstruction = {`POP,`R11,16'b0};
  170: oInstruction = {`POP,`R12,16'b0};
  171: oInstruction = {`POP,`R15,16'b0};
  172: oInstruction = {`POP,`R16,16'b0};
  173: oInstruction = {`POP,`RA,16'b0};
  174: oInstruction = {`NOP,24'b0};
  175: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_NOCHE:
  176: oInstruction = {`NOP,24'b0};
  177: oInstruction = {`PUSH,16'b0,`RA};
  178: oInstruction = {`PUSH,16'b0,`R16};
  179: oInstruction = {`PUSH,16'b0,`R15};
  180: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  181: oInstruction = {`STO,`R12,16'b0};
  182: oInstruction = {`STO,`R11,16'd0};
  183: oInstruction = {`STO,`R12,16'd0};
  184: oInstruction = {`STO,`R15,16'd40};
  185: oInstruction = {`STO,`R16,16'd18};
  186: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  187: oInstruction = {`POP,`R15,16'b0};
  188: oInstruction = {`POP,`R16,16'b0};
  189: oInstruction = {`POP,`RA,16'b0};
  190: oInstruction = {`NOP,24'b0};
  191: oInstruction = {`RET,16'b0,`RA};
// PONER_ZACATE:
  192: oInstruction = {`NOP,24'b0};
  193: oInstruction = {`PUSH,16'b0,`RA};
  194: oInstruction = {`PUSH,16'b0,`R16};
  195: oInstruction = {`PUSH,16'b0,`R15};
  196: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  197: oInstruction = {`STO,`R11,16'd0};
  198: oInstruction = {`STO,`R12,16'd18};
  199: oInstruction = {`STO,`R15,16'd40};
  200: oInstruction = {`STO,`R16,16'd30};
  201: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  202: oInstruction = {`POP,`R15,16'b0};
  203: oInstruction = {`POP,`R16,16'b0};
  204: oInstruction = {`POP,`RA,16'b0};
  205: oInstruction = {`NOP,24'b0};
  206: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
