NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:

  // limites globales de vga
  STO, R13, 16'd40 // horizontal
  STO, R14, 16'd30 // vertical

  // posición del jugador
  STO, R20, 16'd5 // horizontal
  STO, R21, 16'd20 // vertical

  // posición del obstaculo
  STO, R24, 16'd35 // horizontal
  STO, R25, 16'd20 // vertical

  //Contador de Delay
  STO, R3, 16'd0
  STO, R2, 16'd40


JUEGO:

  CALL, PONER_CIELO_NOCHE, 16'b0
  CALL, PINTAR_LUNA, 16'b0
  CALL, PONER_ZACATE, 16'b0
  CALL, PINTAR_ESTRELLAS, 16'b0
  CALL, MOVIMIENTO, 16'b0

  CALL, PINTAR_OBSTACULO, 16'b0

DELAY_MAIN1:
    ADD, R3, R3, R1
    CALL, DELAY_MS_FIX, 16'b0
    BEQ, CONTINUE_MAIN1, R2, R3
    NOP, 24'b0
    JMP, DELAY_MAIN1, 16'd0




CONTINUE_MAIN1:

  STO, R3, 16'd0

  JMP, JUEGO, 16'b0
FIN:
JMP, FIN, 16'b0
