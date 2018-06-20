NOP,24'd4000
STO, R0, 16`d0 // cero
STO, R1, 16`d1 // uno

RESTART_GAME:
  STO, R16, 16`d45 // obstacleX
  STO, R17, 16`d3 // obstacleY
  STO, R18, 16`d3 // playerX
  STO, R19, 16`d3 // playerY
  STO, R20, 16`d0 // score
  STO, R21, 16`d0 // gameOver

GAME_CHECK:
  BEQ, COLISION, R18, R16 // if(obstacleX == playerX) --> Revisar colision
  BLE, SUMA_PUNTO, R16, R18 // if(obstacleX < playerX) --> Sumar punto
  RET, 16`d0, RA  //Sale de subrutina VIVO

  COLISION:
    BEQ, GAME_OVER, R17, R19 // if(obstacleY == playerY) --> Esta muerto
    RET, 16`d0, RA  //Sale de subrutina VIVO

  GAME_OVER:
    STO, R21, 16`d1 //perdio
    RET, 16`d0, RA  //Sale de subrutina MUERTO

  SUMA_PUNTO:
    ADDI, R20, R20, 8`d1
    RET, 16`d0, RA  //Sale de subrutina VIVO con un PUNTO mas
