`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define LOOPVERTICAL 8'd8
`define LOOPHORIZONTAL 8'd10
`define CUADROBLANCO 8'd16
`define CUADRONEGRO 8'd18
`define LOOPREGRESOHORIZONTAL 8'd20
`define CONTINUAR 8'd26
`define FIN 8'd34
`define PONER_ZACATE 8'd35
`define LOOPVERTICAL_ZACATE 8'd39
`define LOOPHORIZONTAL_ZACATE 8'd41
`define LOOPREGRESOHORIZONTAL_ZACATE 8'd42
`define PONER_CIELO_NOCHE 8'd50
`define LOOPVERTICAL_CIELO_NOCHE 8'd55
`define LOOPHORIZONTAL_CIELO_NOCHE 8'd57
`define LOOPREGRESOHORIZONTAL_CIELO_NOCHE 8'd58
`define PONER_CIELO_DIA 8'd66
`define LOOPVERTICAL_CIELO_DIA 8'd71
`define LOOPHORIZONTAL_CIELO_DIA 8'd73
`define LOOPREGRESOHORIZONTAL_CIELO_DIA 8'd74
`define PINTAR_SOL 8'd82
`define DISPLAY 8'd134
`define JUGADOR 8'd147
`define LOOP_DIBUJO 8'd166
`define ALTO_JUGADOR 8'd178
`define TERMINAR_JUGADOR 8'd186
`define MOVIMIENTO 8'd198
`define SUBIR_MOVIMIENTO 8'd210
`define BAJAR_MOVIMIENTO 8'd216
`define TERMINAR_MOVIMIENTO 8'd222

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
  5: oInstruction = {`STO,`R13,16'd40};
  6: oInstruction = {`STO,`R14,16'd30};
  7: oInstruction = {`NOP,24'b0};
