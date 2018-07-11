PINTAR_NUBES:
  NOP, 30'b0
  PUSH, 20'b0, RA

  STO, R10, 10'b0, COLOR_WHITE
  STO, R18, 20'd5 //ancho de la nube
  STO, R19, 20'd2 //alto de la nube
	STO, T3, 20'd3
	STO, T4, 20'd3
	
  # limites rectangulo
  ADD, R11, T3, R0
  ADD, R12, T4, R0
  ADD, R15, T3, R18
  ADD, R16, T4, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0
  
  STO, T3, 20'd10
	STO, T4, 20'd9
	STO, R18, 20'd4 //ancho de la nube
  STO, R19, 20'd2 //alto de la nube
	
  # limites rectangulo
  ADD, R11, T3, R0
  ADD, R12, T4, R0
  ADD, R15, T3, R18
  ADD, R16, T4, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0
  
  STO, T3, 20'd27
	STO, T4, 20'd8
	STO, R18, 20'd4 //ancho de la nube
  STO, R19, 20'd2 //alto de la nube
	
  # limites rectangulo
  ADD, R11, T3, R0
  ADD, R12, T4, R0
  ADD, R15, T3, R18
  ADD, R16, T4, R19

  # dibujar rectangulo
  CALL, PINTAR_RECTANGULO, 20'b0

  POP, RA, 20'b0
  NOP, 30'b0
  RET, 20'b0, RA
