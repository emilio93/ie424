NOP,24'd4000
STO, R0, 20'b0 // cero
STO, R1, 20'b1 // uno

INICIO:
 //límites de la pantalla
  STO, R13, 20'd40
  STO, R13, 20'd30

 // posición del jugador
  STO, R20, 20'd5 // horizontal
  STO, R21, 20'd24 // vertical

  // posición del obstaculo
  STO, R24, 20'd35 // horizontal
  STO, R25, 20'd20 // vertical

   // posición del jugador
  STO, R20, 20'd5 // horizontal
  STO, R21, 20'd24 // vertical

  // posición del obstaculo
  STO, R24, 20'd35 // horizontal
  STO, R25, 20'd20 // vertical

  //Contador de Delay
  STO, R3, 20'd0
  STO, R2, 20'd6000
  STO, R4, 20'd0
  STO, R5, 20'd100

JUEGO:

  CALL, PONER_CIELO_NOCHE, 20'b0
  CALL, PINTAR_LUNA, 20'b0
  CALL, PONER_ZACATE, 20'b0
  CALL, PINTAR_ESTRELLAS, 20'b0
  CALL, PINTAR_JUGADOR, 20'b0
  CALL, PINTAR_OBSTACULO1, 20'b0

DELAY_MAIN1:
    CALL, MOVIMIENTO, 20'b0
    ADD, R3, R3, R1
    CALL, DELAY_MS_FIX, 20'b0
    BLE, DONT_OBST1, R4, R5
    CALL, MOVIMIENTO_OBST1, 20'b0
    STO, R4, 20'd0
    DONT_OBST1:
    NOP, 30'b0
    ADD, R4, R4, R1
    BEQ, CONTINUE_MAIN1, R2, R3
    NOP, 30'b0
    JMP, DELAY_MAIN1, 20'd0

CONTINUE_MAIN1:
  STO, R3, 20'd0
  CALL, PONER_CIELO_DIA, 20'b0
  CALL, PINTAR_SOL, 20'b0
  CALL, PONER_ZACATE, 20'b0
  CALL, PINTAR_JUGADOR, 20'b0
  CALL, PINTAR_OBSTACULO1, 20'b0

DELAY_MAIN2:
    CALL, MOVIMIENTO, 20'b0
    ADD, R3, R3, R1
    CALL, DELAY_MS_FIX, 20'b0
    BLE, DONT_OBST2, R4, R5
    NOP, 30'b0
    CALL, MOVIMIENTO_OBST1, 20'b0
    STO, R4, 20'd0
    DONT_OBST2:
    NOP, 30'b0
    ADD, R4, R4, R1
    BEQ, CONTINUE_MAIN2, R2, R3
    NOP, 30'b0
    JMP, DELAY_MAIN2, 20'd0

CONTINUE_MAIN2:
  STO, R3, 20'd0
  JMP, JUEGO, 20'b0


FIN:
JMP, FIN, 20'b0
