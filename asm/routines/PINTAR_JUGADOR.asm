PINTAR_JUGADOR:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R18
  PUSH, 20'b0, R19

  STO, R10, 10'b0, COLOR_MAGENTA

  STO, R18, 20'd1 //ancho del jugador = R18+1
  STO, R19, 20'd4 //alto del jugador = R19+1

  # limites rectangulo
  ADD, R11, R20, R0
  ADD, R12, R21, R0
  ADD, R15, R20, R18
  ADD, R16, R21, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0

  STO, R10, 10'b0, COLOR_YELLOW

  # limites rectangulo
  ADD, R11, R20, R18
  ADD, R12, R21, R19
  ADD, R15, R20, R1
  ADD, R16, R21, R19
  NOP, 30'd0
  SUB, R16, R16, R1
  NOP, 30'd0
  SUB, R16, R16, R1

  CALL, PINTAR_RECTANGULO, 20'b0

  POP, R19, 20'b0
  POP, R18, 20'b0
  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
