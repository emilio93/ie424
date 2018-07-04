//R20 y R21 son la posicion actual XY del jugador. Al presionarse una tecla se sobreescriben con la nueva posicion
//Recibe en R22 la tecla que se presiono

MOVIMIENTO:
  NOP, 24'b0
  PUSH, 16'b0, RA
  NOP, 24'b0
  STO, T1, 16'h1D //tecla W
  NOP, 24'b0
  STO, T2, 16'h1B //tecla S

  NOP, 24'b0
  BEQ, SUBIR_MOVIMIENTO, R22, T1 //revisa si se intento subir al jugador
  NOP, 24'b0
  BEQ, BAJAR_MOVIMIENTO, R22, T2 //revisa si se intento bajar al jugador

  NOP, 24'b0
//no se modifican las posiciones XY
  JMP, TERMINAR_MOVIMIENTO, 16'b0

  SUBIR_MOVIMIENTO:
    NOP, 24'b0
    SUB, R20, R20, R1 //posicion X reducida en 1.
    NOP, 24'b0
    SUB, R21, R21, R1 //posicion Y reducida en 1.
    NOP, 24'b0
    JMP, TERMINAR_MOVIMIENTO

  BAJAR_MOVIMIENTO:
    NOP, 24'b0
    ADD, R20, R20, R1 //posicion X aumentada en 1.
    NOP, 24'b0
    ADD, R21, R21, R1 //posicion Y aumentada en 1.
    NOP, 24'b0
    JMP, TERMINAR_MOVIMIENTO

  TERMINAR_MOVIMIENTO:
    NOP, 24'b0
    POP, RA, 16'b0
    NOP, 24'b0
    RET, 16'b0, RA
