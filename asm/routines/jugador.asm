JUGADOR:
  NOP, 24'b0
  PUSH, 16'b0, RA

  STO, R10, `COLOR_MAGENTA
  NOP, 24'b0
  STO, T1, 16'b2 //ancho del jugador
  NOP, 24'b0
  STO, T2, 16'b5 //alto del jugador
  NOP, 24'b0
  STO, T3, 16'b0 //contador del ancho del jugador
  NOP, 24'b0
  STO, T4, 16'b0 //contador del alto del jugador

  LOOP_DIBUJO:
    NOP, 24'b0
    ADD, R11, R20, T3 //posicion a dibujar en X
    NOP, 24'b0
    ADD, R12, R21, T4 //posicion a dibujar en Y
    NOP, 24'b0
    CALL, DISPLAY, 16'b0 //dibuja

    NOP, 24'b0
    ADD, T3, T3, R1 //contador ancho++
    NOP, 24'b0
    BEQ, ALTO_JUGADOR, T3, T1 //revisa si ya se dibujo todo el ancho
    NOP, 24'b0
    JMP, LOOP_DIBUJO, 16'b0

    ALTO_JUGADOR:
      NOP, 24'b0
      STO, T3, 16'b0 //reinicia contador del ancho del jugador
      NOP, 24'b0
      ADD, T4, T4, R1 //contador alto++
      NOP, 24'b0
      BEQ, TERMINAR_JUGADOR, T4, T2 //revisa si ya se dibujo todo el alto
      NOP, 24'b0
      JMP, LOOP_DIBUJO, 16'b0

  TERMINAR_JUGADOR:
    NOP, 24'b0
    POP, RA, 16'b0
    NOP, 24'b0
    RET, 16'b0, RA
