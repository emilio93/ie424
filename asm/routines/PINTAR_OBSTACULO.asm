PINTAR_OBSTACULO:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R24
  PUSH, 20'b0, R25

  STO, R10, 10'b0, COLOR_WHITE
  STO, R18, 20'd2 //ancho del obstaculo
  STO, R19, 20'd2 //alto del obstaculo

  # limites rectangulo
  ADD, R11, R24, R0
  ADD, R12, R25, R0
  ADD, R15, R24,  R18
  ADD, R16, R25, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0

  POP, R25, 20'b0
  POP, R24, 20'b0
  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
