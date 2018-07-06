PINTAR_JUGADOR:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R18
  PUSH, 16'b0, R19

  STO, R10, 8'b0, COLOR_MAGENTA

  STO, R18, 16'd2 //ancho del jugador
  STO, R19, 16'd5 //alto del jugador

  # limites rectangulo
  ADD, R11, R20, R0
  ADD, R12, R21, R0
  ADD, R15, R20, R18
  ADD, R16, R21, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 16'b0

  POP, R19, 16'b0
  POP, R18, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA
