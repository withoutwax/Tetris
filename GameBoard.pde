class GameBoard {
  
  int boardWidth;
  int boardHeight;
  int currentScore = 0;
  
  GameBoard(int w, int h) {
    
    boardWidth = w;
    boardHeight = h;
  }
  
  
  
  
  void update() {
    // Check line whether it is full
    for (int i = 0; i < boardBlocks02.length; i++) {
      int lineCount = 0;
      for (int j = 0; j < boardBlocks02[i].length; j++) {
        if (boardBlocks02[i][j] == 1) {
          lineCount++;
          rowCount[i] = lineCount;
        }
      }
    }
    // Remove line if it is full
    for (int i = 0; i < rowCount.length; i++) {
      if (rowCount[i] == 10) {
        for (int j = 0; j < boardBlocks02[i].length; j++) {
          boardBlocks02[i][j] = 0;
          rowCount[i] = 0;
        }
        
        // Lower the blocks once the line is removed underneath
        lowerBlocks(i);
        
      }
    }
  }
  
  
  void lowerBlocks(int i) {
    for (int j = i; j > 0; j--) {
      for (int k = 0; k < boardBlocks02[j].length; k++) {
        
        boardBlocks02[j][k] = boardBlocks02[j-1][k];
      }
    }
          score++;
      b.currentScore++;
  }
  
  void level() {
    if (currentScore == 5) {
      level++;
      frameSpeed++;
      currentScore = 0;
    }
  }
  
  
  
  void render() {
    stroke(theme.blockStroke);
    fill(theme.block);
    
    
    for (int i = 0; i < boardBlocks02.length; i++) {
      for (int j = 0; j < boardBlocks02[i].length; j++) {
        if (boardBlocks02[i][j] == 1) {
          rect(j*scl, i*scl, scl, scl);
        }
      }
    }
    
  }
  
  void death() {
    
    if (rowCount[0] > 1) {
      gameOver();
    }
  }
  
  void gameOver() {
    fill(255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER", b.boardWidth/2*scl, b.boardHeight/2*scl);
    textAlign(CENTER, TOP);
    text("PRESS 'R' TO RESTART", b.boardWidth/2*scl, b.boardHeight/2*scl);
    blocks.clear();
      sideTest.clear();
      bottomTest.clear();
      for (int i = 0; i < boardBlocks02.length; i++) {
        for (int j = 0; j < boardBlocks02[i].length; j++) {
          boardBlocks02[i][j] = 0;
        }
        rowCount[i] = 0;
      }
    noLoop();
        
    if (score > highScore) {
      highScore = score;
    }
    level = 0; 
  }
  
  
}