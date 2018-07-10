`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 10'd3
`define BEGIN_GAME 10'd27
`define JUEGO 10'd35
`define DELAY_MAIN1 10'd41
`define DONT_OBST1 10'd47
`define DONT_OBST_2 10'd50
`define CONTINUE_MAIN1 10'd57
`define DELAY_MAIN2 10'd65
`define DONT_OBST2 10'd72
`define DONT_OBST_22 10'd75
`define CONTINUE_MAIN2 10'd83
`define GAME_LOST 10'd85
`define FIN 10'd89
`define BORRAR_JUGADOR 10'd96
`define BORRAR_OBSTACULO1 10'd117
`define BORRAR_OBSTACULO2 10'd138
`define CHEQUEAR_DERROTA 10'd159
`define PLAYER_UP 10'd167
`define PLAYER_DOWN 10'd172
`define DERROTADO 10'd177
`define NO_DERROTA 10'd180
`define DELAY_US_FIX 10'd183
`define DELAY_US_FIX_LOOP_1 10'd186
`define DELAY_MS_FIX 10'd191
`define DELAY_MS_FIX_LOOP_1 10'd194
`define DISPLAY 10'd199
`define MOVIMIENTO 10'd210
`define CHEQUEAR_BAJAR_MOVIMIENTO 10'd223
`define SUBIR_MOVIMIENTO 10'd225
`define BAJAR_MOVIMIENTO 10'd229
`define TERMINAR_MOVIMIENTO 10'd233
`define MOVIMIENTO_OBST2 10'd237
`define NON_RESET_OBST2 10'd244
`define TERMINAR_OBST_MOV2 10'd247
`define MOVIMIENTO_OBST1 10'd250
`define NON_RESET_OBST 10'd258
`define TERMINAR_OBST_MOV1 10'd261
`define PINTAR_ESTRELLAS 10'd265
`define PINTAR_JUGADOR 10'd307
`define PINTAR_LUNA 10'd334
`define PINTAR_OBSTACULO1 10'd359
`define PINTAR_OBSTACULO2 10'd376
`define PINTAR_RECTANGULO 10'd393
`define LOOP_VERTICAL_PINTAR_RECTANGULO 10'd398
`define LOOP_HORIZONTAL_PINTAR_RECTANGULO 10'd399
`define PINTAR_SOL 10'd410
`define PONER_CIELO_DIA 10'd430
`define PONER_CIELO_NOCHE 10'd446
`define PONER_ZACATE 10'd466

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
  14: oInstruction = {`STO,`R23,20'd28};
  15: oInstruction = {`STO,`R3,20'd0};
  16: oInstruction = {`STO,`R2,20'd6000};
  17: oInstruction = {`STO,`R4,20'd37};
  18: oInstruction = {`STO,`R5,20'd100};
  19: oInstruction = {`STO,`R6,20'd0};
  20: oInstruction = {`STO,`R7,20'd50};
  21: oInstruction = {`CALL,`PONER_CIELO_DIA,20'b0};
  22: oInstruction = {`CALL,`PINTAR_SOL,20'b0};
  23: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  24: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  25: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  26: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
// BEGIN_GAME:
  27: oInstruction = {`STO,`T1,20'h1D};
  28: oInstruction = {`STO,`T2,20'h1B};
  29: oInstruction = {`TEC,`T3,20'b0};
  30: oInstruction = {`NOP,30'b0};
  31: oInstruction = {`BEQ,`JUEGO,`T3,`T1};
  32: oInstruction = {`BEQ,`JUEGO,`T3,`T2};
  33: oInstruction = {`NOP,30'b0};
  34: oInstruction = {`JMP,`BEGIN_GAME,20'd0};
// JUEGO:
  35: oInstruction = {`CALL,`PONER_CIELO_DIA,20'b0};
  36: oInstruction = {`CALL,`PINTAR_SOL,20'b0};
  37: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  38: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  39: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  40: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
// DELAY_MAIN1:
  41: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  42: oInstruction = {`ADD,`R3,`R3,`R1};
  43: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  44: oInstruction = {`BLE,`DONT_OBST1,`R4,`R5};
  45: oInstruction = {`CALL,`MOVIMIENTO_OBST1,20'b0};
  46: oInstruction = {`STO,`R4,20'd0};
// DONT_OBST1:
  47: oInstruction = {`BLE,`DONT_OBST_2,`R6,`R7};
  48: oInstruction = {`CALL,`MOVIMIENTO_OBST2,20'b0};
  49: oInstruction = {`STO,`R6,20'd0};
// DONT_OBST_2:
  50: oInstruction = {`NOP,30'b0};
  51: oInstruction = {`ADD,`R6,`R6,`R1};
  52: oInstruction = {`ADD,`R4,`R4,`R1};
  53: oInstruction = {`CALL,`CHEQUEAR_DERROTA,20'b0};
  54: oInstruction = {`BEQ,`CONTINUE_MAIN1,`R2,`R3};
  55: oInstruction = {`NOP,30'b0};
  56: oInstruction = {`JMP,`DELAY_MAIN1,20'd0};
// CONTINUE_MAIN1:
  57: oInstruction = {`STO,`R3,20'd0};
  58: oInstruction = {`CALL,`PONER_CIELO_NOCHE,20'b0};
  59: oInstruction = {`CALL,`PINTAR_LUNA,20'b0};
  60: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  61: oInstruction = {`CALL,`PINTAR_ESTRELLAS,20'b0};
  62: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  63: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  64: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
// DELAY_MAIN2:
  65: oInstruction = {`CALL,`MOVIMIENTO,20'b0};
  66: oInstruction = {`ADD,`R3,`R3,`R1};
  67: oInstruction = {`CALL,`DELAY_MS_FIX,20'b0};
  68: oInstruction = {`BLE,`DONT_OBST2,`R4,`R5};
  69: oInstruction = {`NOP,30'b0};
  70: oInstruction = {`CALL,`MOVIMIENTO_OBST1,20'b0};
  71: oInstruction = {`STO,`R4,20'd0};
// DONT_OBST2:
  72: oInstruction = {`BLE,`DONT_OBST_22,`R6,`R7};
  73: oInstruction = {`CALL,`MOVIMIENTO_OBST2,20'b0};
  74: oInstruction = {`STO,`R6,20'd0};
// DONT_OBST_22:
  75: oInstruction = {`NOP,30'b0};
  76: oInstruction = {`ADD,`R6,`R6,`R1};
  77: oInstruction = {`NOP,30'b0};
  78: oInstruction = {`ADD,`R4,`R4,`R1};
  79: oInstruction = {`CALL,`CHEQUEAR_DERROTA,20'b0};
  80: oInstruction = {`BEQ,`CONTINUE_MAIN2,`R2,`R3};
  81: oInstruction = {`NOP,30'b0};
  82: oInstruction = {`JMP,`DELAY_MAIN2,20'd0};
// CONTINUE_MAIN2:
  83: oInstruction = {`STO,`R3,20'd0};
  84: oInstruction = {`JMP,`JUEGO,20'b0};
// GAME_LOST:
  85: oInstruction = {`CALL,`PONER_CIELO_NOCHE,20'b0};
  86: oInstruction = {`CALL,`PINTAR_LUNA,20'b0};
  87: oInstruction = {`CALL,`PONER_ZACATE,20'b0};
  88: oInstruction = {`CALL,`PINTAR_ESTRELLAS,20'b0};
// FIN:
  89: oInstruction = {`STO,`T7,20'd29};
  90: oInstruction = {`NOP,30'b0};
  91: oInstruction = {`TEC,`T3,20'b0};
  92: oInstruction = {`NOP,30'b0};
  93: oInstruction = {`BEQ,`INICIO,`T3,`T7};
  94: oInstruction = {`NOP,30'b0};
  95: oInstruction = {`JMP,`FIN,20'b0};
// BORRAR_JUGADOR:
  96: oInstruction = {`NOP,30'b0};
  97: oInstruction = {`PUSH,20'b0,`RA};
  98: oInstruction = {`PUSH,20'b0,`R15};
  99: oInstruction = {`PUSH,20'b0,`R16};
  100: oInstruction = {`PUSH,20'b0,`R18};
  101: oInstruction = {`PUSH,20'b0,`R19};
  102: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  103: oInstruction = {`STO,`R18,20'd1};
  104: oInstruction = {`STO,`R19,20'd4};
  105: oInstruction = {`ADD,`R11,`R20,`R0};
  106: oInstruction = {`ADD,`R12,`R21,`R0};
  107: oInstruction = {`ADD,`R15,`R20,`R18};
  108: oInstruction = {`ADD,`R16,`R21,`R19};
  109: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  110: oInstruction = {`POP,`R19,20'b0};
  111: oInstruction = {`POP,`R18,20'b0};
  112: oInstruction = {`POP,`R16,20'b0};
  113: oInstruction = {`POP,`R15,20'b0};
  114: oInstruction = {`POP,`RA,20'b0};
  115: oInstruction = {`NOP,30'b0};
  116: oInstruction = {`RET,20'b0,`RA};
// BORRAR_OBSTACULO1:
  117: oInstruction = {`NOP,30'b0};
  118: oInstruction = {`PUSH,20'b0,`RA};
  119: oInstruction = {`PUSH,20'b0,`R15};
  120: oInstruction = {`PUSH,20'b0,`R16};
  121: oInstruction = {`PUSH,20'b0,`R18};
  122: oInstruction = {`PUSH,20'b0,`R19};
  123: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  124: oInstruction = {`STO,`R18,20'd2};
  125: oInstruction = {`STO,`R19,20'd1};
  126: oInstruction = {`ADD,`R11,`R24,`R0};
  127: oInstruction = {`ADD,`R12,`R25,`R0};
  128: oInstruction = {`ADD,`R15,`R24,`R18};
  129: oInstruction = {`ADD,`R16,`R25,`R19};
  130: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  131: oInstruction = {`POP,`R19,20'b0};
  132: oInstruction = {`POP,`R18,20'b0};
  133: oInstruction = {`POP,`R16,20'b0};
  134: oInstruction = {`POP,`R15,20'b0};
  135: oInstruction = {`POP,`RA,20'b0};
  136: oInstruction = {`NOP,30'b0};
  137: oInstruction = {`RET,20'b0,`RA};
// BORRAR_OBSTACULO2:
  138: oInstruction = {`NOP,30'b0};
  139: oInstruction = {`PUSH,20'b0,`RA};
  140: oInstruction = {`PUSH,20'b0,`R15};
  141: oInstruction = {`PUSH,20'b0,`R16};
  142: oInstruction = {`PUSH,20'b0,`R18};
  143: oInstruction = {`PUSH,20'b0,`R19};
  144: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  145: oInstruction = {`STO,`R18,20'd2};
  146: oInstruction = {`STO,`R19,20'd1};
  147: oInstruction = {`ADD,`R11,`R22,`R0};
  148: oInstruction = {`ADD,`R12,`R23,`R0};
  149: oInstruction = {`ADD,`R15,`R22,`R18};
  150: oInstruction = {`ADD,`R16,`R23,`R19};
  151: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  152: oInstruction = {`POP,`R19,20'b0};
  153: oInstruction = {`POP,`R18,20'b0};
  154: oInstruction = {`POP,`R16,20'b0};
  155: oInstruction = {`POP,`R15,20'b0};
  156: oInstruction = {`POP,`RA,20'b0};
  157: oInstruction = {`NOP,30'b0};
  158: oInstruction = {`RET,20'b0,`RA};
// CHEQUEAR_DERROTA:
  159: oInstruction = {`NOP,30'b0};
  160: oInstruction = {`PUSH,20'b0,`RA};
  161: oInstruction = {`STO,`T1,20'd19};
  162: oInstruction = {`STO,`T2,20'd24};
  163: oInstruction = {`STO,`T3,20'd5};
  164: oInstruction = {`STO,`T4,20'd6};
  165: oInstruction = {`BEQ,`PLAYER_UP,`R21,`T1};
  166: oInstruction = {`BEQ,`PLAYER_DOWN,`R21,`T2};
// PLAYER_UP:
  167: oInstruction = {`BEQ,`DERROTADO,`R24,`T3};
  168: oInstruction = {`NOP,30'b0};
  169: oInstruction = {`BEQ,`DERROTADO,`R24,`T4};
  170: oInstruction = {`NOP,30'b0};
  171: oInstruction = {`JMP,`NO_DERROTA,20'd0};
// PLAYER_DOWN:
  172: oInstruction = {`BEQ,`DERROTADO,`R22,`T3};
  173: oInstruction = {`NOP,30'b0};
  174: oInstruction = {`BEQ,`DERROTADO,`R22,`T4};
  175: oInstruction = {`NOP,30'b0};
  176: oInstruction = {`JMP,`NO_DERROTA,20'd0};
// DERROTADO:
  177: oInstruction = {`POP,`RA,20'b0};
  178: oInstruction = {`NOP,30'b0};
  179: oInstruction = {`JMP,`GAME_LOST,20'd0};
// NO_DERROTA:
  180: oInstruction = {`POP,`RA,20'b0};
  181: oInstruction = {`NOP,30'b0};
  182: oInstruction = {`RET,20'b0,`RA};
// DELAY_US_FIX:
  183: oInstruction = {`NOP,30'b0};
  184: oInstruction = {`STO,`T1,20'b0};
  185: oInstruction = {`STO,`T2,20'd20};
// DELAY_US_FIX_LOOP_1:
  186: oInstruction = {`ADD,`T1,`T1,`R1};
  187: oInstruction = {`BLE,`DELAY_US_FIX_LOOP_1,`T1,`T2};
  188: oInstruction = {`NOP,30'b0};
  189: oInstruction = {`NOP,30'b0};
  190: oInstruction = {`RET,20'b0,`RA};
// DELAY_MS_FIX:
  191: oInstruction = {`NOP,30'b0};
  192: oInstruction = {`STO,`T1,20'b0};
  193: oInstruction = {`STO,`T2,20'd24995};
// DELAY_MS_FIX_LOOP_1:
  194: oInstruction = {`ADD,`T1,`T1,`R1};
  195: oInstruction = {`BLE,`DELAY_MS_FIX_LOOP_1,`T1,`T2};
  196: oInstruction = {`NOP,30'b0};
  197: oInstruction = {`NOP,30'b0};
  198: oInstruction = {`RET,20'b0,`RA};
// DISPLAY:
  199: oInstruction = {`NOP,30'b0};
  200: oInstruction = {`PUSH,20'b0,`RA};
  201: oInstruction = {`NOP,30'b0};
  202: oInstruction = {`MUL,`T1,`R12,`R13};
  203: oInstruction = {`NOP,30'b0};
  204: oInstruction = {`ADD,`T1,`T1,`R11};
  205: oInstruction = {`NOP,30'b0};
  206: oInstruction = {`VGA,10'b0,`R10,`T1};
  207: oInstruction = {`POP,`RA,20'b0};
  208: oInstruction = {`NOP,30'b0};
  209: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO:
  210: oInstruction = {`NOP,30'b0};
  211: oInstruction = {`PUSH,20'b0,`RA};
  212: oInstruction = {`PUSH,20'b0,`R22};
  213: oInstruction = {`STO,`T1,20'h1D};
  214: oInstruction = {`STO,`T2,20'h1B};
  215: oInstruction = {`STO,`T3,20'd19};
  216: oInstruction = {`STO,`R22,20'b0};
  217: oInstruction = {`NOP,30'b0};
  218: oInstruction = {`TEC,`R22,20'b0};
  219: oInstruction = {`NOP,30'b0};
  220: oInstruction = {`BEQ,`CHEQUEAR_BAJAR_MOVIMIENTO,`R21,`T3};
  221: oInstruction = {`BEQ,`SUBIR_MOVIMIENTO,`R22,`T1};
  222: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// CHEQUEAR_BAJAR_MOVIMIENTO:
  223: oInstruction = {`BEQ,`BAJAR_MOVIMIENTO,`R22,`T2};
  224: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// SUBIR_MOVIMIENTO:
  225: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  226: oInstruction = {`STO,`R21,20'd19};
  227: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  228: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// BAJAR_MOVIMIENTO:
  229: oInstruction = {`CALL,`BORRAR_JUGADOR,20'b0};
  230: oInstruction = {`STO,`R21,20'd24};
  231: oInstruction = {`CALL,`PINTAR_JUGADOR,20'b0};
  232: oInstruction = {`JMP,`TERMINAR_MOVIMIENTO,20'b0};
// TERMINAR_MOVIMIENTO:
  233: oInstruction = {`POP,`R22,20'b0};
  234: oInstruction = {`POP,`RA,20'b0};
  235: oInstruction = {`NOP,30'b0};
  236: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO_OBST2:
  237: oInstruction = {`NOP,30'b0};
  238: oInstruction = {`PUSH,20'b0,`RA};
  239: oInstruction = {`CALL,`BORRAR_OBSTACULO2,20'b0};
  240: oInstruction = {`BLE,`NON_RESET_OBST2,`R1,`R22};
  241: oInstruction = {`STO,`R22,20'd35};
  242: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
  243: oInstruction = {`JMP,`TERMINAR_OBST_MOV2,20'b0};
// NON_RESET_OBST2:
  244: oInstruction = {`SUB,`R22,`R22,`R1};
  245: oInstruction = {`CALL,`PINTAR_OBSTACULO2,20'b0};
  246: oInstruction = {`JMP,`TERMINAR_OBST_MOV2,20'b0};
// TERMINAR_OBST_MOV2:
  247: oInstruction = {`POP,`RA,20'b0};
  248: oInstruction = {`NOP,30'b0};
  249: oInstruction = {`RET,20'b0,`RA};
// MOVIMIENTO_OBST1:
  250: oInstruction = {`NOP,30'b0};
  251: oInstruction = {`PUSH,20'b0,`RA};
  252: oInstruction = {`PUSH,20'b0,`R22};
  253: oInstruction = {`CALL,`BORRAR_OBSTACULO1,20'b0};
  254: oInstruction = {`BLE,`NON_RESET_OBST,`R1,`R24};
  255: oInstruction = {`STO,`R24,20'd35};
  256: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  257: oInstruction = {`JMP,`TERMINAR_OBST_MOV1,20'b0};
// NON_RESET_OBST:
  258: oInstruction = {`SUB,`R24,`R24,`R1};
  259: oInstruction = {`CALL,`PINTAR_OBSTACULO1,20'b0};
  260: oInstruction = {`JMP,`TERMINAR_OBST_MOV1,20'b0};
// TERMINAR_OBST_MOV1:
  261: oInstruction = {`POP,`R22,20'b0};
  262: oInstruction = {`POP,`RA,20'b0};
  263: oInstruction = {`NOP,30'b0};
  264: oInstruction = {`RET,20'b0,`RA};
// PINTAR_ESTRELLAS:
  265: oInstruction = {`NOP,30'b0};
  266: oInstruction = {`PUSH,20'b0,`RA};
  267: oInstruction = {`PUSH,20'b0,`R10};
  268: oInstruction = {`PUSH,20'b0,`R11};
  269: oInstruction = {`PUSH,20'b0,`R12};
  270: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  271: oInstruction = {`STO,`R11,20'd5};
  272: oInstruction = {`STO,`R12,20'd7};
  273: oInstruction = {`CALL,`DISPLAY,20'b0};
  274: oInstruction = {`STO,`R11,20'd10};
  275: oInstruction = {`STO,`R12,20'd10};
  276: oInstruction = {`CALL,`DISPLAY,20'b0};
  277: oInstruction = {`STO,`R11,20'd20};
  278: oInstruction = {`STO,`R12,20'd3};
  279: oInstruction = {`CALL,`DISPLAY,20'b0};
  280: oInstruction = {`STO,`R11,20'd12};
  281: oInstruction = {`STO,`R12,20'd7};
  282: oInstruction = {`CALL,`DISPLAY,20'b0};
  283: oInstruction = {`STO,`R11,20'd1};
  284: oInstruction = {`STO,`R12,20'd2};
  285: oInstruction = {`CALL,`DISPLAY,20'b0};
  286: oInstruction = {`STO,`R11,20'd22};
  287: oInstruction = {`STO,`R12,20'd8};
  288: oInstruction = {`CALL,`DISPLAY,20'b0};
  289: oInstruction = {`STO,`R11,20'd20};
  290: oInstruction = {`STO,`R12,20'd15};
  291: oInstruction = {`CALL,`DISPLAY,20'b0};
  292: oInstruction = {`STO,`R11,20'd5};
  293: oInstruction = {`STO,`R12,20'd16};
  294: oInstruction = {`CALL,`DISPLAY,20'b0};
  295: oInstruction = {`STO,`R11,20'd35};
  296: oInstruction = {`STO,`R12,20'd14};
  297: oInstruction = {`CALL,`DISPLAY,20'b0};
  298: oInstruction = {`STO,`R11,20'd30};
  299: oInstruction = {`STO,`R12,20'd11};
  300: oInstruction = {`CALL,`DISPLAY,20'b0};
  301: oInstruction = {`POP,`R12,20'b0};
  302: oInstruction = {`POP,`R11,20'b0};
  303: oInstruction = {`POP,`R10,20'b0};
  304: oInstruction = {`POP,`RA,20'b0};
  305: oInstruction = {`NOP,30'b0};
  306: oInstruction = {`RET,20'b0,`RA};
// PINTAR_JUGADOR:
  307: oInstruction = {`NOP,30'b0};
  308: oInstruction = {`PUSH,20'b0,`RA};
  309: oInstruction = {`PUSH,20'b0,`R18};
  310: oInstruction = {`PUSH,20'b0,`R19};
  311: oInstruction = {`STO,`R10,10'b0,`COLOR_MAGENTA};
  312: oInstruction = {`STO,`R18,20'd1};
  313: oInstruction = {`STO,`R19,20'd4};
  314: oInstruction = {`ADD,`R11,`R20,`R0};
  315: oInstruction = {`ADD,`R12,`R21,`R0};
  316: oInstruction = {`ADD,`R15,`R20,`R18};
  317: oInstruction = {`ADD,`R16,`R21,`R19};
  318: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  319: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  320: oInstruction = {`ADD,`R11,`R20,`R18};
  321: oInstruction = {`ADD,`R12,`R21,`R19};
  322: oInstruction = {`ADD,`R15,`R20,`R1};
  323: oInstruction = {`ADD,`R16,`R21,`R19};
  324: oInstruction = {`NOP,30'd0};
  325: oInstruction = {`SUB,`R16,`R16,`R1};
  326: oInstruction = {`NOP,30'd0};
  327: oInstruction = {`SUB,`R16,`R16,`R1};
  328: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  329: oInstruction = {`POP,`R19,20'b0};
  330: oInstruction = {`POP,`R18,20'b0};
  331: oInstruction = {`POP,`RA,20'b0};
  332: oInstruction = {`NOP,30'b0};
  333: oInstruction = {`RET,20'b0,`RA};
// PINTAR_LUNA:
  334: oInstruction = {`NOP,30'b0};
  335: oInstruction = {`PUSH,20'b0,`RA};
  336: oInstruction = {`PUSH,20'b0,`R15};
  337: oInstruction = {`PUSH,20'b0,`R16};
  338: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  339: oInstruction = {`STO,`R11,20'd33};
  340: oInstruction = {`STO,`R12,20'd3};
  341: oInstruction = {`STO,`R15,20'd34};
  342: oInstruction = {`STO,`R16,20'd3};
  343: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  344: oInstruction = {`STO,`R11,20'd34};
  345: oInstruction = {`STO,`R12,20'd4};
  346: oInstruction = {`STO,`R15,20'd35};
  347: oInstruction = {`STO,`R16,20'd5};
  348: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  349: oInstruction = {`STO,`R11,20'd33};
  350: oInstruction = {`STO,`R12,20'd6};
  351: oInstruction = {`STO,`R15,20'd34};
  352: oInstruction = {`STO,`R16,20'd6};
  353: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  354: oInstruction = {`POP,`R16,20'b0};
  355: oInstruction = {`POP,`R15,20'b0};
  356: oInstruction = {`POP,`RA,20'b0};
  357: oInstruction = {`NOP,30'b0};
  358: oInstruction = {`RET,20'b0,`RA};
// PINTAR_OBSTACULO1:
  359: oInstruction = {`NOP,30'b0};
  360: oInstruction = {`PUSH,20'b0,`RA};
  361: oInstruction = {`PUSH,20'b0,`R24};
  362: oInstruction = {`PUSH,20'b0,`R25};
  363: oInstruction = {`STO,`R10,10'b0,`COLOR_WHITE};
  364: oInstruction = {`STO,`R18,20'd2};
  365: oInstruction = {`STO,`R19,20'd1};
  366: oInstruction = {`ADD,`R11,`R24,`R0};
  367: oInstruction = {`ADD,`R12,`R25,`R0};
  368: oInstruction = {`ADD,`R15,`R24,`R18};
  369: oInstruction = {`ADD,`R16,`R25,`R19};
  370: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  371: oInstruction = {`POP,`R25,20'b0};
  372: oInstruction = {`POP,`R24,20'b0};
  373: oInstruction = {`POP,`RA,20'b0};
  374: oInstruction = {`NOP,30'b0};
  375: oInstruction = {`RET,20'b0,`RA};
// PINTAR_OBSTACULO2:
  376: oInstruction = {`NOP,30'b0};
  377: oInstruction = {`PUSH,20'b0,`RA};
  378: oInstruction = {`PUSH,20'b0,`R22};
  379: oInstruction = {`PUSH,20'b0,`R23};
  380: oInstruction = {`STO,`R10,10'b0,`COLOR_RED};
  381: oInstruction = {`STO,`R18,20'd2};
  382: oInstruction = {`STO,`R19,20'd1};
  383: oInstruction = {`ADD,`R11,`R22,`R0};
  384: oInstruction = {`ADD,`R12,`R23,`R0};
  385: oInstruction = {`ADD,`R15,`R22,`R18};
  386: oInstruction = {`ADD,`R16,`R23,`R19};
  387: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  388: oInstruction = {`POP,`R23,20'b0};
  389: oInstruction = {`POP,`R22,20'b0};
  390: oInstruction = {`POP,`RA,20'b0};
  391: oInstruction = {`NOP,30'b0};
  392: oInstruction = {`RET,20'b0,`RA};
// PINTAR_RECTANGULO:
  393: oInstruction = {`NOP,30'b0};
  394: oInstruction = {`PUSH,20'b0,`RA};
  395: oInstruction = {`PUSH,20'b0,`R3};
  396: oInstruction = {`ADD,`R3,`R11,`R0};
  397: oInstruction = {`NOP,30'b0};
// LOOP_VERTICAL_PINTAR_RECTANGULO:
  398: oInstruction = {`ADD,`R11,`R3,`R0};
// LOOP_HORIZONTAL_PINTAR_RECTANGULO:
  399: oInstruction = {`CALL,`DISPLAY,20'b0};
  400: oInstruction = {`ADD,`R11,`R11,`R1};
  401: oInstruction = {`NOP,30'b0};
  402: oInstruction = {`BLE,`LOOP_HORIZONTAL_PINTAR_RECTANGULO,`R11,`R15};
  403: oInstruction = {`ADD,`R12,`R12,`R1};
  404: oInstruction = {`NOP,30'b0};
  405: oInstruction = {`BLE,`LOOP_VERTICAL_PINTAR_RECTANGULO,`R12,`R16};
  406: oInstruction = {`POP,`R3,20'b0};
  407: oInstruction = {`POP,`RA,20'b0};
  408: oInstruction = {`NOP,30'b0};
  409: oInstruction = {`RET,20'b0,`RA};
// PINTAR_SOL:
  410: oInstruction = {`NOP,30'b0};
  411: oInstruction = {`PUSH,20'b0,`RA};
  412: oInstruction = {`PUSH,20'b0,`R15};
  413: oInstruction = {`PUSH,20'b0,`R16};
  414: oInstruction = {`STO,`R10,10'b0,`COLOR_YELLOW};
  415: oInstruction = {`STO,`R11,20'd34};
  416: oInstruction = {`STO,`R12,20'd3};
  417: oInstruction = {`STO,`R15,20'd35};
  418: oInstruction = {`STO,`R16,20'd6};
  419: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  420: oInstruction = {`STO,`R11,20'd33};
  421: oInstruction = {`STO,`R12,20'd4};
  422: oInstruction = {`STO,`R15,20'd36};
  423: oInstruction = {`STO,`R16,20'd5};
  424: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  425: oInstruction = {`POP,`R16,20'b0};
  426: oInstruction = {`POP,`R15,20'b0};
  427: oInstruction = {`POP,`RA,20'b0};
  428: oInstruction = {`NOP,30'b0};
  429: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_DIA:
  430: oInstruction = {`NOP,30'b0};
  431: oInstruction = {`PUSH,20'b0,`RA};
  432: oInstruction = {`PUSH,20'b0,`R16};
  433: oInstruction = {`PUSH,20'b0,`R15};
  434: oInstruction = {`STO,`R10,10'b0,`COLOR_CYAN};
  435: oInstruction = {`STO,`R11,20'd0};
  436: oInstruction = {`STO,`R12,20'd0};
  437: oInstruction = {`STO,`R13,20'd40};
  438: oInstruction = {`STO,`R15,20'd39};
  439: oInstruction = {`STO,`R16,20'd18};
  440: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  441: oInstruction = {`POP,`R15,20'b0};
  442: oInstruction = {`POP,`R16,20'b0};
  443: oInstruction = {`POP,`RA,20'b0};
  444: oInstruction = {`NOP,30'b0};
  445: oInstruction = {`RET,20'b0,`RA};
// PONER_CIELO_NOCHE:
  446: oInstruction = {`NOP,30'b0};
  447: oInstruction = {`PUSH,20'b0,`RA};
  448: oInstruction = {`PUSH,20'b0,`R16};
  449: oInstruction = {`PUSH,20'b0,`R15};
  450: oInstruction = {`PUSH,20'b0,`R11};
  451: oInstruction = {`PUSH,20'b0,`R12};
  452: oInstruction = {`STO,`R10,10'b0,`COLOR_BLACK};
  453: oInstruction = {`STO,`R11,20'd0};
  454: oInstruction = {`STO,`R12,20'd0};
  455: oInstruction = {`STO,`R13,20'd40};
  456: oInstruction = {`STO,`R15,20'd40};
  457: oInstruction = {`STO,`R16,20'd18};
  458: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  459: oInstruction = {`POP,`R12,20'b0};
  460: oInstruction = {`POP,`R11,20'b0};
  461: oInstruction = {`POP,`R15,20'b0};
  462: oInstruction = {`POP,`R16,20'b0};
  463: oInstruction = {`POP,`RA,20'b0};
  464: oInstruction = {`NOP,30'b0};
  465: oInstruction = {`RET,20'b0,`RA};
// PONER_ZACATE:
  466: oInstruction = {`NOP,20'b0};
  467: oInstruction = {`PUSH,20'b0,`RA};
  468: oInstruction = {`PUSH,20'b0,`R16};
  469: oInstruction = {`PUSH,20'b0,`R15};
  470: oInstruction = {`STO,`R10,10'b0,`COLOR_GREEN};
  471: oInstruction = {`STO,`R11,20'd0};
  472: oInstruction = {`STO,`R12,20'd18};
  473: oInstruction = {`STO,`R15,20'd40};
  474: oInstruction = {`STO,`R16,20'd30};
  475: oInstruction = {`CALL,`PINTAR_RECTANGULO,20'b0};
  476: oInstruction = {`POP,`R15,20'b0};
  477: oInstruction = {`POP,`R16,20'b0};
  478: oInstruction = {`POP,`RA,20'b0};
  479: oInstruction = {`NOP,20'b0};
  480: oInstruction = {`RET,20'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
