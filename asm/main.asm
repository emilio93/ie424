NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:


JUEGO:
  NOP, 24'b0
  TEC, R22, R22, 8'b0
  NOP, 24'b0
  CALL, MOVIMIENTO, 16'b0
  CALL, FONDO, 16'b0
  CALL, PINTAR_JUGADOR, 16'b0

  //puede ser que sea necesario un loop largo aqui

  JMP, JUEGO, 16'b0
