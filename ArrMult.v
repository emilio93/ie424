`timescale 1ns / 1ps

module ArrMult (A, B, R);
    input [3:0] A, B;
    output [15:0] R;
    wire wCo0, wCo1, wCo2, wCo3, wCo4, wCo5;
    wire wCo6, wCo7, wCo8, wCo9, wCo10, wCo11;
    wire w, wR0, wR1, wR2, wR3, wR4, wR5;
    wire wR6, wR7, wR8, wR9, wR10, wR11;

    assign w = A[0] & B[0];

    Adder a0(.A(A[0]&B[1]), .B(A[1]&B[0]), .R(wR0), .Ci(0), .Co(wCo0));
    Adder a1(.A(A[2]&B[0]), .B(A[1]&B[1]), .R(wR1), .Ci(wCo0), .Co(wCo1));
    Adder a2(.A(A[3]&B[0]), .B(A[2]&B[1]), .R(wR2), .Ci(wCo1), .Co(wCo2));
    Adder a3(.A(0), .B(A[3]&B[1]), .R(wR3), .Ci(wCo2), .Co(wCo3));
    Adder a4(.A(wR1), .B(A[0]&B[2]), .R(wR4), .Ci(0), .Co(wCo4));
    Adder a5(.A(wR2), .B(A[1]&B[2]), .R(wR5), .Ci(wCo4), .Co(wCo5));
    Adder a6(.A(wR3), .B(A[2]&B[2]), .R(wR6), .Ci(wCo5), .Co(wCo6));
    Adder a7(.A(A[3]&B[2]), .B(wCo3), .R(wR7), .Ci(wCo6), .Co(wCo7));
    Adder a8(.A(wR5), .B(A[0]&B[3]), .R(wR8), .Ci(0), .Co(wCo8));
    Adder a9(.A(wR6), .B(A[1]&B[3]), .R(wR9), .Ci(wCo8), .Co(wCo9));
    Adder a10(.A(wR7), .B(A[2]&B[3]), .R(wR10), .Ci(wCo9), .Co(wCo10));
    Adder a11(.A(wCo7), .B(A[3]&B[3]), .R(wR11), .Ci(wCo10), .Co(wCo11));

    assign R = {8'b00000000, wCo11, wR11, wR10, wR9, wR8, wR4, wR0, w};
  endmodule
