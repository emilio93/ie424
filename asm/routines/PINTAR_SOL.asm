PINTAR_SOL:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R15
  PUSH, 16'b0, R16

  STO, R10, 8'b0, COLOR_YELLOW

  # limites rectangulo 2
  STO, R11, 16'd34
  STO, R12, 16'd3
  STO, R15, 16'd36
  STO, R16, 16'd7

  # dibujar rectangulo 1
  CALL, PINTAR_RECTANGULO, 16'b0

  # limites rectangulo 2
  STO, R11, 16'd33
  STO, R12, 16'd4
  STO, R15, 16'd37
  STO, R16, 16'd6

  # dibujar rectangulo 2
  CALL, PINTAR_RECTANGULO, 16'b0

  POP, R16, 16'b0
  POP, R15, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA