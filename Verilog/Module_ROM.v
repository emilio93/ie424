`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 10'd3
`define JUEGO 10'd17
`define DELAY_MAIN1 10'd23
`define CONTINUE_MAIN1 10'd30
`define DELAY_MAIN2 10'd36
`define CONTINUE_MAIN2 10'd43
`define FIN 10'd45
`define BORRAR_JUGADOR 10'd46
`define DELAY_US_FIX 10'd67
`define DELAY_US_FIX_LOOP_1 10'd70
`define DELAY_MS_FIX 10'd75
`define DELAY_MS_FIX_LOOP_1 10'd78
`define DISPLAY 10'd83
`define MOVIMIENTO 10'd94
`define CHEQUEAR_BAJAR_MOVIMIENTO 10'd107
`define SUBIR_MOVIMIENTO 10'd109
`define BAJAR_MOVIMIENTO 10'd113
`define TERMINAR_MOVIMIENTO 10'd117
`define PINTAR_ESTRELLAS 10'd121
`define PINTAR_JUGADOR 10'd163
`define PINTAR_LUNA 10'd190
`define PINTAR_OBSTACULO 10'd215
`define PINTAR_RECTANGULO 10'd232
`define LOOP_VERTICAL_PINTAR_RECTANGULO 10'd237
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 10'd238
`define PINTAR_SOL 10'd249
`define PONER_CIELO_DIA 10'd269
`define PONER_CIELO_NOCHE 10'd285
`define PONER_ZACATE 10'd305

