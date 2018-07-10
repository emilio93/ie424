PINTAR_OBSTACULO2:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R22
  PUSH, 20'b0, R23

  STO, R10, 10'b0, COLOR_RED
  STO, R18, 20'd2 //ancho del obstaculo
  STO, R19, 20'd1 //alto del obstaculo

  # limites rectangulo
  ADD, R11, R22, R0
  ADD, R12, R23, R0
  ADD, R15, R22,  R18
  ADD, R16, R23, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0

  POP, R23, 20'b0
  POP, R22, 20'b0
  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
