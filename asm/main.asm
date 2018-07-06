NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:
  NOP, 24'b0
  TEC R22, R22, 8'b0
  NOP, 24'b0
  CALL, MOVIMIENTO
  CALL, FONDO
  CALL, PINTAR_JUGADOR

  //puede ser que sea necesario un loop largo aqui

  JMP, INICIO