module ROM
(
  input  wire[15:0] iAddress,
  output reg [35:0] oInstruction
);
always @ (iAddress)
begin
  case (iAddress)
  0: oInstruction = {`NOP,24'd4000};
  1: oInstruction = {`STO,`R0,20'b0};
  2: oInstruction = {`STO,`R1,20'b1};
// INICIO:
  3: oInstruction = {`STO,`R13,20'd40};
  4: oInstruction = {`STO,`R13,20'd30};
  5: oInstruction = {`STO,`R20,20'd5};
  6: oInstruction = {`STO,`R21,20'd24};
  7: oInstruction = {`STO,`R24,20'd35};
  8: oInstruction = {`STO,`R25,20'd20};
  9: oInstruction = {`STO,`R20,20'd5};
  10: oInstruction = {`STO,`R21,20'd24};
  11: oInstruction = {`STO,`R24,20'd35};
  12: oInstruction = {`STO,`R25,20'd20};
  13: oInstruction = {`STO,`R3,20'd0};
  14: oInstruction = {`STO,`R2,20'd6000};
  15: oInstruction = {`STO,`R4,20'd0};
  16: oInstruction = {`STO,`R5,20'd1};
// JUEGO:
  17: oInstruction = {`CALL,`PONER_CIELO_NOCHE,20'b0};
  18: oInstruction = {`CALL,`PINTAR_LUNA,20'b0};
  19: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  20: oInstruction = {`CALL,`PINTAR_ESTRELLAS,20'b0};
  21: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  22: oInstruction = {`CALL,`PINTAR_OBSTACULO,20'b0};
// DELAY_MAIN1:
  23: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  24: oInstruction = {`ADD,`R3,`R3,`R1};
  25: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  26: oInstruction = {`CALL,`PINTAR_OBSTACULO,20'b0};
  27: oInstruction = {`BEQ,`CONTINUE_MAIN1,`R2,`R3};
  28: oInstruction = {`NOP,30'b0};
  29: oInstruction = {`JMP,`DELAY_MAIN1,20'd0};
// CONTINUE_MAIN1:
  30: oInstruction = {`STO,`R3,20'd0};
  31: oInstruction = {`CALL,`PONER_CIELO_DIA,20'b0};
  32: oInstruction = {`CALL,`PINTAR_SOL,20'b0};
  33: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  34: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  35: oInstruction = {`CALL,`PINTAR_OBSTACULO,20'b0};
// DELAY_MAIN2:
  36: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  37: oInstruction = {`ADD,`R3,`R3,`R1};
  38: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  39: oInstruction = {`CALL,`PINTAR_OBSTACULO,20'b0};
  40: oInstruction = {`BEQ,`CONTINUE_MAIN2,`R2,`R3};
  41: oInstruction = {`NOP,30'b0};
  42: oInstruction = {`JMP,`DELAY_MAIN2,20'd0};
// CONTINUE_MAIN2:
  43: oInstruction = {`STO,`R3,20'd0};
  44: oInstruction = {`JMP,`JUEGO,20'b0};
// FIN:
  45: oInstruction = {`JMP,`FIN,20'b0};
// BORRAR_JUGADOR:
  46: oInstruction = {`NOP,30'b0};
  47: oInstruction = {`PUSH,20'b0,`RA};
  48: oInstruction = {`PUSH,20'b0,`R15};
  49: oInstruction = {`PUSH,20'b0,`R16};
  50: oInstruction = {`PUSH,20'b0,`R18};
  51: oInstruction = {`PUSH,20'b0,`R19};
  52: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  53: oInstruction = {`STO,`R18,20'd1};
  54: oInstruction = {`STO,`R19,20'd4};
  55: oInstruction = {`ADD,`R11,`R20,`R0};
  56: oInstruction = {`ADD,`R12,`R21,`R0};
  57: oInstruction = {`ADD,`R15,`R20,`R18};
  58: oInstruction = {`ADD,`R16,`R21,`R19};
  59: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  60: oInstruction = {`POP,`R19,20'b0};
  61: oInstruction = {`POP,`R18,20'b0};
  62: oInstruction = {`POP,`R16,20'b0};
  63: oInstruction = {`POP,`R15,20'b0};
  64: oInstruction = {`POP,`RA,20'b0};
  65: oInstruction = {`NOP,30'b0};
  66: oInstruction = {`RET,20'b0,`RA};
// DELAY_US_FIX:
  67: oInstruction = {`NOP,30'b0};
  68: oInstruction = {`STO,`T1,20'b0};
  69: oInstruction = {`STO,`T2,20'd20};
// DELAY_US_FIX_LOOP_1:
  70: oInstruction = {`ADD,`T1,`T1,`R1};
  71: oInstruction = {`BLE,`DELAY_US_FIX_LOOP_1,`T1,`T2};
  72: oInstruction = {`NOP,30'b0};
  73: oInstruction = {`NOP,30'b0};
  74: oInstruction = {`RET,20'b0,`RA};
// DELAY_MS_FIX:
  75: oInstruction = {`NOP,30'b0};
  76: oInstruction = {`STO,`T1,20'b0};
  77: oInstruction = {`STO,`T2,20'd24995};
// DELAY_MS_FIX_LOOP_1:
  78: oInstruction = {`ADD,`T1,`T1,`R1};
  79: oInstruction = {`BLE,`DELAY_MS_FIX_LOOP_1,`T1,`T2};
  80: oInstruction = {`NOP,30'b0};
  81: oInstruction = {`NOP,30'b0};
  82: oInstruction = {`RET,20'b0,`RA};
// DISPLAY:
  83: oInstruction = {`NOP,30'b0};
  84: oInstruction = {`PUSH,20'b0,`RA};
  85: oInstruction = {`NOP,30'b0};
  86: oInstruction = {`MUL,`T1,`R12,`R13};
  87: oInstruction = {`NOP,30'b0};
  88: oInstruction = {`ADD,`T1,`T1,`R11};
  89: oInstruction = {`NOP,30'b0};
  90: oInstruction = {`VGA,10'b0,`R10,`T1};
  91: oInstruction = {`POP,`RA,20'b0};
  92: oInstruction = {`NOP,30'b0};
  93: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO:
  94: oInstruction = {`NOP,30'b0};
  95: oInstruction = {`PUSH,20'b0,`RA};
  96: oInstruction = {`PUSH,20'b0,`R22};
  97: oInstruction = {`STO,`T1,20'h1D};
  98: oInstruction = {`STO,`T2,20'h1B};
  99: oInstruction = {`STO,`T3,20'd19};
  100: oInstruction = {`STO,`R22,20'b0};
  101: oInstruction = {`NOP,30'b0};
  102: oInstruction = {`TEC,`R22,20'b0};
  103: oInstruction = {`NOP,30'b0};
  104: oInstruction = {`BEQ,`CHEQUEAR_BAJAR_MOVIMIENTO,`R21,`T3};
  105: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  106: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// CHEQUEAR_BAJAR_MOVIMIENTO:
  107: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  108: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// SUBIR_MOVIMIENTO:
  109: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  110: oInstruction = {`STO,`R21,20'd19};
  111: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  112: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// BAJAR_MOVIMIENTO:
  113: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  114: oInstruction = {`STO,`R21,20'd24};
  115: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  116: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// TERMINAR_MOVIMIENTO:
  117: oInstruction = {`POP,`R22,20'b0};
  118: oInstruction = {`POP,`RA,20'b0};
  119: oInstruction = {`NOP,30'b0};
  120: oInstruction = {`RET,20'b0,`RA};
// PINTAR_ESTRELLAS:
  121: oInstruction = {`NOP,30'b0};
  122: oInstruction = {`PUSH,20'b0,`RA};
  123: oInstruction = {`PUSH,20'b0,`R10};
  124: oInstruction = {`PUSH,20'b0,`R11};
  125: oInstruction = {`PUSH,20'b0,`R12};
  126: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  127: oInstruction = {`STO,`R11,20'd5};
  128: oInstruction = {`STO,`R12,20'd7};
  129: oInstruction = {`CALL,`DISPLAY,20'b0};
  130: oInstruction = {`STO,`R11,20'd10};
  131: oInstruction = {`STO,`R12,20'd10};
  132: oInstruction = {`CALL,`DISPLAY,20'b0};
  133: oInstruction = {`STO,`R11,20'd20};
  134: oInstruction = {`STO,`R12,20'd3};
  135: oInstruction = {`CALL,`DISPLAY,20'b0};
  136: oInstruction = {`STO,`R11,20'd12};
  137: oInstruction = {`STO,`R12,20'd7};
  138: oInstruction = {`CALL,`DISPLAY,20'b0};
  139: oInstruction = {`STO,`R11,20'd1};
  140: oInstruction = {`STO,`R12,20'd2};
  141: oInstruction = {`CALL,`DISPLAY,20'b0};
  142: oInstruction = {`STO,`R11,20'd22};
  143: oInstruction = {`STO,`R12,20'd8};
  144: oInstruction = {`CALL,`DISPLAY,20'b0};
  145: oInstruction = {`STO,`R11,20'd20};
  146: oInstruction = {`STO,`R12,20'd15};
  147: oInstruction = {`CALL,`DISPLAY,20'b0};
  148: oInstruction = {`STO,`R11,20'd5};
  149: oInstruction = {`STO,`R12,20'd16};
  150: oInstruction = {`CALL,`DISPLAY,20'b0};
  151: oInstruction = {`STO,`R11,20'd35};
  152: oInstruction = {`STO,`R12,20'd14};
  153: oInstruction = {`CALL,`DISPLAY,20'b0};
  154: oInstruction = {`STO,`R11,20'd30};
  155: oInstruction = {`STO,`R12,20'd11};
  156: oInstruction = {`CALL,`DISPLAY,20'b0};
  157: oInstruction = {`POP,`R12,20'b0};
  158: oInstruction = {`POP,`R11,20'b0};
  159: oInstruction = {`POP,`R10,20'b0};
  160: oInstruction = {`POP,`RA,20'b0};
  161: oInstruction = {`NOP,30'b0};
  162: oInstruction = {`RET,20'b0,`RA};
// PINTAR_JUGADOR:
  163: oInstruction = {`NOP,30'b0};
  164: oInstruction = {`PUSH,20'b0,`RA};
  165: oInstruction = {`PUSH,20'b0,`R18};
  166: oInstruction = {`PUSH,20'b0,`R19};
  167: oInstruction = {`STO,`R10,10'b0,`COLOR_MAGENTA};
  168: oInstruction = {`STO,`R18,20'd1};
  169: oInstruction = {`STO,`R19,20'd4};
  170: oInstruction = {`ADD,`R11,`R20,`R0};
  171: oInstruction = {`ADD,`R12,`R21,`R0};
  172: oInstruction = {`ADD,`R15,`R20,`R18};
  173: oInstruction = {`ADD,`R16,`R21,`R19};
  174: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  175: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  176: oInstruction = {`ADD,`R11,`R20,`R18};
  177: oInstruction = {`ADD,`R12,`R21,`R19};
  178: oInstruction = {`ADD,`R15,`R20,`R1};
  179: oInstruction = {`ADD,`R16,`R21,`R19};
  180: oInstruction = {`NOP,30'd0};
  181: oInstruction = {`SUB,`R16,`R16,`R1};
  182: oInstruction = {`NOP,30'd0};
  183: oInstruction = {`SUB,`R16,`R16,`R1};
  184: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  185: oInstruction = {`POP,`R19,20'b0};
  186: oInstruction = {`POP,`R18,20'b0};
  187: oInstruction = {`POP,`RA,20'b0};
  188: oInstruction = {`NOP,30'b0};
  189: oInstruction = {`RET,20'b0,`RA};
// PINTAR_LUNA:
  190: oInstruction = {`NOP,30'b0};
  191: oInstruction = {`PUSH,20'b0,`RA};
  192: oInstruction = {`PUSH,20'b0,`R15};
  193: oInstruction = {`PUSH,20'b0,`R16};
  194: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  195: oInstruction = {`STO,`R11,20'd33};
  196: oInstruction = {`STO,`R12,20'd3};
  197: oInstruction = {`STO,`R15,20'd34};
  198: oInstruction = {`STO,`R16,20'd3};
  199: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  200: oInstruction = {`STO,`R11,20'd34};
  201: oInstruction = {`STO,`R12,20'd4};
  202: oInstruction = {`STO,`R15,20'd35};
  203: oInstruction = {`STO,`R16,20'd5};
  204: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  205: oInstruction = {`STO,`R11,20'd33};
  206: oInstruction = {`STO,`R12,20'd6};
  207: oInstruction = {`STO,`R15,20'd34};
  208: oInstruction = {`STO,`R16,20'd6};
  209: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  210: oInstruction = {`POP,`R16,20'b0};
  211: oInstruction = {`POP,`R15,20'b0};
  212: oInstruction = {`POP,`RA,20'b0};
  213: oInstruction = {`NOP,30'b0};
  214: oInstruction = {`RET,20'b0,`RA};
// PINTAR_OBSTACULO:
  215: oInstruction = {`NOP,30'b0};
  216: oInstruction = {`PUSH,20'b0,`RA};
  217: oInstruction = {`PUSH,20'b0,`R24};
  218: oInstruction = {`PUSH,20'b0,`R25};
  219: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  220: oInstruction = {`STO,`R18,20'd2};
  221: oInstruction = {`STO,`R19,20'd2};
  222: oInstruction = {`ADD,`R11,`R24,`R0};
  223: oInstruction = {`ADD,`R12,`R25,`R0};
  224: oInstruction = {`ADD,`R15,`R24,`R18};
  225: oInstruction = {`ADD,`R16,`R25,`R19};
  226: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  227: oInstruction = {`POP,`R25,20'b0};
  228: oInstruction = {`POP,`R24,20'b0};
  229: oInstruction = {`POP,`RA,20'b0};
  230: oInstruction = {`NOP,30'b0};
  231: oInstruction = {`RET,20'b0,`RA};
// PINTAR_RECTANGULO:
  232: oInstruction = {`NOP,30'b0};
  233: oInstruction = {`PUSH,20'b0,`RA};
  234: oInstruction = {`PUSH,20'b0,`R3};
  235: oInstruction = {`ADD,`R3,`R11,`R0};
  236: oInstruction = {`NOP,30'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  237: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  238: oInstruction = {`CALL,`DISPLAY,20'b0};
  239: oInstruction = {`ADD,`R11,`R11,`R1};
  240: oInstruction = {`NOP,30'b0};
  241: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  242: oInstruction = {`ADD,`R12,`R12,`R1};
  243: oInstruction = {`NOP,30'b0};
  244: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  245: oInstruction = {`POP,`R3,20'b0};
  246: oInstruction = {`POP,`RA,20'b0};
  247: oInstruction = {`NOP,30'b0};
  248: oInstruction = {`RET,20'b0,`RA};
// PINTAR_SOL:
  249: oInstruction = {`NOP,30'b0};
  250: oInstruction = {`PUSH,20'b0,`RA};
  251: oInstruction = {`PUSH,20'b0,`R15};
  252: oInstruction = {`PUSH,20'b0,`R16};
  253: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  254: oInstruction = {`STO,`R11,20'd34};
  255: oInstruction = {`STO,`R12,20'd3};
  256: oInstruction = {`STO,`R15,20'd35};
  257: oInstruction = {`STO,`R16,20'd6};
  258: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  259: oInstruction = {`STO,`R11,20'd33};
  260: oInstruction = {`STO,`R12,20'd4};
  261: oInstruction = {`STO,`R15,20'd36};
  262: oInstruction = {`STO,`R16,20'd5};
  263: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  264: oInstruction = {`POP,`R16,20'b0};
  265: oInstruction = {`POP,`R15,20'b0};
  266: oInstruction = {`POP,`RA,20'b0};
  267: oInstruction = {`NOP,30'b0};
  268: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_DIA:
  269: oInstruction = {`NOP,30'b0};
  270: oInstruction = {`PUSH,20'b0,`RA};
  271: oInstruction = {`PUSH,20'b0,`R16};
  272: oInstruction = {`PUSH,20'b0,`R15};
  273: oInstruction = {`STO,`R10,10'b0,`COLOR_CYAN};
  274: oInstruction = {`STO,`R11,20'd0};
  275: oInstruction = {`STO,`R12,20'd0};
  276: oInstruction = {`STO,`R13,20'd40};
  277: oInstruction = {`STO,`R15,20'd39};
  278: oInstruction = {`STO,`R16,20'd18};
  279: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  280: oInstruction = {`POP,`R15,20'b0};
  281: oInstruction = {`POP,`R16,20'b0};
  282: oInstruction = {`POP,`RA,20'b0};
  283: oInstruction = {`NOP,30'b0};
  284: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_NOCHE:
  285: oInstruction = {`NOP,30'b0};
  286: oInstruction = {`PUSH,20'b0,`RA};
  287: oInstruction = {`PUSH,20'b0,`R16};
  288: oInstruction = {`PUSH,20'b0,`R15};
  289: oInstruction = {`PUSH,20'b0,`R11};
  290: oInstruction = {`PUSH,20'b0,`R12};
  291: oInstruction = {`STO,`R10,10'b0,`COLOR_BLACK};
  292: oInstruction = {`STO,`R11,20'd0};
  293: oInstruction = {`STO,`R12,20'd0};
  294: oInstruction = {`STO,`R13,20'd40};
  295: oInstruction = {`STO,`R15,20'd40};
  296: oInstruction = {`STO,`R16,20'd18};
  297: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  298: oInstruction = {`POP,`R12,20'b0};
  299: oInstruction = {`POP,`R11,20'b0};
  300: oInstruction = {`POP,`R15,20'b0};
  301: oInstruction = {`POP,`R16,20'b0};
  302: oInstruction = {`POP,`RA,20'b0};
  303: oInstruction = {`NOP,30'b0};
  304: oInstruction = {`RET,20'b0,`RA};
// PONER_ZACATE:
  305: oInstruction = {`NOP,20'b0};
  306: oInstruction = {`PUSH,20'b0,`RA};
  307: oInstruction = {`PUSH,20'b0,`R16};
  308: oInstruction = {`PUSH,20'b0,`R15};
  309: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  310: oInstruction = {`STO,`R11,20'd0};
  311: oInstruction = {`STO,`R12,20'd18};
  312: oInstruction = {`STO,`R15,20'd40};
  313: oInstruction = {`STO,`R16,20'd30};
  314: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  315: oInstruction = {`POP,`R15,20'b0};
  316: oInstruction = {`POP,`R16,20'b0};
  317: oInstruction = {`POP,`RA,20'b0};
  318: oInstruction = {`NOP,20'b0};
  319: oInstruction = {`RET,20'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
