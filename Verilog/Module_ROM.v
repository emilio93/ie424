`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define JUEGO 8'd9
`define FIN 8'd16
`define DELAYMS 8'd17
`define DELAYMS_LOOP_1 8'd24
`define DELAYMS_LOOP_2 8'd25
`define DELAYMS_LOOP_3 8'd26
`define DISPLAY 8'd34
`define MOVIMIENTO 8'd45
`define SUBIR_MOVIMIENTO 8'd61
`define BAJAR_MOVIMIENTO 8'd63
`define TERMINAR_MOVIMIENTO 8'd65
`define PINTAR_JUGADOR 8'd69
`define PINTAR_LUNA 8'd96
`define PINTAR_OBSTACULO 8'd121
`define PINTAR_RECTANGULO 8'd138
`define LOOP_VERTICAL_PINTAR_RECTANGULO 8'd143
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 8'd144
`define PINTAR_SOL 8'd155
`define PONER_CIELO_DIA 8'd175
`define PONER_CIELO_NOCHE 8'd191
`define PONER_ZACATE 8'd207

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
  7: oInstruction = {`STO,`R24,16'd35};
  8: oInstruction = {`STO,`R25,16'd20};
// JUEGO:
  9: oInstruction = {`CALL,`MOVIMIENTO,16'b0};
  10: oInstruction = {`CALL,`PONER_CIELO_NOCHE,16'b0};
  11: oInstruction = {`CALL,`PINTAR_LUNA,16'b0};
  12: oInstruction = {`CALL,`PONER_ZACATE,16'b0};
  13: oInstruction = {`CALL,`PINTAR_JUGADOR,16'b0};
  14: oInstruction = {`CALL,`PINTAR_OBSTACULO,16'b0};
  15: oInstruction = {`JMP,`JUEGO,16'b0};
// FIN:
  16: oInstruction = {`JMP,`FIN,16'b0};
// DELAYMS:
  17: oInstruction = {`NOP,24'b0};
  18: oInstruction = {`STO,`T1,16'b0};
  19: oInstruction = {`STO,`T2,16'b0};
  20: oInstruction = {`STO,`T3,16'b0};
  21: oInstruction = {`STO,`T4,16'd10000};
  22: oInstruction = {`STO,`T5,16'd10000};
  23: oInstruction = {`STO,`T6,16'd1000};
// DELAYMS_LOOP_1:
  24: oInstruction = {`STO,`T2,16'b0};
// DELAYMS_LOOP_2:
  25: oInstruction = {`STO,`T3,16'b0};
// DELAYMS_LOOP_3:
  26: oInstruction = {`ADD,`T3,`T3,`R1};
  27: oInstruction = {`BLE,`DELAYMS_LOOP_3,`T3,`T6};
  28: oInstruction = {`ADD,`T2,`T2,`R1};
  29: oInstruction = {`BLE,`DELAYMS_LOOP_2,`T2,`T5};
  30: oInstruction = {`ADD,`T1,`T1,`R1};
  31: oInstruction = {`BLE,`DELAYMS_LOOP_1,`T1,`T4};
  32: oInstruction = {`NOP,24'b0};
  33: oInstruction = {`RET,16'b0,`RA};
// DISPLAY:
  34: oInstruction = {`NOP,24'b0};
  35: oInstruction = {`PUSH,16'b0,`RA};
  36: oInstruction = {`NOP,24'b0};
  37: oInstruction = {`MUL,`T1,`R12,`R13};
  38: oInstruction = {`NOP,24'b0};
  39: oInstruction = {`ADD,`T1,`T1,`R11};
  40: oInstruction = {`NOP,24'b0};
  41: oInstruction = {`VGA,8'b0,`R10,`T1};
  42: oInstruction = {`POP,`RA,16'b0};
  43: oInstruction = {`NOP,24'b0};
  44: oInstruction = {`RET,16'b0,`RA};
// MOVIMIENTO:
  45: oInstruction = {`NOP,24'b0};
  46: oInstruction = {`PUSH,16'b0,`RA};
  47: oInstruction = {`PUSH,16'b0,`R22};
  48: oInstruction = {`STO,`T1,16'h1D};
  49: oInstruction = {`STO,`T2,16'h1B};
  50: oInstruction = {`STO,`T3,16'd15};
  51: oInstruction = {`STO,`T4,16'd5};
  52: oInstruction = {`STO,`R22,16'b0};
  53: oInstruction = {`NOP,24'b0};
  54: oInstruction = {`TEC,`R22,16'b0};
  55: oInstruction = {`NOP,24'b0};
  56: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R20,`T3};
  57: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  58: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
  59: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  60: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,16'b0};
// SUBIR_MOVIMIENTO:
  61: oInstruction = {`STO,`R22,16'd15};
  62: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// BAJAR_MOVIMIENTO:
  63: oInstruction = {`STO,`R22,16'd20};
  64: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// TERMINAR_MOVIMIENTO:
  65: oInstruction = {`POP,`R22,16'b0};
  66: oInstruction = {`POP,`RA,16'b0};
  67: oInstruction = {`NOP,24'b0};
  68: oInstruction = {`RET,16'b0,`RA};
// PINTAR_JUGADOR:
  69: oInstruction = {`NOP,24'b0};
  70: oInstruction = {`PUSH,16'b0,`RA};
  71: oInstruction = {`PUSH,16'b0,`R18};
  72: oInstruction = {`PUSH,16'b0,`R19};
  73: oInstruction = {`STO,`R10,8'b0,`COLOR_MAGENTA};
  74: oInstruction = {`STO,`R18,16'd1};
  75: oInstruction = {`STO,`R19,16'd4};
  76: oInstruction = {`ADD,`R11,`R20,`R0};
  77: oInstruction = {`ADD,`R12,`R21,`R0};
  78: oInstruction = {`ADD,`R15,`R20,`R18};
  79: oInstruction = {`ADD,`R16,`R21,`R19};
  80: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  81: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  82: oInstruction = {`ADD,`R11,`R20,`R18};
  83: oInstruction = {`ADD,`R12,`R21,`R19};
  84: oInstruction = {`ADD,`R15,`R20,`R1};
  85: oInstruction = {`ADD,`R16,`R21,`R19};
  86: oInstruction = {`NOP,24'd0};
  87: oInstruction = {`SUB,`R16,`R16,`R1};
  88: oInstruction = {`NOP,24'd0};
  89: oInstruction = {`SUB,`R16,`R16,`R1};
  90: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  91: oInstruction = {`POP,`R19,16'b0};
  92: oInstruction = {`POP,`R18,16'b0};
  93: oInstruction = {`POP,`RA,16'b0};
  94: oInstruction = {`NOP,24'b0};
  95: oInstruction = {`RET,16'b0,`RA};
// PINTAR_LUNA:
  96: oInstruction = {`NOP,24'b0};
  97: oInstruction = {`PUSH,16'b0,`RA};
  98: oInstruction = {`PUSH,16'b0,`R15};
  99: oInstruction = {`PUSH,16'b0,`R16};
  100: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  101: oInstruction = {`STO,`R11,16'd33};
  102: oInstruction = {`STO,`R12,16'd3};
  103: oInstruction = {`STO,`R15,16'd34};
  104: oInstruction = {`STO,`R16,16'd3};
  105: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  106: oInstruction = {`STO,`R11,16'd34};
  107: oInstruction = {`STO,`R12,16'd4};
  108: oInstruction = {`STO,`R15,16'd35};
  109: oInstruction = {`STO,`R16,16'd5};
  110: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  111: oInstruction = {`STO,`R11,16'd33};
  112: oInstruction = {`STO,`R12,16'd6};
  113: oInstruction = {`STO,`R15,16'd34};
  114: oInstruction = {`STO,`R16,16'd6};
  115: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  116: oInstruction = {`POP,`R16,16'b0};
  117: oInstruction = {`POP,`R15,16'b0};
  118: oInstruction = {`POP,`RA,16'b0};
  119: oInstruction = {`NOP,24'b0};
  120: oInstruction = {`RET,16'b0,`RA};
// PINTAR_OBSTACULO:
  121: oInstruction = {`NOP,24'b0};
  122: oInstruction = {`PUSH,16'b0,`RA};
  123: oInstruction = {`PUSH,16'b0,`R24};
  124: oInstruction = {`PUSH,16'b0,`R25};
  125: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  126: oInstruction = {`STO,`R18,16'd2};
  127: oInstruction = {`STO,`R19,16'd5};
  128: oInstruction = {`ADD,`R11,`R24,`R0};
  129: oInstruction = {`ADD,`R12,`R25,`R0};
  130: oInstruction = {`ADD,`R15,`R24,`R18};
  131: oInstruction = {`ADD,`R16,`R25,`R19};
  132: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  133: oInstruction = {`POP,`R25,16'b0};
  134: oInstruction = {`POP,`R24,16'b0};
  135: oInstruction = {`POP,`RA,16'b0};
  136: oInstruction = {`NOP,24'b0};
  137: oInstruction = {`RET,16'b0,`RA};
// PINTAR_RECTANGULO:
  138: oInstruction = {`NOP,24'b0};
  139: oInstruction = {`PUSH,16'b0,`RA};
  140: oInstruction = {`PUSH,16'b0,`R3};
  141: oInstruction = {`ADD,`R3,`R11,`R0};
  142: oInstruction = {`NOP,24'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  143: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  144: oInstruction = {`CALL,`DISPLAY,16'b0};
  145: oInstruction = {`ADD,`R11,`R11,`R1};
  146: oInstruction = {`NOP,24'b0};
  147: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  148: oInstruction = {`ADD,`R12,`R12,`R1};
  149: oInstruction = {`NOP,24'b0};
  150: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  151: oInstruction = {`POP,`R3,16'b0};
  152: oInstruction = {`POP,`RA,16'b0};
  153: oInstruction = {`NOP,24'b0};
  154: oInstruction = {`RET,16'b0,`RA};
// PINTAR_SOL:
  155: oInstruction = {`NOP,24'b0};
  156: oInstruction = {`PUSH,16'b0,`RA};
  157: oInstruction = {`PUSH,16'b0,`R15};
  158: oInstruction = {`PUSH,16'b0,`R16};
  159: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  160: oInstruction = {`STO,`R11,16'd34};
  161: oInstruction = {`STO,`R12,16'd3};
  162: oInstruction = {`STO,`R15,16'd35};
  163: oInstruction = {`STO,`R16,16'd6};
  164: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  165: oInstruction = {`STO,`R11,16'd33};
  166: oInstruction = {`STO,`R12,16'd4};
  167: oInstruction = {`STO,`R15,16'd36};
  168: oInstruction = {`STO,`R16,16'd5};
  169: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  170: oInstruction = {`POP,`R16,16'b0};
  171: oInstruction = {`POP,`R15,16'b0};
  172: oInstruction = {`POP,`RA,16'b0};
  173: oInstruction = {`NOP,24'b0};
  174: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_DIA:
  175: oInstruction = {`NOP,24'b0};
  176: oInstruction = {`PUSH,16'b0,`RA};
  177: oInstruction = {`PUSH,16'b0,`R16};
  178: oInstruction = {`PUSH,16'b0,`R15};
  179: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  180: oInstruction = {`STO,`R11,16'd0};
  181: oInstruction = {`STO,`R12,16'd0};
  182: oInstruction = {`STO,`R13,16'd40};
  183: oInstruction = {`STO,`R15,16'd39};
  184: oInstruction = {`STO,`R16,16'd18};
  185: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  186: oInstruction = {`POP,`R15,16'b0};
  187: oInstruction = {`POP,`R16,16'b0};
  188: oInstruction = {`POP,`RA,16'b0};
  189: oInstruction = {`NOP,24'b0};
  190: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_NOCHE:
  191: oInstruction = {`NOP,24'b0};
  192: oInstruction = {`PUSH,16'b0,`RA};
  193: oInstruction = {`PUSH,16'b0,`R16};
  194: oInstruction = {`PUSH,16'b0,`R15};
  195: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  196: oInstruction = {`STO,`R11,16'd0};
  197: oInstruction = {`STO,`R12,16'd0};
  198: oInstruction = {`STO,`R13,16'd40};
  199: oInstruction = {`STO,`R15,16'd40};
  200: oInstruction = {`STO,`R16,16'd18};
  201: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  202: oInstruction = {`POP,`R15,16'b0};
  203: oInstruction = {`POP,`R16,16'b0};
  204: oInstruction = {`POP,`RA,16'b0};
  205: oInstruction = {`NOP,24'b0};
  206: oInstruction = {`RET,16'b0,`RA};
// PONER_ZACATE:
  207: oInstruction = {`NOP,24'b0};
  208: oInstruction = {`PUSH,16'b0,`RA};
  209: oInstruction = {`PUSH,16'b0,`R16};
  210: oInstruction = {`PUSH,16'b0,`R15};
  211: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  212: oInstruction = {`STO,`R11,16'd0};
  213: oInstruction = {`STO,`R12,16'd18};
  214: oInstruction = {`STO,`R15,16'd40};
  215: oInstruction = {`STO,`R16,16'd30};
  216: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  217: oInstruction = {`POP,`R15,16'b0};
  218: oInstruction = {`POP,`R16,16'b0};
  219: oInstruction = {`POP,`RA,16'b0};
  220: oInstruction = {`NOP,24'b0};
  221: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
