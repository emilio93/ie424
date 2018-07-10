// Esta es la lógica del juego
//
// Define el estado del juego
//
//  - posicion x jugador
//  - posicion y jugador
//  - tamaño x jugador
//  - tamaño y jugador
//
//  - posicion x obstaculo
//  - posicion y obstaculo
//  - tamaño x obstaculo
//  - tamaño y obstaculo
//
//  - puntuación
//  - nivel[velocidad obstaculo]
//  - horario[dia/noche]
//  - estado[inicio/juego/derrota]
//
//

// R20 y R21 son la posicion actual XY del jugador. Al presionarse una tecla se sobreescriben con la nueva posicion
// Recibe en R22 la tecla que se presiono

MOVIMIENTO:
  NOP, 24'b0
  PUSH, 16'b0, RA
  PUSH, 16'b0, R22

  STO, T1, 16'h1D //tecla W
  STO, T2, 16'h1B //tecla S
  STO, T3, 16'd19

  STO, R22, 16'b0
  NOP, 24'b0
  TEC, R22, 16'b0
  NOP, 24'b0

  BEQ, CHEQUEAR_BAJAR_MOVIMIENTO, R21, T3

  BEQ, SUBIR_MOVIMIENTO, R22, T1 //revisa si se intento subir al jugador
  JMP, TERMINAR_MOVIMIENTO, 16'b0

  CHEQUEAR_BAJAR_MOVIMIENTO:
  BEQ, BAJAR_MOVIMIENTO, R22, T2 //revisa si se intento bajar al jugador
  JMP, TERMINAR_MOVIMIENTO, 16'b0

  SUBIR_MOVIMIENTO:
    STO, R21, 16'd19  //posicion Y reducida en 1.
    CALL, PINTAR_JUGADOR, 16'b0
    JMP, TERMINAR_MOVIMIENTO, 16'b0

  BAJAR_MOVIMIENTO:
    STO, R21, 16'd24 //posicion Y aumentada en 1.
    CALL, PINTAR_JUGADOR, 16'b0
    JMP, TERMINAR_MOVIMIENTO, 16'b0

  TERMINAR_MOVIMIENTO:
    POP, R22, 16'b0
    POP, RA, 16'b0
    NOP, 24'b0
    RET, 16'b0, RA
