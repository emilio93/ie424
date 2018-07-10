PONER_CIELO_DIA:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R16
  PUSH, 20'b0, R15

  STO, R10, 10'b0, COLOR_CYAN

  # limites rectangulo
  STO, R11, 20'd0
  STO, R12, 20'd0
  STO, R13, 20'd40
  STO, R15, 20'd39
  STO, R16, 20'd18

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0

  POP, R15, 20'b0
  POP, R16, 20'b0
  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
