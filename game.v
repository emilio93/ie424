module game (
  input wire reset,
  input wire clock,
  input wire obstacleX,
  input wire obstacleY,
  input wire playerX,
  input wire playerY,
  input wire restart,
  output reg score,
  output reg gameOver
 );

 always @ (posedge clock) begin
    if (reset | restart) begin
      score <= 0;
      gameOver <= 0;
    end else begin
      if (obstacleX > playerX) begin
        score <= score;
        gameOver <= 0;
      end
      else if (obstacleX == playerX) begin
        if (obstacleY == playerY) begin
          score <= score;
          gameOver <= 1;
        end else begin
          score <= score;
          gameOver <= 0;
        end
      end
      else if (obstacleX < playerX) begin
        score <= score + 1;
        gameOver <= 0;
      end
    end
  end
endmodule //game