// LOOPVERTICAL:
  8: oInstruction = {`STO,`R11,16'b0};
  9: oInstruction = {`NOP,24'b0};
// LOOPHORIZONTAL:
  10: oInstruction = {`ADD,`T1,`R11,`R12};
  11: oInstruction = {`NOP,24'b0};
  12: oInstruction = {`AND,`T1,`R1,`T1};
  13: oInstruction = {`NOP,24'b0};
  14: oInstruction = {`BEQ,`CUADROBLANCO,`T1,`R0};
  15: oInstruction = {`JMP,`CUADRONEGRO,16'b0};
// CUADROBLANCO:
  16: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  17: oInstruction = {`JMP,`LOOPREGRESOHORIZONTAL,16'b0};
// CUADRONEGRO:
  18: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  19: oInstruction = {`JMP,`LOOPREGRESOHORIZONTAL,16'b0};
// LOOPREGRESOHORIZONTAL:
  20: oInstruction = {`CALL,`DISPLAY,16'b0};
  21: oInstruction = {`ADD,`R11,`R11,`R1};
  22: oInstruction = {`BLE,`LOOPHORIZONTAL,`R11,`R13};
  23: oInstruction = {`ADD,`R12,`R12,`R1};
  24: oInstruction = {`BLE,`LOOPVERTICAL,`R12,`R14};
  25: oInstruction = {`JMP,`CONTINUAR,16'b0};
// CONTINUAR:
  26: oInstruction = {`CALL,`PONER_CIELO_DIA,16'b0};
  27: oInstruction = {`STO,`R14,16'd30};
  28: oInstruction = {`CALL,`PONER_ZACATE,16'b0};
  29: oInstruction = {`NOP,24'd0};
  30: oInstruction = {`CALL,`PINTAR_SOL,16'b0};
  31: oInstruction = {`STO,`R20,16'd5};
  32: oInstruction = {`STO,`R21,16'd25};
  33: oInstruction = {`CALL,`JUGADOR,16'b0};
// FIN:
  34: oInstruction = {`JMP,`FIN,16'b0};
// PONER_ZACATE:
  35: oInstruction = {`NOP,24'b0};
  36: oInstruction = {`PUSH,16'b0,`RA};
  37: oInstruction = {`STO,`R12,16'd18};
  38: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
// LOOPVERTICAL_ZACATE:
  39: oInstruction = {`STO,`R11,16'b0};
  40: oInstruction = {`NOP,24'b0};
// LOOPHORIZONTAL_ZACATE:
  41: oInstruction = {`NOP,24'b0};
// LOOPREGRESOHORIZONTAL_ZACATE:
  42: oInstruction = {`CALL,`DISPLAY,16'b0};
  43: oInstruction = {`ADD,`R11,`R11,`R1};
  44: oInstruction = {`BLE,`LOOPHORIZONTAL_ZACATE,`R11,`R13};
  45: oInstruction = {`ADD,`R12,`R12,`R1};
  46: oInstruction = {`BLE,`LOOPVERTICAL_ZACATE,`R12,`R14};
  47: oInstruction = {`POP,`RA,16'b0};
  48: oInstruction = {`NOP,24'b0};
  49: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_NOCHE:
  50: oInstruction = {`NOP,24'b0};
  51: oInstruction = {`PUSH,16'b0,`RA};
  52: oInstruction = {`STO,`R14,16'd18};
  53: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  54: oInstruction = {`STO,`R12,16'b0};
// LOOPVERTICAL_CIELO_NOCHE:
  55: oInstruction = {`STO,`R11,16'b0};
  56: oInstruction = {`NOP,24'b0};
// LOOPHORIZONTAL_CIELO_NOCHE:
  57: oInstruction = {`NOP,24'b0};
// LOOPREGRESOHORIZONTAL_CIELO_NOCHE:
  58: oInstruction = {`CALL,`DISPLAY,16'b0};
  59: oInstruction = {`ADD,`R11,`R11,`R1};
  60: oInstruction = {`BLE,`LOOPHORIZONTAL_CIELO_NOCHE,`R11,`R13};
  61: oInstruction = {`ADD,`R12,`R12,`R1};
  62: oInstruction = {`BLE,`LOOPVERTICAL_CIELO_NOCHE,`R12,`R14};
  63: oInstruction = {`POP,`RA,16'b0};
  64: oInstruction = {`NOP,24'b0};
  65: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_DIA:
  66: oInstruction = {`NOP,24'b0};
  67: oInstruction = {`PUSH,16'b0,`RA};
  68: oInstruction = {`STO,`R14,16'd18};
  69: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  70: oInstruction = {`STO,`R12,16'b0};
// LOOPVERTICAL_CIELO_DIA:
  71: oInstruction = {`STO,`R11,16'b0};
  72: oInstruction = {`NOP,24'b0};
// LOOPHORIZONTAL_CIELO_DIA:
  73: oInstruction = {`NOP,24'b0};
// LOOPREGRESOHORIZONTAL_CIELO_DIA:
  74: oInstruction = {`CALL,`DISPLAY,16'b0};
  75: oInstruction = {`ADD,`R11,`R11,`R1};
  76: oInstruction = {`BLE,`LOOPHORIZONTAL_CIELO_DIA,`R11,`R13};
  77: oInstruction = {`ADD,`R12,`R12,`R1};
  78: oInstruction = {`BLE,`LOOPVERTICAL_CIELO_DIA,`R12,`R14};
  79: oInstruction = {`POP,`RA,16'b0};
  80: oInstruction = {`NOP,24'b0};
  81: oInstruction = {`RET,16'b0,`RA};
// PINTAR_SOL:
  82: oInstruction = {`NOP,24'b0};
  83: oInstruction = {`PUSH,16'b0,`RA};
  84: oInstruction = {`PUSH,16'b0,`R11};
  85: oInstruction = {`PUSH,16'b0,`R12};
  86: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  87: oInstruction = {`STO,`R11,16'd33};
  88: oInstruction = {`STO,`R12,16'd3};
  89: oInstruction = {`NOP,24'd0};
  90: oInstruction = {`CALL,`DISPLAY,16'b0};
  91: oInstruction = {`STO,`R11,16'd34};
  92: oInstruction = {`NOP,24'd0};
  93: oInstruction = {`CALL,`DISPLAY,16'b0};
  94: oInstruction = {`STO,`R11,16'd33};
  95: oInstruction = {`STO,`R12,16'd4};
  96: oInstruction = {`NOP,24'd0};
  97: oInstruction = {`CALL,`DISPLAY,16'b0};
  98: oInstruction = {`STO,`R11,16'd34};
  99: oInstruction = {`NOP,24'd0};
  100: oInstruction = {`CALL,`DISPLAY,16'b0};
  101: oInstruction = {`STO,`R11,16'd33};
  102: oInstruction = {`STO,`R12,16'd5};
  103: oInstruction = {`NOP,24'd0};
  104: oInstruction = {`CALL,`DISPLAY,16'b0};
  105: oInstruction = {`STO,`R11,16'd34};
  106: oInstruction = {`NOP,24'd0};
  107: oInstruction = {`CALL,`DISPLAY,16'b0};
  108: oInstruction = {`STO,`R11,16'd33};
  109: oInstruction = {`STO,`R12,16'd6};
  110: oInstruction = {`NOP,24'd0};
  111: oInstruction = {`CALL,`DISPLAY,16'b0};
  112: oInstruction = {`STO,`R11,16'd34};
  113: oInstruction = {`NOP,24'd0};
  114: oInstruction = {`CALL,`DISPLAY,16'b0};
  115: oInstruction = {`STO,`R11,16'd32};
  116: oInstruction = {`STO,`R12,16'd4};
  117: oInstruction = {`NOP,24'd0};
  118: oInstruction = {`CALL,`DISPLAY,16'b0};
  119: oInstruction = {`STO,`R12,16'd5};
  120: oInstruction = {`NOP,24'd0};
  121: oInstruction = {`CALL,`DISPLAY,16'b0};
  122: oInstruction = {`STO,`R11,16'd35};
  123: oInstruction = {`STO,`R12,16'd4};
  124: oInstruction = {`NOP,24'd0};
  125: oInstruction = {`CALL,`DISPLAY,16'b0};
  126: oInstruction = {`STO,`R12,16'd5};
  127: oInstruction = {`NOP,24'd0};
  128: oInstruction = {`CALL,`DISPLAY,16'b0};
  129: oInstruction = {`POP,`R12,16'b0};
  130: oInstruction = {`POP,`R11,16'b0};
  131: oInstruction = {`POP,`RA,16'b0};
  132: oInstruction = {`NOP,24'b0};
  133: oInstruction = {`RET,16'b0,`RA};
// DISPLAY:
  134: oInstruction = {`NOP,24'b0};
  135: oInstruction = {`PUSH,16'b0,`RA};
  136: oInstruction = {`PUSH,16'b0,`R2};
  137: oInstruction = {`NOP,24'b0};
  138: oInstruction = {`MUL,`R2,`R12,`R13};
  139: oInstruction = {`NOP,24'b0};
  140: oInstruction = {`ADD,`R2,`R2,`R11};
  141: oInstruction = {`NOP,24'b0};
  142: oInstruction = {`VGA,8'b0,`R10,`R2};
  143: oInstruction = {`POP,`R2,16'b0};
  144: oInstruction = {`POP,`RA,16'b0};
  145: oInstruction = {`NOP,24'b0};
  146: oInstruction = {`RET,16'b0,`RA};
// JUGADOR:
  147: oInstruction = {`NOP,24'b0};
  148: oInstruction = {`PUSH,16'b0,`RA};
  149: oInstruction = {`NOP,24'b0};
  150: oInstruction = {`PUSH,16'b0,`R18};
  151: oInstruction = {`NOP,24'b0};
  152: oInstruction = {`PUSH,16'b0,`R19};
  153: oInstruction = {`NOP,24'b0};
  154: oInstruction = {`PUSH,16'b0,`R16};
  155: oInstruction = {`NOP,24'b0};
  156: oInstruction = {`PUSH,16'b0,`R17};
  157: oInstruction = {`NOP,24'b0};
  158: oInstruction = {`NOP,24'b0};
  159: oInstruction = {`STO,`R18,16'd2};
  160: oInstruction = {`NOP,24'b0};
  161: oInstruction = {`STO,`R19,16'd5};
  162: oInstruction = {`NOP,24'b0};
  163: oInstruction = {`STO,`R16,16'b0};
  164: oInstruction = {`NOP,24'b0};
  165: oInstruction = {`STO,`R17,16'b0};
// LOOP_DIBUJO:
  166: oInstruction = {`NOP,24'b0};
  167: oInstruction = {`ADD,`R11,`R20,`R16};
  168: oInstruction = {`NOP,24'b0};
  169: oInstruction = {`SUB,`R12,`R21,`R17};
  170: oInstruction = {`NOP,24'b0};
  171: oInstruction = {`CALL,`DISPLAY,16'b0};
  172: oInstruction = {`NOP,24'b0};
  173: oInstruction = {`ADD,`R16,`R16,`R1};
  174: oInstruction = {`NOP,24'b0};
  175: oInstruction = {`BEQ,`ALTO_JUGADOR,`R16,`R18};
  176: oInstruction = {`NOP,24'b0};
  177: oInstruction = {`JMP,`LOOP_DIBUJO,16'b0};
// ALTO_JUGADOR:
  178: oInstruction = {`NOP,24'b0};
  179: oInstruction = {`STO,`R16,16'b0};
  180: oInstruction = {`NOP,24'b0};
  181: oInstruction = {`ADD,`R17,`R17,`R1};
  182: oInstruction = {`NOP,24'b0};
  183: oInstruction = {`BEQ,`TERMINAR_JUGADOR,`R17,`R19};
  184: oInstruction = {`NOP,24'b0};
  185: oInstruction = {`JMP,`LOOP_DIBUJO,16'b0};
// TERMINAR_JUGADOR:
  186: oInstruction = {`NOP,24'b0};
  187: oInstruction = {`POP,`R17,16'b0};
  188: oInstruction = {`NOP,24'b0};
  189: oInstruction = {`POP,`R16,16'b0};
  190: oInstruction = {`NOP,24'b0};
  191: oInstruction = {`POP,`R19,16'b0};
  192: oInstruction = {`NOP,24'b0};
  193: oInstruction = {`POP,`R18,16'b0};
  194: oInstruction = {`NOP,24'b0};
  195: oInstruction = {`POP,`RA,16'b0};
  196: oInstruction = {`NOP,24'b0};
  197: oInstruction = {`RET,16'b0,`RA};
// MOVIMIENTO:
  198: oInstruction = {`NOP,24'b0};
  199: oInstruction = {`PUSH,16'b0,`RA};
  200: oInstruction = {`NOP,24'b0};
  201: oInstruction = {`STO,`T1,16'h1D};
  202: oInstruction = {`NOP,24'b0};
  203: oInstruction = {`STO,`T2,16'h1B};
  204: oInstruction = {`NOP,24'b0};
  205: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  206: oInstruction = {`NOP,24'b0};
  207: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  208: oInstruction = {`NOP,24'b0};
  209: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,16'b0};
// SUBIR_MOVIMIENTO:
  210: oInstruction = {`NOP,24'b0};
  211: oInstruction = {`SUB,`R20,`R20,`R1};
  212: oInstruction = {`NOP,24'b0};
  213: oInstruction = {`SUB,`R21,`R21,`R1};
  214: oInstruction = {`NOP,24'b0};
  215: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// BAJAR_MOVIMIENTO:
  216: oInstruction = {`NOP,24'b0};
  217: oInstruction = {`ADD,`R20,`R20,`R1};
  218: oInstruction = {`NOP,24'b0};
  219: oInstruction = {`ADD,`R21,`R21,`R1};
  220: oInstruction = {`NOP,24'b0};
  221: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// TERMINAR_MOVIMIENTO:
  222: oInstruction = {`NOP,24'b0};
  223: oInstruction = {`POP,`RA,16'b0};
  224: oInstruction = {`NOP,24'b0};
  225: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
