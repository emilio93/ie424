`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define JUEGO 8'd11
`define DELAY_MAIN1 8'd17
`define CONTINUE_MAIN1 8'd22
`define FIN 8'd24
`define DELAY_US_FIX 8'd25
`define DELAY_US_FIX_LOOP_1 8'd28
`define DELAY_MS_FIX 8'd33
`define DELAY_MS_FIX_LOOP_1 8'd36
`define DISPLAY 8'd41
`define MOVIMIENTO 8'd52
`define SUBIR_MOVIMIENTO 8'd68
`define BAJAR_MOVIMIENTO 8'd71
`define TERMINAR_MOVIMIENTO 8'd74
`define PINTAR_ESTRELLAS 8'd78
`define PINTAR_JUGADOR 8'd111
`define PINTAR_LUNA 8'd138
`define PINTAR_OBSTACULO 8'd163
`define PINTAR_RECTANGULO 8'd180
`define LOOP_VERTICAL_PINTAR_RECTANGULO 8'd185
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 8'd186
`define PINTAR_SOL 8'd197
`define PONER_CIELO_DIA 8'd217
`define PONER_CIELO_NOCHE 8'd233
`define PONER_ZACATE 8'd249

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
  9: oInstruction = {`STO,`R3,16'd0};
  10: oInstruction = {`STO,`R2,16'd40};
// JUEGO:
  11: oInstruction = {`CALL,`PONER_CIELO_NOCHE,16'b0};
  12: oInstruction = {`CALL,`PINTAR_LUNA,16'b0};
  13: oInstruction = {`CALL,`PONER_ZACATE,16'b0};
  14: oInstruction = {`CALL,`PINTAR_ESTRELLAS,16'b0};
  15: oInstruction = {`CALL,`MOVIMIENTO,16'b0};
  16: oInstruction = {`CALL,`PINTAR_OBSTACULO,16'b0};
// DELAY_MAIN1:
  17: oInstruction = {`ADD,`R3,`R3,`R1};
  18: oInstruction = {`CALL,`DELAY_MS_FIX,16'b0};
  19: oInstruction = {`BEQ,`CONTINUE_MAIN1,`R2,`R3};
  20: oInstruction = {`NOP,24'b0};
  21: oInstruction = {`JMP,`DELAY_MAIN1,16'd0};
// CONTINUE_MAIN1:
  22: oInstruction = {`STO,`R3,16'd0};
  23: oInstruction = {`JMP,`JUEGO,16'b0};
// FIN:
  24: oInstruction = {`JMP,`FIN,16'b0};
// DELAY_US_FIX:
  25: oInstruction = {`NOP,24'b0};
  26: oInstruction = {`STO,`T1,16'b0};
  27: oInstruction = {`STO,`T2,16'd20};
// DELAY_US_FIX_LOOP_1:
  28: oInstruction = {`ADD,`T1,`T1,`R1};
  29: oInstruction = {`BLE,`DELAY_US_FIX_LOOP_1,`T1,`T2};
  30: oInstruction = {`NOP,24'b0};
  31: oInstruction = {`NOP,24'b0};
  32: oInstruction = {`RET,16'b0,`RA};
// DELAY_MS_FIX:
  33: oInstruction = {`NOP,24'b0};
  34: oInstruction = {`STO,`T1,16'b0};
  35: oInstruction = {`STO,`T2,16'd24995};
// DELAY_MS_FIX_LOOP_1:
  36: oInstruction = {`ADD,`T1,`T1,`R1};
  37: oInstruction = {`BLE,`DELAY_MS_FIX_LOOP_1,`T1,`T2};
  38: oInstruction = {`NOP,24'b0};
  39: oInstruction = {`NOP,24'b0};
  40: oInstruction = {`RET,16'b0,`RA};
// DISPLAY:
  41: oInstruction = {`NOP,24'b0};
  42: oInstruction = {`PUSH,16'b0,`RA};
  43: oInstruction = {`NOP,24'b0};
  44: oInstruction = {`MUL,`T1,`R12,`R13};
  45: oInstruction = {`NOP,24'b0};
  46: oInstruction = {`ADD,`T1,`T1,`R11};
  47: oInstruction = {`NOP,24'b0};
  48: oInstruction = {`VGA,8'b0,`R10,`T1};
  49: oInstruction = {`POP,`RA,16'b0};
  50: oInstruction = {`NOP,24'b0};
  51: oInstruction = {`RET,16'b0,`RA};
// MOVIMIENTO:
  52: oInstruction = {`NOP,24'b0};
  53: oInstruction = {`PUSH,16'b0,`RA};
  54: oInstruction = {`PUSH,16'b0,`R22};
  55: oInstruction = {`STO,`T1,16'h1D};
  56: oInstruction = {`STO,`T2,16'h1B};
  57: oInstruction = {`STO,`T3,16'd15};
  58: oInstruction = {`STO,`T4,16'd5};
  59: oInstruction = {`STO,`R22,16'b0};
  60: oInstruction = {`NOP,24'b0};
  61: oInstruction = {`TEC,`R22,16'b0};
  62: oInstruction = {`NOP,24'b0};
  63: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R20,`T3};
  64: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  65: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
  66: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  67: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,16'b0};
// SUBIR_MOVIMIENTO:
  68: oInstruction = {`STO,`R21,16'd15};
  69: oInstruction = {`CALL,`PINTAR_JUGADOR,16'b0};
  70: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// BAJAR_MOVIMIENTO:
  71: oInstruction = {`STO,`R21,16'd20};
  72: oInstruction = {`CALL,`PINTAR_JUGADOR,16'b0};
  73: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO};
// TERMINAR_MOVIMIENTO:
  74: oInstruction = {`POP,`R22,16'b0};
  75: oInstruction = {`POP,`RA,16'b0};
  76: oInstruction = {`NOP,24'b0};
  77: oInstruction = {`RET,16'b0,`RA};
// PINTAR_ESTRELLAS:
  78: oInstruction = {`NOP,24'b0};
  79: oInstruction = {`PUSH,16'b0,`RA};
  80: oInstruction = {`PUSH,16'b0,`R10};
  81: oInstruction = {`PUSH,16'b0,`R11};
  82: oInstruction = {`PUSH,16'b0,`R12};
  83: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  84: oInstruction = {`STO,`R11,16'd5};
  85: oInstruction = {`STO,`R12,16'd7};
  86: oInstruction = {`CALL,`DISPLAY,16'b0};
  87: oInstruction = {`STO,`R11,16'd10};
  88: oInstruction = {`STO,`R12,16'd10};
  89: oInstruction = {`CALL,`DISPLAY,16'b0};
  90: oInstruction = {`STO,`R11,16'd20};
  91: oInstruction = {`STO,`R12,16'd3};
  92: oInstruction = {`CALL,`DISPLAY,16'b0};
  93: oInstruction = {`STO,`R11,16'd12};
  94: oInstruction = {`STO,`R12,16'd7};
  95: oInstruction = {`CALL,`DISPLAY,16'b0};
  96: oInstruction = {`STO,`R11,16'd1};
  97: oInstruction = {`STO,`R12,16'd2};
  98: oInstruction = {`CALL,`DISPLAY,16'b0};
  99: oInstruction = {`STO,`R11,16'd22};
  100: oInstruction = {`STO,`R12,16'd8};
  101: oInstruction = {`CALL,`DISPLAY,16'b0};
  102: oInstruction = {`STO,`R11,16'd20};
  103: oInstruction = {`STO,`R12,16'd15};
  104: oInstruction = {`CALL,`DISPLAY,16'b0};
  105: oInstruction = {`POP,`R12,16'b0};
  106: oInstruction = {`POP,`R11,16'b0};
  107: oInstruction = {`POP,`R10,16'b0};
  108: oInstruction = {`POP,`RA,16'b0};
  109: oInstruction = {`NOP,24'b0};
  110: oInstruction = {`RET,16'b0,`RA};
// PINTAR_JUGADOR:
  111: oInstruction = {`NOP,24'b0};
  112: oInstruction = {`PUSH,16'b0,`RA};
  113: oInstruction = {`PUSH,16'b0,`R18};
  114: oInstruction = {`PUSH,16'b0,`R19};
  115: oInstruction = {`STO,`R10,8'b0,`COLOR_MAGENTA};
  116: oInstruction = {`STO,`R18,16'd1};
  117: oInstruction = {`STO,`R19,16'd4};
  118: oInstruction = {`ADD,`R11,`R20,`R0};
  119: oInstruction = {`ADD,`R12,`R21,`R0};
  120: oInstruction = {`ADD,`R15,`R20,`R18};
  121: oInstruction = {`ADD,`R16,`R21,`R19};
  122: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  123: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  124: oInstruction = {`ADD,`R11,`R20,`R18};
  125: oInstruction = {`ADD,`R12,`R21,`R19};
  126: oInstruction = {`ADD,`R15,`R20,`R1};
  127: oInstruction = {`ADD,`R16,`R21,`R19};
  128: oInstruction = {`NOP,24'd0};
  129: oInstruction = {`SUB,`R16,`R16,`R1};
  130: oInstruction = {`NOP,24'd0};
  131: oInstruction = {`SUB,`R16,`R16,`R1};
  132: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  133: oInstruction = {`POP,`R19,16'b0};
  134: oInstruction = {`POP,`R18,16'b0};
  135: oInstruction = {`POP,`RA,16'b0};
  136: oInstruction = {`NOP,24'b0};
  137: oInstruction = {`RET,16'b0,`RA};
// PINTAR_LUNA:
  138: oInstruction = {`NOP,24'b0};
  139: oInstruction = {`PUSH,16'b0,`RA};
  140: oInstruction = {`PUSH,16'b0,`R15};
  141: oInstruction = {`PUSH,16'b0,`R16};
  142: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  143: oInstruction = {`STO,`R11,16'd33};
  144: oInstruction = {`STO,`R12,16'd3};
  145: oInstruction = {`STO,`R15,16'd34};
  146: oInstruction = {`STO,`R16,16'd3};
  147: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  148: oInstruction = {`STO,`R11,16'd34};
  149: oInstruction = {`STO,`R12,16'd4};
  150: oInstruction = {`STO,`R15,16'd35};
  151: oInstruction = {`STO,`R16,16'd5};
  152: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  153: oInstruction = {`STO,`R11,16'd33};
  154: oInstruction = {`STO,`R12,16'd6};
  155: oInstruction = {`STO,`R15,16'd34};
  156: oInstruction = {`STO,`R16,16'd6};
  157: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  158: oInstruction = {`POP,`R16,16'b0};
  159: oInstruction = {`POP,`R15,16'b0};
  160: oInstruction = {`POP,`RA,16'b0};
  161: oInstruction = {`NOP,24'b0};
  162: oInstruction = {`RET,16'b0,`RA};
// PINTAR_OBSTACULO:
  163: oInstruction = {`NOP,24'b0};
  164: oInstruction = {`PUSH,16'b0,`RA};
  165: oInstruction = {`PUSH,16'b0,`R24};
  166: oInstruction = {`PUSH,16'b0,`R25};
  167: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  168: oInstruction = {`STO,`R18,16'd2};
  169: oInstruction = {`STO,`R19,16'd5};
  170: oInstruction = {`ADD,`R11,`R24,`R0};
  171: oInstruction = {`ADD,`R12,`R25,`R0};
  172: oInstruction = {`ADD,`R15,`R24,`R18};
  173: oInstruction = {`ADD,`R16,`R25,`R19};
  174: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  175: oInstruction = {`POP,`R25,16'b0};
  176: oInstruction = {`POP,`R24,16'b0};
  177: oInstruction = {`POP,`RA,16'b0};
  178: oInstruction = {`NOP,24'b0};
  179: oInstruction = {`RET,16'b0,`RA};
// PINTAR_RECTANGULO:
  180: oInstruction = {`NOP,24'b0};
  181: oInstruction = {`PUSH,16'b0,`RA};
  182: oInstruction = {`PUSH,16'b0,`R3};
  183: oInstruction = {`ADD,`R3,`R11,`R0};
  184: oInstruction = {`NOP,24'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  185: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  186: oInstruction = {`CALL,`DISPLAY,16'b0};
  187: oInstruction = {`ADD,`R11,`R11,`R1};
  188: oInstruction = {`NOP,24'b0};
  189: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  190: oInstruction = {`ADD,`R12,`R12,`R1};
  191: oInstruction = {`NOP,24'b0};
  192: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  193: oInstruction = {`POP,`R3,16'b0};
  194: oInstruction = {`POP,`RA,16'b0};
  195: oInstruction = {`NOP,24'b0};
  196: oInstruction = {`RET,16'b0,`RA};
// PINTAR_SOL:
  197: oInstruction = {`NOP,24'b0};
  198: oInstruction = {`PUSH,16'b0,`RA};
  199: oInstruction = {`PUSH,16'b0,`R15};
  200: oInstruction = {`PUSH,16'b0,`R16};
  201: oInstruction = {`STO,`R10,8'b0,`COLOR_YELLOW};
  202: oInstruction = {`STO,`R11,16'd34};
  203: oInstruction = {`STO,`R12,16'd3};
  204: oInstruction = {`STO,`R15,16'd35};
  205: oInstruction = {`STO,`R16,16'd6};
  206: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  207: oInstruction = {`STO,`R11,16'd33};
  208: oInstruction = {`STO,`R12,16'd4};
  209: oInstruction = {`STO,`R15,16'd36};
  210: oInstruction = {`STO,`R16,16'd5};
  211: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  212: oInstruction = {`POP,`R16,16'b0};
  213: oInstruction = {`POP,`R15,16'b0};
  214: oInstruction = {`POP,`RA,16'b0};
  215: oInstruction = {`NOP,24'b0};
  216: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_DIA:
  217: oInstruction = {`NOP,24'b0};
  218: oInstruction = {`PUSH,16'b0,`RA};
  219: oInstruction = {`PUSH,16'b0,`R16};
  220: oInstruction = {`PUSH,16'b0,`R15};
  221: oInstruction = {`STO,`R10,8'b0,`COLOR_CYAN};
  222: oInstruction = {`STO,`R11,16'd0};
  223: oInstruction = {`STO,`R12,16'd0};
  224: oInstruction = {`STO,`R13,16'd40};
  225: oInstruction = {`STO,`R15,16'd39};
  226: oInstruction = {`STO,`R16,16'd18};
  227: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  228: oInstruction = {`POP,`R15,16'b0};
  229: oInstruction = {`POP,`R16,16'b0};
  230: oInstruction = {`POP,`RA,16'b0};
  231: oInstruction = {`NOP,24'b0};
  232: oInstruction = {`RET,16'b0,`RA};
// PONER_CIELO_NOCHE:
  233: oInstruction = {`NOP,24'b0};
  234: oInstruction = {`PUSH,16'b0,`RA};
  235: oInstruction = {`PUSH,16'b0,`R16};
  236: oInstruction = {`PUSH,16'b0,`R15};
  237: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  238: oInstruction = {`STO,`R11,16'd0};
  239: oInstruction = {`STO,`R12,16'd0};
  240: oInstruction = {`STO,`R13,16'd40};
  241: oInstruction = {`STO,`R15,16'd40};
  242: oInstruction = {`STO,`R16,16'd18};
  243: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  244: oInstruction = {`POP,`R15,16'b0};
  245: oInstruction = {`POP,`R16,16'b0};
  246: oInstruction = {`POP,`RA,16'b0};
  247: oInstruction = {`NOP,24'b0};
  248: oInstruction = {`RET,16'b0,`RA};
// PONER_ZACATE:
  249: oInstruction = {`NOP,24'b0};
  250: oInstruction = {`PUSH,16'b0,`RA};
  251: oInstruction = {`PUSH,16'b0,`R16};
  252: oInstruction = {`PUSH,16'b0,`R15};
  253: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  254: oInstruction = {`STO,`R11,16'd0};
  255: oInstruction = {`STO,`R12,16'd18};
  256: oInstruction = {`STO,`R15,16'd40};
  257: oInstruction = {`STO,`R16,16'd30};
  258: oInstruction = {`CALL,`PINTAR_RECTANGULO,16'b0};
  259: oInstruction = {`POP,`R15,16'b0};
  260: oInstruction = {`POP,`R16,16'b0};
  261: oInstruction = {`POP,`RA,16'b0};
  262: oInstruction = {`NOP,24'b0};
  263: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
