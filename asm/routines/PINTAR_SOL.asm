PINTAR_SOL:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R15
  PUSH, 20'b0, R16

  STO, R10, 10'b0, COLOR_YELLOW

  # limites rectangulo 2
  STO, R11, 20'd34
  STO, R12, 20'd3
  STO, R15, 20'd35
  STO, R16, 20'd6

  # dibujar rectangulo 1
  CALL, PINTAR_RECTANGULO, 20'b0

  # limites rectangulo 2
  STO, R11, 20'd33
  STO, R12, 20'd4
  STO, R15, 20'd36
  STO, R16, 20'd5

  # dibujar rectangulo 2
  CALL, PINTAR_RECTANGULO, 20'b0

  POP, R16, 20'b0
  POP, R15, 20'b0
  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
