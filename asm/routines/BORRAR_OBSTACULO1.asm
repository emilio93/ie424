BORRAR_OBSTACULO1:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R15
  PUSH, 20'b0, R16
  PUSH, 20'b0, R18
  PUSH, 20'b0, R19

  STO, R10, 10'b0, COLOR_GREEN

  STO, R18, 20'd2 //ancho del obstaculo = R18+1
  STO, R19, 20'd1 //alto del obstaculo = R19+1

  # limites rectangulo
  ADD, R11, R24, R0
  ADD, R12, R25, R0
  ADD, R15, R24, R18
  ADD, R16, R25, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0

  POP, R19, 20'b0
  POP, R18, 20'b0
  POP, R16, 20'b0
  POP, R15, 20'b0
  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
