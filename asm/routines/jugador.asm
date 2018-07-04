

JUGADOR:
  NOP, 24'b0
  PUSH, 16'b0, RA
  NOP, 24'b0
  PUSH, 16'b0, R18
  NOP, 24'b0
  PUSH, 16'b0, R19
  NOP, 24'b0
  PUSH, 16'b0, R16
  NOP, 24'b0
  PUSH, 16'b0, R17

  NOP, 24'b0
  STO, R10, 8'b0, COLOR_MAGENTA
  NOP, 24'b0
  STO, R18, 16'd2 //ancho del jugador
  NOP, 24'b0
  STO, R19, 16'd5 //alto del jugador
  NOP, 24'b0
  STO, R16, 16'b0 //contador del ancho del jugador
  NOP, 24'b0
  STO, R17, 16'b0 //contador del alto del jugador

  LOOP_DIBUJO:
    NOP, 24'b0
    ADD, R11, R20, R16 //posicion a dibujar en X
    NOP, 24'b0
    SUB, R12, R21, R17 //posicion a dibujar en Y
    NOP, 24'b0
    CALL, DISPLAY, 16'b0 //dibuja

    NOP, 24'b0
    ADD, R16, R16, R1 //contador ancho++
    NOP, 24'b0
    BEQ, ALTO_JUGADOR, R16, R18 //revisa si ya se dibujo todo el ancho
    NOP, 24'b0
    JMP, LOOP_DIBUJO, 16'b0

    ALTO_JUGADOR:
      NOP, 24'b0
      STO, R16, 16'b0 //reinicia contador del ancho del jugador
      NOP, 24'b0
      ADD, R17, R17, R1 //contador alto++
      NOP, 24'b0
      BEQ, TERMINAR_JUGADOR, R17, R19 //revisa si ya se dibujo todo el alto
      NOP, 24'b0
      JMP, LOOP_DIBUJO, 16'b0

  TERMINAR_JUGADOR:
    NOP, 24'b0
    POP, R17, 16'b0
    NOP, 24'b0
    POP, R16, 16'b0
    NOP, 24'b0
    POP, R19, 16'b0
    NOP, 24'b0
    POP, R18, 16'b0
    NOP, 24'b0
    POP, RA, 16'b0
    NOP, 24'b0
    RET, 16'b0, RA
