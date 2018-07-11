`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 10'd3
`define BEGIN_GAME 10'd28
`define JUEGO 10'd36
`define DELAY_MAIN1 10'd43
`define DONT_OBST1 10'd49
`define DONT_OBST_2 10'd52
`define CONTINUE_MAIN1 10'd59
`define DELAY_MAIN2 10'd67
`define DONT_OBST2 10'd74
`define DONT_OBST_22 10'd77
`define CONTINUE_MAIN2 10'd85
`define GAME_LOST 10'd87
`define FIN 10'd94
`define BORRAR_JUGADOR 10'd99
`define BORRAR_OBSTACULO1 10'd120
`define BORRAR_OBSTACULO2 10'd141
`define CHEQUEAR_DERROTA 10'd162
`define PLAYER_UP 10'd169
`define PLAYER_DOWN 10'd178
`define DERROTADO 10'd187
`define NO_DERROTA 10'd190
`define DELAY_US_FIX 10'd193
`define DELAY_US_FIX_LOOP_1 10'd196
`define DELAY_MS_FIX 10'd201
`define DELAY_MS_FIX_LOOP_1 10'd204
`define DISPLAY 10'd209
`define MOVIMIENTO 10'd220
`define CHEQUEAR_BAJAR_MOVIMIENTO 10'd233
`define SUBIR_MOVIMIENTO 10'd235
`define BAJAR_MOVIMIENTO 10'd239
`define TERMINAR_MOVIMIENTO 10'd243
`define MOVIMIENTO_OBST2 10'd247
`define NON_RESET_OBST2 10'd254
`define TERMINAR_OBST_MOV2 10'd257
`define MOVIMIENTO_OBST1 10'd260
`define NON_RESET_OBST 10'd268
`define TERMINAR_OBST_MOV1 10'd271
`define PINTAR_ESTRELLAS 10'd275
`define PINTAR_JUGADOR 10'd317
`define PINTAR_LUNA 10'd344
`define PINTAR_NUBES 10'd369
`define PINTAR_OBSTACULO1 10'd402
`define PINTAR_OBSTACULO2 10'd419
`define PINTAR_RECTANGULO 10'd436
`define LOOP_VERTICAL_PINTAR_RECTANGULO 10'd441
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 10'd442
`define PINTAR_SOL 10'd453
`define PONER_CIELO_DIA 10'd473
`define PONER_CIELO_NOCHE 10'd489
`define PONER_ZACATE 10'd509

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
  13: oInstruction = {`STO,`R22,20'd35};
  14: oInstruction = {`STO,`R23,20'd27};
  15: oInstruction = {`STO,`R3,20'd0};
  16: oInstruction = {`STO,`R2,20'd6000};
  17: oInstruction = {`STO,`R4,20'd37};
  18: oInstruction = {`STO,`R5,20'd100};
  19: oInstruction = {`STO,`R6,20'd0};
  20: oInstruction = {`STO,`R7,20'd50};
  21: oInstruction = {`CALL,`PONER_CIELO_DIA,20'b0};
  22: oInstruction = {`CALL,`PINTAR_SOL,20'b0};
  23: oInstruction = {`CALL,`PINTAR_NUBES,20'b0};
  24: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  25: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  26: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  27: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
// BEGIN_GAME:
  28: oInstruction = {`STO,`T1,20'h1D};
  29: oInstruction = {`STO,`T2,20'h1B};
  30: oInstruction = {`TEC,`T3,20'b0};
  31: oInstruction = {`NOP,30'b0};
  32: oInstruction = {`BEQ,`JUEGO,`T3,`T1};
  33: oInstruction = {`BEQ,`JUEGO,`T3,`T2};
  34: oInstruction = {`NOP,30'b0};
  35: oInstruction = {`JMP,`BEGIN_GAME,20'd0};
// JUEGO:
  36: oInstruction = {`CALL,`PONER_CIELO_DIA,20'b0};
  37: oInstruction = {`CALL,`PINTAR_SOL,20'b0};
  38: oInstruction = {`CALL,`PINTAR_NUBES,20'b0};
  39: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  40: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  41: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  42: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
// DELAY_MAIN1:
  43: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  44: oInstruction = {`ADD,`R3,`R3,`R1};
  45: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  46: oInstruction = {`BLE,`DONT_OBST1,`R4,`R5};
  47: oInstruction = {`CALL,`MOVIMIENTO_OBST1,20'b0};
  48: oInstruction = {`STO,`R4,20'd0};
// DONT_OBST1:
  49: oInstruction = {`BLE,`DONT_OBST_2,`R6,`R7};
  50: oInstruction = {`CALL,`MOVIMIENTO_OBST2,20'b0};
  51: oInstruction = {`STO,`R6,20'd0};
// DONT_OBST_2:
  52: oInstruction = {`NOP,30'b0};
  53: oInstruction = {`ADD,`R6,`R6,`R1};
  54: oInstruction = {`ADD,`R4,`R4,`R1};
  55: oInstruction = {`CALL,`CHEQUEAR_DERROTA,20'b0};
  56: oInstruction = {`BEQ,`CONTINUE_MAIN1,`R2,`R3};
  57: oInstruction = {`NOP,30'b0};
  58: oInstruction = {`JMP,`DELAY_MAIN1,20'd0};
// CONTINUE_MAIN1:
  59: oInstruction = {`STO,`R3,20'd0};
  60: oInstruction = {`CALL,`PONER_CIELO_NOCHE,20'b0};
  61: oInstruction = {`CALL,`PINTAR_LUNA,20'b0};
  62: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  63: oInstruction = {`CALL,`PINTAR_ESTRELLAS,20'b0};
  64: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  65: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  66: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
// DELAY_MAIN2:
  67: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  68: oInstruction = {`ADD,`R3,`R3,`R1};
  69: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  70: oInstruction = {`BLE,`DONT_OBST2,`R4,`R5};
  71: oInstruction = {`NOP,30'b0};
  72: oInstruction = {`CALL,`MOVIMIENTO_OBST1,20'b0};
  73: oInstruction = {`STO,`R4,20'd0};
// DONT_OBST2:
  74: oInstruction = {`BLE,`DONT_OBST_22,`R6,`R7};
  75: oInstruction = {`CALL,`MOVIMIENTO_OBST2,20'b0};
  76: oInstruction = {`STO,`R6,20'd0};
// DONT_OBST_22:
  77: oInstruction = {`NOP,30'b0};
  78: oInstruction = {`ADD,`R6,`R6,`R1};
  79: oInstruction = {`NOP,30'b0};
  80: oInstruction = {`ADD,`R4,`R4,`R1};
  81: oInstruction = {`CALL,`CHEQUEAR_DERROTA,20'b0};
  82: oInstruction = {`BEQ,`CONTINUE_MAIN2,`R2,`R3};
  83: oInstruction = {`NOP,30'b0};
  84: oInstruction = {`JMP,`DELAY_MAIN2,20'd0};
// CONTINUE_MAIN2:
  85: oInstruction = {`STO,`R3,20'd0};
  86: oInstruction = {`JMP,`JUEGO,20'b0};
// GAME_LOST:
  87: oInstruction = {`CALL,`PONER_CIELO_NOCHE,20'b0};
  88: oInstruction = {`CALL,`PINTAR_LUNA,20'b0};
  89: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  90: oInstruction = {`CALL,`PINTAR_ESTRELLAS,20'b0};
  91: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  92: oInstruction = {`STO,`T7,20'h29};
  93: oInstruction = {`NOP,30'b0};
// FIN:
  94: oInstruction = {`TEC,`T3,20'b0};
  95: oInstruction = {`NOP,30'b0};
  96: oInstruction = {`BEQ,`INICIO,`T3,`T7};
  97: oInstruction = {`NOP,30'b0};
  98: oInstruction = {`JMP,`FIN,20'b0};
// BORRAR_JUGADOR:
  99: oInstruction = {`NOP,30'b0};
  100: oInstruction = {`PUSH,20'b0,`RA};
  101: oInstruction = {`PUSH,20'b0,`R15};
  102: oInstruction = {`PUSH,20'b0,`R16};
  103: oInstruction = {`PUSH,20'b0,`R18};
  104: oInstruction = {`PUSH,20'b0,`R19};
  105: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  106: oInstruction = {`STO,`R18,20'd1};
  107: oInstruction = {`STO,`R19,20'd4};
  108: oInstruction = {`ADD,`R11,`R20,`R0};
  109: oInstruction = {`ADD,`R12,`R21,`R0};
  110: oInstruction = {`ADD,`R15,`R20,`R18};
  111: oInstruction = {`ADD,`R16,`R21,`R19};
  112: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  113: oInstruction = {`POP,`R19,20'b0};
  114: oInstruction = {`POP,`R18,20'b0};
  115: oInstruction = {`POP,`R16,20'b0};
  116: oInstruction = {`POP,`R15,20'b0};
  117: oInstruction = {`POP,`RA,20'b0};
  118: oInstruction = {`NOP,30'b0};
  119: oInstruction = {`RET,20'b0,`RA};
// BORRAR_OBSTACULO1:
  120: oInstruction = {`NOP,30'b0};
  121: oInstruction = {`PUSH,20'b0,`RA};
  122: oInstruction = {`PUSH,20'b0,`R15};
  123: oInstruction = {`PUSH,20'b0,`R16};
  124: oInstruction = {`PUSH,20'b0,`R18};
  125: oInstruction = {`PUSH,20'b0,`R19};
  126: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  127: oInstruction = {`STO,`R18,20'd2};
  128: oInstruction = {`STO,`R19,20'd1};
  129: oInstruction = {`ADD,`R11,`R24,`R0};
  130: oInstruction = {`ADD,`R12,`R25,`R0};
  131: oInstruction = {`ADD,`R15,`R24,`R18};
  132: oInstruction = {`ADD,`R16,`R25,`R19};
  133: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  134: oInstruction = {`POP,`R19,20'b0};
  135: oInstruction = {`POP,`R18,20'b0};
  136: oInstruction = {`POP,`R16,20'b0};
  137: oInstruction = {`POP,`R15,20'b0};
  138: oInstruction = {`POP,`RA,20'b0};
  139: oInstruction = {`NOP,30'b0};
  140: oInstruction = {`RET,20'b0,`RA};
// BORRAR_OBSTACULO2:
  141: oInstruction = {`NOP,30'b0};
  142: oInstruction = {`PUSH,20'b0,`RA};
  143: oInstruction = {`PUSH,20'b0,`R15};
  144: oInstruction = {`PUSH,20'b0,`R16};
  145: oInstruction = {`PUSH,20'b0,`R18};
  146: oInstruction = {`PUSH,20'b0,`R19};
  147: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  148: oInstruction = {`STO,`R18,20'd1};
  149: oInstruction = {`STO,`R19,20'd2};
  150: oInstruction = {`ADD,`R11,`R22,`R0};
  151: oInstruction = {`ADD,`R12,`R23,`R0};
  152: oInstruction = {`ADD,`R15,`R22,`R18};
  153: oInstruction = {`ADD,`R16,`R23,`R19};
  154: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  155: oInstruction = {`POP,`R19,20'b0};
  156: oInstruction = {`POP,`R18,20'b0};
  157: oInstruction = {`POP,`R16,20'b0};
  158: oInstruction = {`POP,`R15,20'b0};
  159: oInstruction = {`POP,`RA,20'b0};
  160: oInstruction = {`NOP,30'b0};
  161: oInstruction = {`RET,20'b0,`RA};
// CHEQUEAR_DERROTA:
  162: oInstruction = {`NOP,30'b0};
  163: oInstruction = {`PUSH,20'b0,`RA};
  164: oInstruction = {`STO,`T1,20'd19};
  165: oInstruction = {`STO,`T2,20'd24};
  166: oInstruction = {`STO,`T3,20'd6};
  167: oInstruction = {`BEQ,`PLAYER_UP,`R21,`T1};
  168: oInstruction = {`BEQ,`PLAYER_DOWN,`R21,`T2};
// PLAYER_UP:
  169: oInstruction = {`BEQ,`DERROTADO,`R24,`T3};
  170: oInstruction = {`SUB,`T3,`T3,`R1};
  171: oInstruction = {`NOP,30'b0};
  172: oInstruction = {`BEQ,`DERROTADO,`R24,`T3};
  173: oInstruction = {`SUB,`T3,`T3,`R1};
  174: oInstruction = {`NOP,30'b0};
  175: oInstruction = {`BEQ,`DERROTADO,`R24,`T3};
  176: oInstruction = {`NOP,30'b0};
  177: oInstruction = {`JMP,`NO_DERROTA,20'd0};
// PLAYER_DOWN:
  178: oInstruction = {`BEQ,`DERROTADO,`R22,`T3};
  179: oInstruction = {`SUB,`T3,`T3,`R1};
  180: oInstruction = {`NOP,30'b0};
  181: oInstruction = {`BEQ,`DERROTADO,`R22,`T3};
  182: oInstruction = {`SUB,`T3,`T3,`R1};
  183: oInstruction = {`NOP,30'b0};
  184: oInstruction = {`BEQ,`DERROTADO,`R22,`T3};
  185: oInstruction = {`NOP,30'b0};
  186: oInstruction = {`JMP,`NO_DERROTA,20'd0};
// DERROTADO:
  187: oInstruction = {`POP,`RA,20'b0};
  188: oInstruction = {`NOP,30'b0};
  189: oInstruction = {`JMP,`GAME_LOST,20'd0};
// NO_DERROTA:
  190: oInstruction = {`POP,`RA,20'b0};
  191: oInstruction = {`NOP,30'b0};
  192: oInstruction = {`RET,20'b0,`RA};
// DELAY_US_FIX:
  193: oInstruction = {`NOP,30'b0};
  194: oInstruction = {`STO,`T1,20'b0};
  195: oInstruction = {`STO,`T2,20'd20};
// DELAY_US_FIX_LOOP_1:
  196: oInstruction = {`ADD,`T1,`T1,`R1};
  197: oInstruction = {`BLE,`DELAY_US_FIX_LOOP_1,`T1,`T2};
  198: oInstruction = {`NOP,30'b0};
  199: oInstruction = {`NOP,30'b0};
  200: oInstruction = {`RET,20'b0,`RA};
// DELAY_MS_FIX:
  201: oInstruction = {`NOP,30'b0};
  202: oInstruction = {`STO,`T1,20'b0};
  203: oInstruction = {`STO,`T2,20'd24995};
// DELAY_MS_FIX_LOOP_1:
  204: oInstruction = {`ADD,`T1,`T1,`R1};
  205: oInstruction = {`BLE,`DELAY_MS_FIX_LOOP_1,`T1,`T2};
  206: oInstruction = {`NOP,30'b0};
  207: oInstruction = {`NOP,30'b0};
  208: oInstruction = {`RET,20'b0,`RA};
// DISPLAY:
  209: oInstruction = {`NOP,30'b0};
  210: oInstruction = {`PUSH,20'b0,`RA};
  211: oInstruction = {`NOP,30'b0};
  212: oInstruction = {`MUL,`T1,`R12,`R13};
  213: oInstruction = {`NOP,30'b0};
  214: oInstruction = {`ADD,`T1,`T1,`R11};
  215: oInstruction = {`NOP,30'b0};
  216: oInstruction = {`VGA,10'b0,`R10,`T1};
  217: oInstruction = {`POP,`RA,20'b0};
  218: oInstruction = {`NOP,30'b0};
  219: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO:
  220: oInstruction = {`NOP,30'b0};
  221: oInstruction = {`PUSH,20'b0,`RA};
  222: oInstruction = {`PUSH,20'b0,`R22};
  223: oInstruction = {`STO,`T1,20'h1D};
  224: oInstruction = {`STO,`T2,20'h1B};
  225: oInstruction = {`STO,`T3,20'd19};
  226: oInstruction = {`STO,`R22,20'b0};
  227: oInstruction = {`NOP,30'b0};
  228: oInstruction = {`TEC,`R22,20'b0};
  229: oInstruction = {`NOP,30'b0};
  230: oInstruction = {`BEQ,`CHEQUEAR_BAJAR_MOVIMIENTO,`R21,`T3};
  231: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  232: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// CHEQUEAR_BAJAR_MOVIMIENTO:
  233: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  234: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// SUBIR_MOVIMIENTO:
  235: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  236: oInstruction = {`STO,`R21,20'd19};
  237: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  238: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// BAJAR_MOVIMIENTO:
  239: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  240: oInstruction = {`STO,`R21,20'd24};
  241: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  242: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// TERMINAR_MOVIMIENTO:
  243: oInstruction = {`POP,`R22,20'b0};
  244: oInstruction = {`POP,`RA,20'b0};
  245: oInstruction = {`NOP,30'b0};
  246: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO_OBST2:
  247: oInstruction = {`NOP,30'b0};
  248: oInstruction = {`PUSH,20'b0,`RA};
  249: oInstruction = {`CALL,`BORRAR_OBSTACULO2,20'b0};
  250: oInstruction = {`BLE,`NON_RESET_OBST2,`R1,`R22};
  251: oInstruction = {`STO,`R22,20'd35};
  252: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
  253: oInstruction = {`JMP,`TERMINAR_OBST_MOV2,20'b0};
// NON_RESET_OBST2:
  254: oInstruction = {`SUB,`R22,`R22,`R1};
  255: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
  256: oInstruction = {`JMP,`TERMINAR_OBST_MOV2,20'b0};
// TERMINAR_OBST_MOV2:
  257: oInstruction = {`POP,`RA,20'b0};
  258: oInstruction = {`NOP,30'b0};
  259: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO_OBST1:
  260: oInstruction = {`NOP,30'b0};
  261: oInstruction = {`PUSH,20'b0,`RA};
  262: oInstruction = {`PUSH,20'b0,`R22};
  263: oInstruction = {`CALL,`BORRAR_OBSTACULO1,20'b0};
  264: oInstruction = {`BLE,`NON_RESET_OBST,`R1,`R24};
  265: oInstruction = {`STO,`R24,20'd35};
  266: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  267: oInstruction = {`JMP,`TERMINAR_OBST_MOV1,20'b0};
// NON_RESET_OBST:
  268: oInstruction = {`SUB,`R24,`R24,`R1};
  269: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  270: oInstruction = {`JMP,`TERMINAR_OBST_MOV1,20'b0};
// TERMINAR_OBST_MOV1:
  271: oInstruction = {`POP,`R22,20'b0};
  272: oInstruction = {`POP,`RA,20'b0};
  273: oInstruction = {`NOP,30'b0};
  274: oInstruction = {`RET,20'b0,`RA};
// PINTAR_ESTRELLAS:
  275: oInstruction = {`NOP,30'b0};
  276: oInstruction = {`PUSH,20'b0,`RA};
  277: oInstruction = {`PUSH,20'b0,`R10};
  278: oInstruction = {`PUSH,20'b0,`R11};
  279: oInstruction = {`PUSH,20'b0,`R12};
  280: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  281: oInstruction = {`STO,`R11,20'd5};
  282: oInstruction = {`STO,`R12,20'd7};
  283: oInstruction = {`CALL,`DISPLAY,20'b0};
  284: oInstruction = {`STO,`R11,20'd10};
  285: oInstruction = {`STO,`R12,20'd10};
  286: oInstruction = {`CALL,`DISPLAY,20'b0};
  287: oInstruction = {`STO,`R11,20'd20};
  288: oInstruction = {`STO,`R12,20'd3};
  289: oInstruction = {`CALL,`DISPLAY,20'b0};
  290: oInstruction = {`STO,`R11,20'd12};
  291: oInstruction = {`STO,`R12,20'd7};
  292: oInstruction = {`CALL,`DISPLAY,20'b0};
  293: oInstruction = {`STO,`R11,20'd1};
  294: oInstruction = {`STO,`R12,20'd2};
  295: oInstruction = {`CALL,`DISPLAY,20'b0};
  296: oInstruction = {`STO,`R11,20'd22};
  297: oInstruction = {`STO,`R12,20'd8};
  298: oInstruction = {`CALL,`DISPLAY,20'b0};
  299: oInstruction = {`STO,`R11,20'd20};
  300: oInstruction = {`STO,`R12,20'd15};
  301: oInstruction = {`CALL,`DISPLAY,20'b0};
  302: oInstruction = {`STO,`R11,20'd5};
  303: oInstruction = {`STO,`R12,20'd16};
  304: oInstruction = {`CALL,`DISPLAY,20'b0};
  305: oInstruction = {`STO,`R11,20'd35};
  306: oInstruction = {`STO,`R12,20'd14};
  307: oInstruction = {`CALL,`DISPLAY,20'b0};
  308: oInstruction = {`STO,`R11,20'd30};
  309: oInstruction = {`STO,`R12,20'd11};
  310: oInstruction = {`CALL,`DISPLAY,20'b0};
  311: oInstruction = {`POP,`R12,20'b0};
  312: oInstruction = {`POP,`R11,20'b0};
  313: oInstruction = {`POP,`R10,20'b0};
  314: oInstruction = {`POP,`RA,20'b0};
  315: oInstruction = {`NOP,30'b0};
  316: oInstruction = {`RET,20'b0,`RA};
// PINTAR_JUGADOR:
  317: oInstruction = {`NOP,30'b0};
  318: oInstruction = {`PUSH,20'b0,`RA};
  319: oInstruction = {`PUSH,20'b0,`R18};
  320: oInstruction = {`PUSH,20'b0,`R19};
  321: oInstruction = {`STO,`R10,10'b0,`COLOR_MAGENTA};
  322: oInstruction = {`STO,`R18,20'd1};
  323: oInstruction = {`STO,`R19,20'd4};
  324: oInstruction = {`ADD,`R11,`R20,`R0};
  325: oInstruction = {`ADD,`R12,`R21,`R0};
  326: oInstruction = {`ADD,`R15,`R20,`R18};
  327: oInstruction = {`ADD,`R16,`R21,`R19};
  328: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  329: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  330: oInstruction = {`ADD,`R11,`R20,`R18};
  331: oInstruction = {`ADD,`R12,`R21,`R19};
  332: oInstruction = {`ADD,`R15,`R20,`R1};
  333: oInstruction = {`ADD,`R16,`R21,`R19};
  334: oInstruction = {`NOP,30'd0};
  335: oInstruction = {`SUB,`R16,`R16,`R1};
  336: oInstruction = {`NOP,30'd0};
  337: oInstruction = {`SUB,`R16,`R16,`R1};
  338: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  339: oInstruction = {`POP,`R19,20'b0};
  340: oInstruction = {`POP,`R18,20'b0};
  341: oInstruction = {`POP,`RA,20'b0};
  342: oInstruction = {`NOP,30'b0};
  343: oInstruction = {`RET,20'b0,`RA};
// PINTAR_LUNA:
  344: oInstruction = {`NOP,30'b0};
  345: oInstruction = {`PUSH,20'b0,`RA};
  346: oInstruction = {`PUSH,20'b0,`R15};
  347: oInstruction = {`PUSH,20'b0,`R16};
  348: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  349: oInstruction = {`STO,`R11,20'd33};
  350: oInstruction = {`STO,`R12,20'd3};
  351: oInstruction = {`STO,`R15,20'd34};
  352: oInstruction = {`STO,`R16,20'd3};
  353: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  354: oInstruction = {`STO,`R11,20'd34};
  355: oInstruction = {`STO,`R12,20'd4};
  356: oInstruction = {`STO,`R15,20'd35};
  357: oInstruction = {`STO,`R16,20'd5};
  358: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  359: oInstruction = {`STO,`R11,20'd33};
  360: oInstruction = {`STO,`R12,20'd6};
  361: oInstruction = {`STO,`R15,20'd34};
  362: oInstruction = {`STO,`R16,20'd6};
  363: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  364: oInstruction = {`POP,`R16,20'b0};
  365: oInstruction = {`POP,`R15,20'b0};
  366: oInstruction = {`POP,`RA,20'b0};
  367: oInstruction = {`NOP,30'b0};
  368: oInstruction = {`RET,20'b0,`RA};
// PINTAR_NUBES:
  369: oInstruction = {`NOP,30'b0};
  370: oInstruction = {`PUSH,20'b0,`RA};
  371: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  372: oInstruction = {`STO,`R18,20'd5};
  373: oInstruction = {`STO,`R19,20'd2};
  374: oInstruction = {`STO,`T3,20'd3};
  375: oInstruction = {`STO,`T4,20'd3};
  376: oInstruction = {`ADD,`R11,`T3,`R0};
  377: oInstruction = {`ADD,`R12,`T4,`R0};
  378: oInstruction = {`ADD,`R15,`T3,`R18};
  379: oInstruction = {`ADD,`R16,`T4,`R19};
  380: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  381: oInstruction = {`STO,`T3,20'd10};
  382: oInstruction = {`STO,`T4,20'd9};
  383: oInstruction = {`STO,`R18,20'd4};
  384: oInstruction = {`STO,`R19,20'd2};
  385: oInstruction = {`ADD,`R11,`T3,`R0};
  386: oInstruction = {`ADD,`R12,`T4,`R0};
  387: oInstruction = {`ADD,`R15,`T3,`R18};
  388: oInstruction = {`ADD,`R16,`T4,`R19};
  389: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  390: oInstruction = {`STO,`T3,20'd27};
  391: oInstruction = {`STO,`T4,20'd8};
  392: oInstruction = {`STO,`R18,20'd4};
  393: oInstruction = {`STO,`R19,20'd2};
  394: oInstruction = {`ADD,`R11,`T3,`R0};
  395: oInstruction = {`ADD,`R12,`T4,`R0};
  396: oInstruction = {`ADD,`R15,`T3,`R18};
  397: oInstruction = {`ADD,`R16,`T4,`R19};
  398: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  399: oInstruction = {`POP,`RA,20'b0};
  400: oInstruction = {`NOP,30'b0};
  401: oInstruction = {`RET,20'b0,`RA};
// PINTAR_OBSTACULO1:
  402: oInstruction = {`NOP,30'b0};
  403: oInstruction = {`PUSH,20'b0,`RA};
  404: oInstruction = {`PUSH,20'b0,`R24};
  405: oInstruction = {`PUSH,20'b0,`R25};
  406: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  407: oInstruction = {`STO,`R18,20'd1};
  408: oInstruction = {`STO,`R19,20'd1};
  409: oInstruction = {`ADD,`R11,`R24,`R0};
  410: oInstruction = {`ADD,`R12,`R25,`R0};
  411: oInstruction = {`ADD,`R15,`R24,`R18};
  412: oInstruction = {`ADD,`R16,`R25,`R19};
  413: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  414: oInstruction = {`POP,`R25,20'b0};
  415: oInstruction = {`POP,`R24,20'b0};
  416: oInstruction = {`POP,`RA,20'b0};
  417: oInstruction = {`NOP,30'b0};
  418: oInstruction = {`RET,20'b0,`RA};
// PINTAR_OBSTACULO2:
  419: oInstruction = {`NOP,30'b0};
  420: oInstruction = {`PUSH,20'b0,`RA};
  421: oInstruction = {`PUSH,20'b0,`R22};
  422: oInstruction = {`PUSH,20'b0,`R23};
  423: oInstruction = {`STO,`R10,10'b0,`COLOR_RED};
  424: oInstruction = {`STO,`R18,20'd1};
  425: oInstruction = {`STO,`R19,20'd2};
  426: oInstruction = {`ADD,`R11,`R22,`R0};
  427: oInstruction = {`ADD,`R12,`R23,`R0};
  428: oInstruction = {`ADD,`R15,`R22,`R18};
  429: oInstruction = {`ADD,`R16,`R23,`R19};
  430: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  431: oInstruction = {`POP,`R23,20'b0};
  432: oInstruction = {`POP,`R22,20'b0};
  433: oInstruction = {`POP,`RA,20'b0};
  434: oInstruction = {`NOP,30'b0};
  435: oInstruction = {`RET,20'b0,`RA};
// PINTAR_RECTANGULO:
  436: oInstruction = {`NOP,30'b0};
  437: oInstruction = {`PUSH,20'b0,`RA};
  438: oInstruction = {`PUSH,20'b0,`R3};
  439: oInstruction = {`ADD,`R3,`R11,`R0};
  440: oInstruction = {`NOP,30'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  441: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  442: oInstruction = {`CALL,`DISPLAY,20'b0};
  443: oInstruction = {`ADD,`R11,`R11,`R1};
  444: oInstruction = {`NOP,30'b0};
  445: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  446: oInstruction = {`ADD,`R12,`R12,`R1};
  447: oInstruction = {`NOP,30'b0};
  448: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  449: oInstruction = {`POP,`R3,20'b0};
  450: oInstruction = {`POP,`RA,20'b0};
  451: oInstruction = {`NOP,30'b0};
  452: oInstruction = {`RET,20'b0,`RA};
// PINTAR_SOL:
  453: oInstruction = {`NOP,30'b0};
  454: oInstruction = {`PUSH,20'b0,`RA};
  455: oInstruction = {`PUSH,20'b0,`R15};
  456: oInstruction = {`PUSH,20'b0,`R16};
  457: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  458: oInstruction = {`STO,`R11,20'd34};
  459: oInstruction = {`STO,`R12,20'd3};
  460: oInstruction = {`STO,`R15,20'd35};
  461: oInstruction = {`STO,`R16,20'd6};
  462: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  463: oInstruction = {`STO,`R11,20'd33};
  464: oInstruction = {`STO,`R12,20'd4};
  465: oInstruction = {`STO,`R15,20'd36};
  466: oInstruction = {`STO,`R16,20'd5};
  467: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  468: oInstruction = {`POP,`R16,20'b0};
  469: oInstruction = {`POP,`R15,20'b0};
  470: oInstruction = {`POP,`RA,20'b0};
  471: oInstruction = {`NOP,30'b0};
  472: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_DIA:
  473: oInstruction = {`NOP,30'b0};
  474: oInstruction = {`PUSH,20'b0,`RA};
  475: oInstruction = {`PUSH,20'b0,`R16};
  476: oInstruction = {`PUSH,20'b0,`R15};
  477: oInstruction = {`STO,`R10,10'b0,`COLOR_CYAN};
  478: oInstruction = {`STO,`R11,20'd0};
  479: oInstruction = {`STO,`R12,20'd0};
  480: oInstruction = {`STO,`R13,20'd40};
  481: oInstruction = {`STO,`R15,20'd39};
  482: oInstruction = {`STO,`R16,20'd18};
  483: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  484: oInstruction = {`POP,`R15,20'b0};
  485: oInstruction = {`POP,`R16,20'b0};
  486: oInstruction = {`POP,`RA,20'b0};
  487: oInstruction = {`NOP,30'b0};
  488: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_NOCHE:
  489: oInstruction = {`NOP,30'b0};
  490: oInstruction = {`PUSH,20'b0,`RA};
  491: oInstruction = {`PUSH,20'b0,`R16};
  492: oInstruction = {`PUSH,20'b0,`R15};
  493: oInstruction = {`PUSH,20'b0,`R11};
  494: oInstruction = {`PUSH,20'b0,`R12};
  495: oInstruction = {`STO,`R10,10'b0,`COLOR_BLACK};
  496: oInstruction = {`STO,`R11,20'd0};
  497: oInstruction = {`STO,`R12,20'd0};
  498: oInstruction = {`STO,`R13,20'd40};
  499: oInstruction = {`STO,`R15,20'd40};
  500: oInstruction = {`STO,`R16,20'd18};
  501: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  502: oInstruction = {`POP,`R12,20'b0};
  503: oInstruction = {`POP,`R11,20'b0};
  504: oInstruction = {`POP,`R15,20'b0};
  505: oInstruction = {`POP,`R16,20'b0};
  506: oInstruction = {`POP,`RA,20'b0};
  507: oInstruction = {`NOP,30'b0};
  508: oInstruction = {`RET,20'b0,`RA};
// PONER_ZACATE:
  509: oInstruction = {`NOP,20'b0};
  510: oInstruction = {`PUSH,20'b0,`RA};
  511: oInstruction = {`PUSH,20'b0,`R16};
  512: oInstruction = {`PUSH,20'b0,`R15};
  513: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  514: oInstruction = {`STO,`R11,20'd0};
  515: oInstruction = {`STO,`R12,20'd18};
  516: oInstruction = {`STO,`R15,20'd40};
  517: oInstruction = {`STO,`R16,20'd30};
  518: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  519: oInstruction = {`POP,`R15,20'b0};
  520: oInstruction = {`POP,`R16,20'b0};
  521: oInstruction = {`POP,`RA,20'b0};
  522: oInstruction = {`NOP,20'b0};
  523: oInstruction = {`RET,20'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
