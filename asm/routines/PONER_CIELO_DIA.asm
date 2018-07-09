PONER_CIELO_DIA:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R16
  PUSH, 16'b0, R15

  STO, R10, 8'b0, COLOR_CYAN

  # limites rectangulo
  STO, R11, 16'd0
  STO, R12, 16'd0
  STO, R13, 16'd40
  STO, R15, 16'd39
  STO, R16, 16'd18

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 16'b0

  POP, R15, 16'b0
  POP, R16, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA
