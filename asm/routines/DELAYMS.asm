// RECIBE EN R10 LA CANTIDAD DE MILISEGUNDOS A ESPERAR
DELAYMS:
  NOP, 24'b0
  STO, T1, 16'b0
  STO, T2, 16'b0
  STO, T3, 16'b0
  STO, T4, 16'd10000
  STO, T5, 16'd10000
  STO, T6, 16'd10000
  DELAYMS_LOOP_1:
    STO, T2, 16'b0
    DELAYMS_LOOP_2:
      STO, T3, 16'b0
        DELAYMS_LOOP_3:
          ADD, T3, T3, R1
          BLE, DELAYMS_LOOP_3, T3, T6
      ADD, T2, T2, R1
      BLE, DELAYMS_LOOP_2, T2, T5
    ADD, T1, T1, R1
    BLE, DELAYMS_LOOP_1, T1, T4
  NOP, 24'b0
  RET, 16'b0, RA