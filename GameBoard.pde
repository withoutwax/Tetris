class GameBoard {
  
  int boardWidth;
  int boardHeight;
  
  GameBoard(int w, int h) {
    
    boardWidth = w;
    boardHeight = h;
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