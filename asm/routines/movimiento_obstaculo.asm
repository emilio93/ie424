// Esta es la lógica del juego
//
// Define el estado del juego
//
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

// R24 y R25 son la posicion actual XY del obstáculo. 
// El obstaculo se mueve de manera constante

MOVIMIENTO_OBST1:
  NOP, 30'b0
  PUSH, 20'b0, RA
  PUSH, 20'b0, R22

  CALL, BORRAR_OBSTACULO1, 20'b0
  BLE, NON_RESET_OBST, R1, R24
  STO, R24, 20'd35
  CALL, PINTAR_OBSTACULO1, 20'b0
	JMP, TERMINAR_OBST_MOV1, 20'b0
  NON_RESET_OBST:
		SUB, R24, R24, R1 //posicion X reducida en 1.
		CALL, PINTAR_OBSTACULO1, 20'b0
		CALL, PINTAR_JUGADOR, 20'b0
		JMP, TERMINAR_OBST_MOV1, 20'b0


  TERMINAR_OBST_MOV1:
    POP, R22, 20'b0
    POP, RA, 20'b0
    NOP, 30'b0
    RET, 20'b0, RA
