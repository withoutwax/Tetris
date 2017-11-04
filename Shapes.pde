class Shapes {
  
  
  
  int x;
  int y;
  
  Shapes(int xPos, int yPos) {
    x = xPos;
    y = yPos;
    
    shapeCreation();
  }
  
  
  
  void render() {
    
    for (int i = 0; i < blocks.size(); i++) {
      rect(blocks.get(i).x*scl, blocks.get(i).y*scl, scl, scl);
    }
    /*
    for (int j = 0; j < hitTest.size(); j++) {
      fill(255, 0, 0);
      rect(hitTest.get(j).x*scl, hitTest.get(j).y*scl, scl, scl);
    }
    */
  }
  
  
  
  
  
  void update() {
    //float currentSpeed = 0;
    
    //for (int i = 0; i < 20; i++) {
      
    //    currentSpeed = currentSpeed + speed;
        
    //    if (currentSpeed == 20) {
    //      blocks.get(0).y += scl;
    //      currentSpeed = 0;
    //    }
    //}
    
    
    // Check the bottom (whether the shape is touching or not)
    for (int i = 0; i < bottomTest.size(); i++) {
      if (bottomTest.get(i).y == boardHeight) {
        fill(255, 0, 0);
        rect(0, boardHeight*scl, boardWidth*scl, scl);
        hitBottom = true;
      } 
    }
    
    for (int i = 0; i < bottomTest.size(); i++) {
      for (int j = 0; j < boardBlocks02.length; j++) {
        if (boardBlocks02[Math.round(bottomTest.get(i).y)][Math.round(bottomTest.get(i).x)] == 1) {
          fill(255, 0, 0);
          rect(0, boardHeight*scl, boardWidth*scl, scl);
          hitBottom = true;
        }
      }
    }
    
    
    if (hitBottom == true) {
      
      for (int j = 0; j < blocks.size(); j++) {
        boardBlocks02[blocks.get(j).y][blocks.get(j).x] = 1;
        //boardBlocks.add(new Block(blocks.get(j).x, blocks.get(j).y));
      }
      
      // 02 Check if the row is filled
      
      
      
      blocks.clear();
      //hitTest.clear();
      sideTest.clear();
      bottomTest.clear();
      shapeCreation();
    }
    
    
  }
  
  
  
  void move(int xOffset, int yOffset) {
    
    // Check the sides (whether the shape is touching or not) using a SideTest
    for (int j = 0; j < sideTest.size(); j++) {
        if (sideTest.get(j).x+1 == 0 && xOffset < 0) {
        fill(255, 0, 0);
        rect(-scl, 0, scl, scl*boardHeight);
        xOffset = 0;
        } else if (sideTest.get(j).x == boardWidth && xOffset > 0) {
          fill(255, 0, 0);
          rect(boardWidth*scl, 0, scl, scl*boardHeight);
          xOffset = 0;
        }
        
        
        
      }
    // Check the sides (whether the shape is touching the stored Blocks) using a LEFT & RIGHT test  
    for (int i = 0; i < blocks.size(); i++) {
      for (int k = 0; k < boardBlocks02.length; k++) {
          if (blocks.get(i).x > 0 && boardBlocks02[Math.round(blocks.get(i).y)][Math.round(blocks.get(i).x-1)] == 1 && xOffset < 0) {
            fill(255, 0, 0);
            rect(-scl, 0, scl, scl*boardHeight);
            xOffset = 0;
          } else if (blocks.get(i).x < boardWidth-1 && boardBlocks02[Math.round(blocks.get(i).y)][Math.round(blocks.get(i).x+1)] == 1 && xOffset > 0) {
            fill(255, 0, 0);
            rect(boardWidth*scl, 0, scl, scl*boardHeight);
            xOffset = 0;
          }
        }
    }
    
    for (int i = 0; i < blocks.size(); i++) {
      blocks.get(i).x += xOffset; 
      blocks.get(i).y += yOffset;
    }
    /*
    for (int i = 0; i < hitTest.size(); i++) {
      hitTest.get(i).x += xOffset; 
      hitTest.get(i).y += yOffset;
    }
    */
    for (int i = 0; i < sideTest.size(); i++) {
      sideTest.get(i).x += xOffset; 
      sideTest.get(i).y += yOffset;
    }
    for (int i = 0; i < bottomTest.size(); i++) {
      bottomTest.get(i).x += xOffset; 
      bottomTest.get(i).y += yOffset;
    }
  }
  
  
  void shapeCreation() {
    hitBottom = false;
    
    if (currentShape == 0) {
      //SQUARE
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y));
      blocks.add(new Block(x+1, y+1));
      hitTestCreation();
      
    } else if (currentShape == 1) {
      //LINE
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x, y+2));
      blocks.add(new Block(x, y+3));
      hitTestCreation();
      
    } else if (currentShape == 2) {
      //S-SHAPE
      blocks.add(new Block(x, y));
      blocks.add(new Block(x+1, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x-1, y+1));
      hitTestCreation();
      
    } else if (currentShape == 3) {
      //S-INVERTED
      blocks.add(new Block(x, y));
      blocks.add(new Block(x-1, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y+1));
      hitTestCreation();
      
    } else if (currentShape == 4) {
      //GIUK
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x-1, y+1));
      blocks.add(new Block(x-2, y+1));
      hitTestCreation();
      
    } else if (currentShape == 5) {
      //NIUN
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y+1));
      blocks.add(new Block(x+2, y+1));
      hitTestCreation();
      
    } else if (currentShape == 6) {
      //BADWORD
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y+1));
      blocks.add(new Block(x-1, y+1));
      hitTestCreation();
      
    }
  }
  
  /*
  void hitTestCreation() {
     for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
        //hitTest.add(new PVector(blocks.get(i).x, blocks.get(i).y-1));
        hitTest.add(new PVector(blocks.get(i).x, blocks.get(i).y+1));
      } 
   }
   */
   void hitTestCreation() {
     for (int i = 0; i < blocks.size(); i++) {
        sideTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        sideTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
        //hitTest.add(new PVector(blocks.get(i).x, blocks.get(i).y-1));
        bottomTest.add(new PVector(blocks.get(i).x, blocks.get(i).y+1));
      } 
   }
   
}