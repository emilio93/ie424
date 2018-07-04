NOP,24'd4000
STO, R0, 16'b0 // cero
STO, R1, 16'b1 // uno

INICIO:

// Contadores
STO, R11, 16'b0 // horizontal
STO, R12, 16'b0 // vertical

// LIMITES
STO, R13, 16'd40 // horizontal
STO, R14, 16'd30 // vertical

NOP, 24'b0

LOOPVERTICAL:
  STO, R11, 16'b0
  NOP, 24'b0
  LOOPHORIZONTAL:
    ADD, T1, R11, R12
    NOP, 24'b0
    AND, T1, R1, T1
    NOP, 24'b0
    BEQ, CUADROBLANCO, T1, R0
    JMP, CUADRONEGRO, 16'b0

    CUADROBLANCO:
      STO, R10, 8'b0, COLOR_WHITE
      JMP, LOOPREGRESOHORIZONTAL, 16'b0

    CUADRONEGRO:
      STO, R10, 8'b0, COLOR_BLACK
      JMP, LOOPREGRESOHORIZONTAL, 16'b0

    LOOPREGRESOHORIZONTAL:
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      BLE, LOOPHORIZONTAL, R11, R13
      ADD, R12, R12, R1
      BLE, LOOPVERTICAL, R12, R14
      JMP, CONTINUAR, 16'b0

CONTINUAR:
  CALL, PONER_CIELO_DIA, 16'b0
  STO, R14, 16'd30
  CALL, PONER_ZACATE, 16'b0
  NOP, 24'd0

  CALL, PINTAR_SOL, 16'b0

  STO, R20, 16'd5
  STO, R21, 16'd25

  CALL, JUGADOR, 16'b0

FIN:
JMP, FIN, 16'b0

//
// IMPRIMIR ZACATE
//

PONER_ZACATE:
  NOP, 24'b0
  PUSH, 16'b0, RA
  STO, R12, 16'd18
  STO, R10, 8'b0, COLOR_GREEN

LOOPVERTICAL_ZACATE:
  STO, R11, 16'b0
  NOP, 24'b0
  LOOPHORIZONTAL_ZACATE:
    NOP, 24'b0

    LOOPREGRESOHORIZONTAL_ZACATE:
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      BLE, LOOPHORIZONTAL_ZACATE, R11, R13
      ADD, R12, R12, R1
      BLE, LOOPVERTICAL_ZACATE, R12, R14
      POP, RA, 16'b0
      NOP, 24'b0
      RET, 16'b0, RA


PONER_CIELO_NOCHE:
  NOP, 24'b0
  PUSH, 16'b0, RA
  STO, R14, 16'd18
  STO, R10, 8'b0, COLOR_BLACK
  STO, R12, 16'b0

LOOPVERTICAL_CIELO_NOCHE:
  STO, R11, 16'b0
  NOP, 24'b0
  LOOPHORIZONTAL_CIELO_NOCHE:
    NOP, 24'b0

    LOOPREGRESOHORIZONTAL_CIELO_NOCHE:
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      BLE, LOOPHORIZONTAL_CIELO_NOCHE, R11, R13
      ADD, R12, R12, R1
      BLE, LOOPVERTICAL_CIELO_NOCHE, R12, R14
      POP, RA, 16'b0
      NOP, 24'b0
      RET, 16'b0, RA

PONER_CIELO_DIA:
  NOP, 24'b0
  PUSH, 16'b0, RA
  STO, R14, 16'd18
  STO, R10, 8'b0, COLOR_CYAN
  STO, R12, 16'b0

LOOPVERTICAL_CIELO_DIA:
  STO, R11, 16'b0
  NOP, 24'b0
  LOOPHORIZONTAL_CIELO_DIA:
    NOP, 24'b0

    LOOPREGRESOHORIZONTAL_CIELO_DIA:
      CALL, DISPLAY, 16'b0
      ADD, R11, R11, R1
      BLE, LOOPHORIZONTAL_CIELO_DIA, R11, R13
      ADD, R12, R12, R1
      BLE, LOOPVERTICAL_CIELO_DIA, R12, R14
      POP, RA, 16'b0
      NOP, 24'b0
      RET, 16'b0, RA

PINTAR_SOL:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R11
  PUSH, 16'b0, R12

  STO, R10, 8'b0, COLOR_YELLOW


  STO, R11, 16'd33
  STO, R12, 16'd3
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd34
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd33
  STO, R12, 16'd4
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd34
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd33
  STO, R12, 16'd5
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd34
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd33
  STO, R12, 16'd6
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd34
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd32
  STO, R12, 16'd4
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R12, 16'd5
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R11, 16'd35
  STO, R12, 16'd4
  NOP, 24'd0
  CALL, DISPLAY, 16'b0

  STO, R12, 16'd5
  NOP, 24'd0
  CALL, DISPLAY, 16'b0


  POP, R12, 16'b0
  POP, R11, 16'b0
  POP, RA, 16'b0
  NOP, 24'b0
  RET, 16'b0, RA
