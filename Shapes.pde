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
    //rect(blocks.get(0).x, blocks.get(0).y, scl, scl);
    //rect(blocks.get(1).x, blocks.get(1).y, scl, scl);
    //rect(blocks.get(2).x, blocks.get(2).y, scl, scl);
    //rect(blocks.get(3).x, blocks.get(3).y, scl, scl);
    //rect(x, y+(1*scl), scl, scl);
    //rect(x+(1*scl), y, scl, scl);
    //rect(x+(1*scl), y+(1*scl), scl, scl);
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
    if (blocks.get(3).y+1 == boardHeight) {
      fill(255, 0, 0);
      rect(0, boardHeight*scl, boardWidth*scl, scl);
      
      // Add blocks to the GameBoard
      for (int i = 0; i < blocks.size(); i++) {
        boardBlocks.add(new Block(blocks.get(i).x, blocks.get(i).y));
      }
    }
    
    // Check the sides (whether the shape is touching or not)
    /*
    if (blocks.get(0).x == 0) {
      fill(255, 0, 0);
      rect(-scl, 0, scl, scl*boardHeight);
    } else if (blocks.get(2).x+1 == boardWidth) {
      fill(255, 0, 0);
      rect(boardWidth*scl, 0, scl, scl*boardHeight);
    }
    */
    
    // Check the sides (whether the shape is touching or not) using a HitTest
    /*
    for (int i = 0; i < hitTest.size(); i++) {
      if (hitTest.get(i).x+1 == 0) {
        fill(255, 0, 0);
        rect(-scl, 0, scl, scl*boardHeight);
      } else if (hitTest.get(i).x == boardWidth) {
        fill(255, 0, 0);
        rect(boardWidth*scl, 0, scl, scl*boardHeight);
      }
    }
    */
  }
  
  void move(int xOffset, int yOffset) {
    
    for (int j = 0; j < hitTest.size(); j++) {
        if (hitTest.get(j).x+1 == 0 && xOffset < 0) {
        fill(255, 0, 0);
        rect(-scl, 0, scl, scl*boardHeight);
        xOffset = 0;
        } else if (hitTest.get(j).x == boardWidth && xOffset > 0) {
          fill(255, 0, 0);
          rect(boardWidth*scl, 0, scl, scl*boardHeight);
          xOffset = 0;
        }
      }
    
    for (int i = 0; i < blocks.size(); i++) {
      blocks.get(i).x += xOffset; 
      blocks.get(i).y += yOffset;
    }
    for (int i = 0; i < hitTest.size(); i++) {
      hitTest.get(i).x += xOffset; 
      hitTest.get(i).y += yOffset;
    }
  }
  
  
  void shapeCreation() {
    
    if (currentShape == 0) {
      //SQUARE
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y));
      blocks.add(new Block(x+1, y+1));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    } else if (currentShape == 1) {
      //LINE
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x, y+2));
      blocks.add(new Block(x, y+3));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    } else if (currentShape == 2) {
      //S-SHAPE
      blocks.add(new Block(x, y));
      blocks.add(new Block(x+1, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x-1, y+1));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    } else if (currentShape == 3) {
      //S-INVERTED
      blocks.add(new Block(x, y));
      blocks.add(new Block(x-1, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y+1));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    } else if (currentShape == 4) {
      //GIUK
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x-1, y+1));
      blocks.add(new Block(x-2, y+1));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    } else if (currentShape == 5) {
      //NIUN
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y+1));
      blocks.add(new Block(x+2, y+1));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    } else if (currentShape == 6) {
      //BADWORD
      blocks.add(new Block(x, y));
      blocks.add(new Block(x, y+1));
      blocks.add(new Block(x+1, y+1));
      blocks.add(new Block(x-1, y+1));
      
      for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
      }
    }
    
    
  
  }
}