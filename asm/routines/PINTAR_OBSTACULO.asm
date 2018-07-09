PINTAR_OBSTACULO:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R24
  PUSH, 16'b0, R25

  STO, R10, 8'b0, COLOR_WHITE
  STO, R18, 16'd2 //ancho del obstaculo
  STO, R19, 16'd5 //alto del obstaculo

  # limites rectangulo
  ADD, R11, R24, R0
  ADD, R12, R25, R0
  ADD, R15, R24,  R18
  ADD, R16, R25, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 16'b0

  POP, R25, 16'b0
  POP, R24, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA
