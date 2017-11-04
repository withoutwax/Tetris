class GameBoard {
  
  int boardWidth;
  int boardHeight;
  
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
  }
  
  
  
  
  
  
  void render() {
    fill(0, 0, 0);
    /*
    for (int i = 0; i < boardBlocks.size(); i++) {
      rect(boardBlocks.get(i).x*scl, boardBlocks.get(i).y*scl, scl, scl);
    }
    */
    for (int i = 0; i < boardBlocks02.length; i++) {
      for (int j = 0; j < boardBlocks02[i].length; j++) {
        if (boardBlocks02[i][j] == 1) {
          rect(j*scl, i*scl, scl, scl);
        }
      }
    }
    
  }
  
  
}