`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 10'd3
`define JUEGO 10'd17
`define DELAY_MAIN1 10'd23
`define DONT_OBST1 10'd29
`define CONTINUE_MAIN1 10'd34
`define DELAY_MAIN2 10'd41
`define DONT_OBST2 10'd48
`define CONTINUE_MAIN2 10'd53
`define FIN 10'd56
`define BORRAR_JUGADOR 10'd57
`define BORRAR_OBSTACULO1 10'd78
`define DELAY_US_FIX 10'd99
`define DELAY_US_FIX_LOOP_1 10'd102
`define DELAY_MS_FIX 10'd107
`define DELAY_MS_FIX_LOOP_1 10'd110
`define DISPLAY 10'd115
`define MOVIMIENTO 10'd126
`define CHEQUEAR_BAJAR_MOVIMIENTO 10'd139
`define SUBIR_MOVIMIENTO 10'd141
`define BAJAR_MOVIMIENTO 10'd145
`define TERMINAR_MOVIMIENTO 10'd149
`define MOVIMIENTO_OBST1 10'd153
`define NON_RESET_OBST 10'd161
`define TERMINAR_OBST_MOV1 10'd164
`define PINTAR_ESTRELLAS 10'd168
`define PINTAR_JUGADOR 10'd210
`define PINTAR_LUNA 10'd237
`define PINTAR_OBSTACULO1 10'd262
`define PINTAR_RECTANGULO 10'd279
`define LOOP_VERTICAL_PINTAR_RECTANGULO 10'd284
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 10'd285
`define PINTAR_SOL 10'd296
`define PONER_CIELO_DIA 10'd316
`define PONER_CIELO_NOCHE 10'd332
`define PONER_ZACATE 10'd352

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
  16: oInstruction = {`STO,`R5,20'd100};
// JUEGO:
  17: oInstruction = {`CALL,`PONER_CIELO_NOCHE,20'b0};
  18: oInstruction = {`CALL,`PINTAR_LUNA,20'b0};
  19: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  20: oInstruction = {`CALL,`PINTAR_ESTRELLAS,20'b0};
  21: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  22: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
// DELAY_MAIN1:
  23: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  24: oInstruction = {`ADD,`R3,`R3,`R1};
  25: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  26: oInstruction = {`BLE,`DONT_OBST1,`R4,`R5};
  27: oInstruction = {`CALL,`MOVIMIENTO_OBST1,20'b0};
  28: oInstruction = {`STO,`R4,20'd0};
// DONT_OBST1:
  29: oInstruction = {`NOP,30'b0};
  30: oInstruction = {`ADD,`R4,`R4,`R1};
  31: oInstruction = {`BEQ,`CONTINUE_MAIN1,`R2,`R3};
  32: oInstruction = {`NOP,30'b0};
  33: oInstruction = {`JMP,`DELAY_MAIN1,20'd0};
// CONTINUE_MAIN1:
  34: oInstruction = {`STO,`R3,20'd0};
  35: oInstruction = {`STO,`R4,20'd0};
  36: oInstruction = {`CALL,`PONER_CIELO_DIA,20'b0};
  37: oInstruction = {`CALL,`PINTAR_SOL,20'b0};
  38: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  39: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  40: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
// DELAY_MAIN2:
  41: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  42: oInstruction = {`ADD,`R3,`R3,`R1};
  43: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  44: oInstruction = {`BLE,`DONT_OBST2,`R4,`R5};
  45: oInstruction = {`NOP,30'b0};
  46: oInstruction = {`CALL,`MOVIMIENTO_OBST1,20'b0};
  47: oInstruction = {`STO,`R4,20'd0};
// DONT_OBST2:
  48: oInstruction = {`NOP,30'b0};
  49: oInstruction = {`ADD,`R4,`R4,`R1};
  50: oInstruction = {`BEQ,`CONTINUE_MAIN2,`R2,`R3};
  51: oInstruction = {`NOP,30'b0};
  52: oInstruction = {`JMP,`DELAY_MAIN2,20'd0};
// CONTINUE_MAIN2:
  53: oInstruction = {`STO,`R3,20'd0};
  54: oInstruction = {`STO,`R4,20'd0};
  55: oInstruction = {`JMP,`JUEGO,20'b0};
// FIN:
  56: oInstruction = {`JMP,`FIN,20'b0};
// BORRAR_JUGADOR:
  57: oInstruction = {`NOP,30'b0};
  58: oInstruction = {`PUSH,20'b0,`RA};
  59: oInstruction = {`PUSH,20'b0,`R15};
  60: oInstruction = {`PUSH,20'b0,`R16};
  61: oInstruction = {`PUSH,20'b0,`R18};
  62: oInstruction = {`PUSH,20'b0,`R19};
  63: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  64: oInstruction = {`STO,`R18,20'd1};
  65: oInstruction = {`STO,`R19,20'd4};
  66: oInstruction = {`ADD,`R11,`R20,`R0};
  67: oInstruction = {`ADD,`R12,`R21,`R0};
  68: oInstruction = {`ADD,`R15,`R20,`R18};
  69: oInstruction = {`ADD,`R16,`R21,`R19};
  70: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  71: oInstruction = {`POP,`R19,20'b0};
  72: oInstruction = {`POP,`R18,20'b0};
  73: oInstruction = {`POP,`R16,20'b0};
  74: oInstruction = {`POP,`R15,20'b0};
  75: oInstruction = {`POP,`RA,20'b0};
  76: oInstruction = {`NOP,30'b0};
  77: oInstruction = {`RET,20'b0,`RA};
// BORRAR_OBSTACULO1:
  78: oInstruction = {`NOP,30'b0};
  79: oInstruction = {`PUSH,20'b0,`RA};
  80: oInstruction = {`PUSH,20'b0,`R15};
  81: oInstruction = {`PUSH,20'b0,`R16};
  82: oInstruction = {`PUSH,20'b0,`R18};
  83: oInstruction = {`PUSH,20'b0,`R19};
  84: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  85: oInstruction = {`STO,`R18,20'd2};
  86: oInstruction = {`STO,`R19,20'd1};
  87: oInstruction = {`ADD,`R11,`R24,`R0};
  88: oInstruction = {`ADD,`R12,`R25,`R0};
  89: oInstruction = {`ADD,`R15,`R24,`R18};
  90: oInstruction = {`ADD,`R16,`R25,`R19};
  91: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  92: oInstruction = {`POP,`R19,20'b0};
  93: oInstruction = {`POP,`R18,20'b0};
  94: oInstruction = {`POP,`R16,20'b0};
  95: oInstruction = {`POP,`R15,20'b0};
  96: oInstruction = {`POP,`RA,20'b0};
  97: oInstruction = {`NOP,30'b0};
  98: oInstruction = {`RET,20'b0,`RA};
// DELAY_US_FIX:
  99: oInstruction = {`NOP,30'b0};
  100: oInstruction = {`STO,`T1,20'b0};
  101: oInstruction = {`STO,`T2,20'd20};
// DELAY_US_FIX_LOOP_1:
  102: oInstruction = {`ADD,`T1,`T1,`R1};
  103: oInstruction = {`BLE,`DELAY_US_FIX_LOOP_1,`T1,`T2};
  104: oInstruction = {`NOP,30'b0};
  105: oInstruction = {`NOP,30'b0};
  106: oInstruction = {`RET,20'b0,`RA};
// DELAY_MS_FIX:
  107: oInstruction = {`NOP,30'b0};
  108: oInstruction = {`STO,`T1,20'b0};
  109: oInstruction = {`STO,`T2,20'd24995};
// DELAY_MS_FIX_LOOP_1:
  110: oInstruction = {`ADD,`T1,`T1,`R1};
  111: oInstruction = {`BLE,`DELAY_MS_FIX_LOOP_1,`T1,`T2};
  112: oInstruction = {`NOP,30'b0};
  113: oInstruction = {`NOP,30'b0};
  114: oInstruction = {`RET,20'b0,`RA};
// DISPLAY:
  115: oInstruction = {`NOP,30'b0};
  116: oInstruction = {`PUSH,20'b0,`RA};
  117: oInstruction = {`NOP,30'b0};
  118: oInstruction = {`MUL,`T1,`R12,`R13};
  119: oInstruction = {`NOP,30'b0};
  120: oInstruction = {`ADD,`T1,`T1,`R11};
  121: oInstruction = {`NOP,30'b0};
  122: oInstruction = {`VGA,10'b0,`R10,`T1};
  123: oInstruction = {`POP,`RA,20'b0};
  124: oInstruction = {`NOP,30'b0};
  125: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO:
  126: oInstruction = {`NOP,30'b0};
  127: oInstruction = {`PUSH,20'b0,`RA};
  128: oInstruction = {`PUSH,20'b0,`R22};
  129: oInstruction = {`STO,`T1,20'h1D};
  130: oInstruction = {`STO,`T2,20'h1B};
  131: oInstruction = {`STO,`T3,20'd19};
  132: oInstruction = {`STO,`R22,20'b0};
  133: oInstruction = {`NOP,30'b0};
  134: oInstruction = {`TEC,`R22,20'b0};
  135: oInstruction = {`NOP,30'b0};
  136: oInstruction = {`BEQ,`CHEQUEAR_BAJAR_MOVIMIENTO,`R21,`T3};
  137: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  138: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// CHEQUEAR_BAJAR_MOVIMIENTO:
  139: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  140: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// SUBIR_MOVIMIENTO:
  141: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  142: oInstruction = {`STO,`R21,20'd19};
  143: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  144: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// BAJAR_MOVIMIENTO:
  145: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  146: oInstruction = {`STO,`R21,20'd24};
  147: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  148: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// TERMINAR_MOVIMIENTO:
  149: oInstruction = {`POP,`R22,20'b0};
  150: oInstruction = {`POP,`RA,20'b0};
  151: oInstruction = {`NOP,30'b0};
  152: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO_OBST1:
  153: oInstruction = {`NOP,30'b0};
  154: oInstruction = {`PUSH,20'b0,`RA};
  155: oInstruction = {`PUSH,20'b0,`R22};
  156: oInstruction = {`CALL,`BORRAR_OBSTACULO1,20'b0};
  157: oInstruction = {`BLE,`NON_RESET_OBST,`R1,`R24};
  158: oInstruction = {`STO,`R24,20'd35};
  159: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  160: oInstruction = {`JMP,`TERMINAR_OBST_MOV1,20'b0};
// NON_RESET_OBST:
  161: oInstruction = {`SUB,`R24,`R24,`R1};
  162: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  163: oInstruction = {`JMP,`TERMINAR_OBST_MOV1,20'b0};
// TERMINAR_OBST_MOV1:
  164: oInstruction = {`POP,`R22,20'b0};
  165: oInstruction = {`POP,`RA,20'b0};
  166: oInstruction = {`NOP,30'b0};
  167: oInstruction = {`RET,20'b0,`RA};
// PINTAR_ESTRELLAS:
  168: oInstruction = {`NOP,30'b0};
  169: oInstruction = {`PUSH,20'b0,`RA};
  170: oInstruction = {`PUSH,20'b0,`R10};
  171: oInstruction = {`PUSH,20'b0,`R11};
  172: oInstruction = {`PUSH,20'b0,`R12};
  173: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  174: oInstruction = {`STO,`R11,20'd5};
  175: oInstruction = {`STO,`R12,20'd7};
  176: oInstruction = {`CALL,`DISPLAY,20'b0};
  177: oInstruction = {`STO,`R11,20'd10};
  178: oInstruction = {`STO,`R12,20'd10};
  179: oInstruction = {`CALL,`DISPLAY,20'b0};
  180: oInstruction = {`STO,`R11,20'd20};
  181: oInstruction = {`STO,`R12,20'd3};
  182: oInstruction = {`CALL,`DISPLAY,20'b0};
  183: oInstruction = {`STO,`R11,20'd12};
  184: oInstruction = {`STO,`R12,20'd7};
  185: oInstruction = {`CALL,`DISPLAY,20'b0};
  186: oInstruction = {`STO,`R11,20'd1};
  187: oInstruction = {`STO,`R12,20'd2};
  188: oInstruction = {`CALL,`DISPLAY,20'b0};
  189: oInstruction = {`STO,`R11,20'd22};
  190: oInstruction = {`STO,`R12,20'd8};
  191: oInstruction = {`CALL,`DISPLAY,20'b0};
  192: oInstruction = {`STO,`R11,20'd20};
  193: oInstruction = {`STO,`R12,20'd15};
  194: oInstruction = {`CALL,`DISPLAY,20'b0};
  195: oInstruction = {`STO,`R11,20'd5};
  196: oInstruction = {`STO,`R12,20'd16};
  197: oInstruction = {`CALL,`DISPLAY,20'b0};
  198: oInstruction = {`STO,`R11,20'd35};
  199: oInstruction = {`STO,`R12,20'd14};
  200: oInstruction = {`CALL,`DISPLAY,20'b0};
  201: oInstruction = {`STO,`R11,20'd30};
  202: oInstruction = {`STO,`R12,20'd11};
  203: oInstruction = {`CALL,`DISPLAY,20'b0};
  204: oInstruction = {`POP,`R12,20'b0};
  205: oInstruction = {`POP,`R11,20'b0};
  206: oInstruction = {`POP,`R10,20'b0};
  207: oInstruction = {`POP,`RA,20'b0};
  208: oInstruction = {`NOP,30'b0};
  209: oInstruction = {`RET,20'b0,`RA};
// PINTAR_JUGADOR:
  210: oInstruction = {`NOP,30'b0};
  211: oInstruction = {`PUSH,20'b0,`RA};
  212: oInstruction = {`PUSH,20'b0,`R18};
  213: oInstruction = {`PUSH,20'b0,`R19};
  214: oInstruction = {`STO,`R10,10'b0,`COLOR_MAGENTA};
  215: oInstruction = {`STO,`R18,20'd1};
  216: oInstruction = {`STO,`R19,20'd4};
  217: oInstruction = {`ADD,`R11,`R20,`R0};
  218: oInstruction = {`ADD,`R12,`R21,`R0};
  219: oInstruction = {`ADD,`R15,`R20,`R18};
  220: oInstruction = {`ADD,`R16,`R21,`R19};
  221: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  222: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  223: oInstruction = {`ADD,`R11,`R20,`R18};
  224: oInstruction = {`ADD,`R12,`R21,`R19};
  225: oInstruction = {`ADD,`R15,`R20,`R1};
  226: oInstruction = {`ADD,`R16,`R21,`R19};
  227: oInstruction = {`NOP,30'd0};
  228: oInstruction = {`SUB,`R16,`R16,`R1};
  229: oInstruction = {`NOP,30'd0};
  230: oInstruction = {`SUB,`R16,`R16,`R1};
  231: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  232: oInstruction = {`POP,`R19,20'b0};
  233: oInstruction = {`POP,`R18,20'b0};
  234: oInstruction = {`POP,`RA,20'b0};
  235: oInstruction = {`NOP,30'b0};
  236: oInstruction = {`RET,20'b0,`RA};
// PINTAR_LUNA:
  237: oInstruction = {`NOP,30'b0};
  238: oInstruction = {`PUSH,20'b0,`RA};
  239: oInstruction = {`PUSH,20'b0,`R15};
  240: oInstruction = {`PUSH,20'b0,`R16};
  241: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  242: oInstruction = {`STO,`R11,20'd33};
  243: oInstruction = {`STO,`R12,20'd3};
  244: oInstruction = {`STO,`R15,20'd34};
  245: oInstruction = {`STO,`R16,20'd3};
  246: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  247: oInstruction = {`STO,`R11,20'd34};
  248: oInstruction = {`STO,`R12,20'd4};
  249: oInstruction = {`STO,`R15,20'd35};
  250: oInstruction = {`STO,`R16,20'd5};
  251: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  252: oInstruction = {`STO,`R11,20'd33};
  253: oInstruction = {`STO,`R12,20'd6};
  254: oInstruction = {`STO,`R15,20'd34};
  255: oInstruction = {`STO,`R16,20'd6};
  256: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  257: oInstruction = {`POP,`R16,20'b0};
  258: oInstruction = {`POP,`R15,20'b0};
  259: oInstruction = {`POP,`RA,20'b0};
  260: oInstruction = {`NOP,30'b0};
  261: oInstruction = {`RET,20'b0,`RA};
// PINTAR_OBSTACULO1:
  262: oInstruction = {`NOP,30'b0};
  263: oInstruction = {`PUSH,20'b0,`RA};
  264: oInstruction = {`PUSH,20'b0,`R24};
  265: oInstruction = {`PUSH,20'b0,`R25};
  266: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  267: oInstruction = {`STO,`R18,20'd2};
  268: oInstruction = {`STO,`R19,20'd1};
  269: oInstruction = {`ADD,`R11,`R24,`R0};
  270: oInstruction = {`ADD,`R12,`R25,`R0};
  271: oInstruction = {`ADD,`R15,`R24,`R18};
  272: oInstruction = {`ADD,`R16,`R25,`R19};
  273: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  274: oInstruction = {`POP,`R25,20'b0};
  275: oInstruction = {`POP,`R24,20'b0};
  276: oInstruction = {`POP,`RA,20'b0};
  277: oInstruction = {`NOP,30'b0};
  278: oInstruction = {`RET,20'b0,`RA};
// PINTAR_RECTANGULO:
  279: oInstruction = {`NOP,30'b0};
  280: oInstruction = {`PUSH,20'b0,`RA};
  281: oInstruction = {`PUSH,20'b0,`R3};
  282: oInstruction = {`ADD,`R3,`R11,`R0};
  283: oInstruction = {`NOP,30'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  284: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  285: oInstruction = {`CALL,`DISPLAY,20'b0};
  286: oInstruction = {`ADD,`R11,`R11,`R1};
  287: oInstruction = {`NOP,30'b0};
  288: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  289: oInstruction = {`ADD,`R12,`R12,`R1};
  290: oInstruction = {`NOP,30'b0};
  291: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  292: oInstruction = {`POP,`R3,20'b0};
  293: oInstruction = {`POP,`RA,20'b0};
  294: oInstruction = {`NOP,30'b0};
  295: oInstruction = {`RET,20'b0,`RA};
// PINTAR_SOL:
  296: oInstruction = {`NOP,30'b0};
  297: oInstruction = {`PUSH,20'b0,`RA};
  298: oInstruction = {`PUSH,20'b0,`R15};
  299: oInstruction = {`PUSH,20'b0,`R16};
  300: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  301: oInstruction = {`STO,`R11,20'd34};
  302: oInstruction = {`STO,`R12,20'd3};
  303: oInstruction = {`STO,`R15,20'd35};
  304: oInstruction = {`STO,`R16,20'd6};
  305: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  306: oInstruction = {`STO,`R11,20'd33};
  307: oInstruction = {`STO,`R12,20'd4};
  308: oInstruction = {`STO,`R15,20'd36};
  309: oInstruction = {`STO,`R16,20'd5};
  310: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  311: oInstruction = {`POP,`R16,20'b0};
  312: oInstruction = {`POP,`R15,20'b0};
  313: oInstruction = {`POP,`RA,20'b0};
  314: oInstruction = {`NOP,30'b0};
  315: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_DIA:
  316: oInstruction = {`NOP,30'b0};
  317: oInstruction = {`PUSH,20'b0,`RA};
  318: oInstruction = {`PUSH,20'b0,`R16};
  319: oInstruction = {`PUSH,20'b0,`R15};
  320: oInstruction = {`STO,`R10,10'b0,`COLOR_CYAN};
  321: oInstruction = {`STO,`R11,20'd0};
  322: oInstruction = {`STO,`R12,20'd0};
  323: oInstruction = {`STO,`R13,20'd40};
  324: oInstruction = {`STO,`R15,20'd39};
  325: oInstruction = {`STO,`R16,20'd18};
  326: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  327: oInstruction = {`POP,`R15,20'b0};
  328: oInstruction = {`POP,`R16,20'b0};
  329: oInstruction = {`POP,`RA,20'b0};
  330: oInstruction = {`NOP,30'b0};
  331: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_NOCHE:
  332: oInstruction = {`NOP,30'b0};
  333: oInstruction = {`PUSH,20'b0,`RA};
  334: oInstruction = {`PUSH,20'b0,`R16};
  335: oInstruction = {`PUSH,20'b0,`R15};
  336: oInstruction = {`PUSH,20'b0,`R11};
  337: oInstruction = {`PUSH,20'b0,`R12};
  338: oInstruction = {`STO,`R10,10'b0,`COLOR_BLACK};
  339: oInstruction = {`STO,`R11,20'd0};
  340: oInstruction = {`STO,`R12,20'd0};
  341: oInstruction = {`STO,`R13,20'd40};
  342: oInstruction = {`STO,`R15,20'd40};
  343: oInstruction = {`STO,`R16,20'd18};
  344: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  345: oInstruction = {`POP,`R12,20'b0};
  346: oInstruction = {`POP,`R11,20'b0};
  347: oInstruction = {`POP,`R15,20'b0};
  348: oInstruction = {`POP,`R16,20'b0};
  349: oInstruction = {`POP,`RA,20'b0};
  350: oInstruction = {`NOP,30'b0};
  351: oInstruction = {`RET,20'b0,`RA};
// PONER_ZACATE:
  352: oInstruction = {`NOP,20'b0};
  353: oInstruction = {`PUSH,20'b0,`RA};
  354: oInstruction = {`PUSH,20'b0,`R16};
  355: oInstruction = {`PUSH,20'b0,`R15};
  356: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  357: oInstruction = {`STO,`R11,20'd0};
  358: oInstruction = {`STO,`R12,20'd18};
  359: oInstruction = {`STO,`R15,20'd40};
  360: oInstruction = {`STO,`R16,20'd30};
  361: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  362: oInstruction = {`POP,`R15,20'b0};
  363: oInstruction = {`POP,`R16,20'b0};
  364: oInstruction = {`POP,`RA,20'b0};
  365: oInstruction = {`NOP,20'b0};
  366: oInstruction = {`RET,20'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
