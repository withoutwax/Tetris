class GameBoard {
  
  int boardWidth;
  int boardHeight;
  
  GameBoard(int w, int h) {
    
    boardWidth = w;
    boardHeight = h;
  }
  
  void render() {
    fill(0, 0, 0);
    
    for (int i = 0; i < boardBlocks.size(); i++) {
      rect(boardBlocks.get(i).x*scl, boardBlocks.get(i).y*scl, scl, scl);
    }
    
  }
  
  
}