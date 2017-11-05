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
    /* DEBUGGER
    for (int j = 0; j < hitTest.size(); j++) {
      fill(255, 0, 0);
      rect(hitTest.get(j).x*scl, hitTest.get(j).y*scl, scl, scl);
    }
    */
  }
  
  
  
  void update() {
    
    
    for (int i = 0; i < blocks.size(); i++) {
      blocks.get(i).y += 1;
    }
    for (int i = 0; i < bottomTest.size(); i++) {
      bottomTest.get(i).y += 1;
    }
    for (int i = 0; i < sideTest.size(); i++) {
      sideTest.get(i).y += 1;
    }
    
    
    // Check the bottom (whether the shape is touching or not)
    for (int i = 0; i < bottomTest.size(); i++) {
      if (bottomTest.get(i).y == boardHeight) {
        //fill(255, 0, 0); DEBUGGER
        //rect(0, boardHeight*scl, boardWidth*scl, scl); DEBUGGER
        hitBottom = true;
      } 
    }
    
    for (int i = 0; i < bottomTest.size(); i++) {
      for (int j = 0; j < boardBlocks02.length; j++) {
        if (boardBlocks02[Math.round(bottomTest.get(i).y)][Math.round(bottomTest.get(i).x)] == 1) {
          //fill(255, 0, 0); DEBUGGER
          //rect(0, boardHeight*scl, boardWidth*scl, scl); DEBUGGER
          hitBottom = true;
        }
      }
    }
    
    
    if (hitBottom == true) {
      
      for (int j = 0; j < blocks.size(); j++) {
        boardBlocks02[blocks.get(j).y-1][blocks.get(j).x] = 1;
      }
      blocks.clear();
      //hitTest.clear();
      sideTest.clear();
      bottomTest.clear();
      currentShape = Math.round(random(6));
      frameRate(4);
      shapeCreation();
    }

    
    
    
    // Line Rotation

    if (currentShape == 0) {
      
    } else if (currentShape == 1) {
      lineRotate();
    } else if (currentShape == 2) {
      sRotate();
    } else if (currentShape == 3) {
      sIRotate();
    } else if (currentShape == 4) {
      giukRotate();
    } else if (currentShape == 5) {
      niunRotate();
    } else if (currentShape == 6) {
      badWordRotate();
    }
    
    
  }
  
  
  
  void move(int xOffset, int yOffset) {
    
    // Check the sides (whether the shape is touching or not) using a SideTest
    for (int j = 0; j < sideTest.size(); j++) {
        if (sideTest.get(j).x+1 == 0 && xOffset < 0) {
        // fill(255, 0, 0); DEBUGGER
        // rect(-scl, 0, scl, scl*boardHeight); DEBUGGER
        xOffset = 0;
        } else if (sideTest.get(j).x == boardWidth && xOffset > 0) {
        //  fill(255, 0, 0); DEBUGGER 
        //  rect(boardWidth*scl, 0, scl, scl*boardHeight); DEBUGGER 
          xOffset = 0;
        }
        
        
        
      }
    // Check the sides (whether the shape is touching the stored Blocks) using a LEFT & RIGHT test  
    for (int i = 0; i < blocks.size(); i++) {
      for (int k = 0; k < boardBlocks02.length; k++) {
          if (blocks.get(i).x > 0 && boardBlocks02[Math.round(blocks.get(i).y)][Math.round(blocks.get(i).x-1)] == 1 && xOffset < 0) {
            //fill(255, 0, 0); DEBUGGER
            //rect(-scl, 0, scl, scl*boardHeight); DEBUGGER
            xOffset = 0;
          } else if (blocks.get(i).x < boardWidth-1 && boardBlocks02[Math.round(blocks.get(i).y)][Math.round(blocks.get(i).x+1)] == 1 && xOffset > 0) {
            //fill(255, 0, 0); DEBUGGER
            //rect(boardWidth*scl, 0, scl, scl*boardHeight); DEBUGGER
            xOffset = 0;
          }
        }
    }
    
    for (int i = 0; i < blocks.size(); i++) {
      blocks.get(i).x += xOffset; 
      blocks.get(i).y += yOffset;
    }
    /* DEBUGGER
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
  
  
  
  
  
  
  
  /* DEBUGGER
  void hitTestCreation() {
     for (int i = 0; i < blocks.size(); i++) {
        hitTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        hitTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
        //hitTest.add(new PVector(blocks.get(i).x, blocks.get(i).y-1));
        hitTest.add(new PVector(blocks.get(i).x, blocks.get(i).y+1));
      } 
   }
   */
   
   
   
   
  void shapeCreation() {
    hitBottom = false;
    shapeOrientation = 0;
    x = boardWidth/2-1;
    y = 0;
    
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
   
   
   void hitTestCreation() {
     for (int i = 0; i < blocks.size(); i++) {
        sideTest.add(new PVector(blocks.get(i).x-1, blocks.get(i).y));
        sideTest.add(new PVector(blocks.get(i).x+1, blocks.get(i).y));
        //hitTest.add(new PVector(blocks.get(i).x, blocks.get(i).y-1));
        bottomTest.add(new PVector(blocks.get(i).x, blocks.get(i).y));
      } 
   }
   
   
   
   
   // ROTATION MECHANISM
   
  void lineRotate() {
     if (orientationState == true) {
      if (shapeOrientation == 0) {
        sideTest.clear();
        bottomTest.clear();
        
        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(0).y += 1;
        blocks.get(2).x += 1;
        blocks.get(2).y -= 1;
        blocks.get(3).x += 2;
        blocks.get(3).y -= 2;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 1) {
        sideTest.clear();
        bottomTest.clear();
        
        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(0).y -= 1;
        blocks.get(2).x -= 1;
        blocks.get(2).y += 1;
        blocks.get(3).x -= 2;
        blocks.get(3).y += 2;
        
        hitTestCreation();
        shapeOrientation--;
        orientationState = false;
      }
     }   
   }
   
   void sRotate() {
     if (orientationState == true) {
      if (shapeOrientation == 0) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(1).x -= 2;
        blocks.get(1).y -= 1;
        blocks.get(2).y -= 1;
        blocks.get(3).x += 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 1) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(1).x += 2;
        blocks.get(1).y += 1;
        blocks.get(2).y += 1;
        blocks.get(3).x -= 1;
        
        hitTestCreation();
        shapeOrientation--;
        orientationState = false;
      }
     }   
   }
   void sIRotate() {
     if (orientationState == true) {
      if (shapeOrientation == 0) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(1).x += 2;
        blocks.get(1).y -= 1;
        blocks.get(2).y -= 1;
        blocks.get(3).x -= 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 1) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(1).x -= 2;
        blocks.get(1).y += 1;
        blocks.get(2).y += 1;
        blocks.get(3).x += 1;
        
        hitTestCreation();
        shapeOrientation--;
        orientationState = false;
      }
     }   
   }
   
   void giukRotate() {
     if (orientationState == true) {
      if (shapeOrientation == 0) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).y += 1;
        blocks.get(1).x -= 1;
        blocks.get(2).y -= 1;
        blocks.get(3).x += 1;
        blocks.get(3).y -= 2;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 1) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(1).y -= 1;
        blocks.get(2).x += 1;
        blocks.get(3).x += 2;
        blocks.get(3).y += 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 2) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).y -= 1;
        blocks.get(1).x += 1;
        blocks.get(2).y += 1;
        blocks.get(3).x -= 1;
        blocks.get(3).y += 2;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      }
      else if (shapeOrientation == 3) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(1).y += 1;
        blocks.get(2).x -= 1;
        blocks.get(3).x -= 2;
        blocks.get(3).y -= 1;
        
        hitTestCreation();
        shapeOrientation = 0;
        orientationState = false;
      }
     }   
   }
   void niunRotate() {
     if (orientationState == true) {
      if (shapeOrientation == 0) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(1).y -= 1;
        blocks.get(2).x -= 1;
        blocks.get(3).y += 1;
        blocks.get(3).x -= 2;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 1) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).y += 1;
        blocks.get(1).x += 1;
        blocks.get(2).y -= 1;
        blocks.get(3).y -= 2;
        blocks.get(3).x -= 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 2) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(1).y += 1;
        blocks.get(2).x += 1;
        blocks.get(3).y -= 1;
        blocks.get(3).x += 2;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      }
      else if (shapeOrientation == 3) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).y -= 1;
        blocks.get(1).x -= 1;
        blocks.get(2).y += 1;
        blocks.get(3).y += 2;
        blocks.get(3).x += 1;
        
        hitTestCreation();
        shapeOrientation = 0;
        orientationState = false;
      }
     }   
   }
   void badWordRotate() {
     if (orientationState == true) {
      if (shapeOrientation == 0) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(0).y += 1;
        blocks.get(2).x -= 1;
        blocks.get(2).y += 1;
        blocks.get(3).x += 1;
        blocks.get(3).y -= 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 1) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(0).y += 1;
        blocks.get(2).x -= 1;
        blocks.get(2).y -= 1;
        blocks.get(3).x += 1;
        blocks.get(3).y += 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      } else if (shapeOrientation == 2) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x -= 1;
        blocks.get(0).y -= 1;
        blocks.get(2).x += 1;
        blocks.get(2).y -= 1;
        blocks.get(3).x -= 1;
        blocks.get(3).y += 1;
        
        hitTestCreation();
        shapeOrientation++;
        orientationState = false;
      }
      else if (shapeOrientation == 3) {
        sideTest.clear();
        bottomTest.clear();

        //ROTATE
        blocks.get(0).x += 1;
        blocks.get(0).y -= 1;
        blocks.get(2).x += 1;
        blocks.get(2).y += 1;
        blocks.get(3).x -= 1;
        blocks.get(3).y -= 1;
        
        hitTestCreation();
        shapeOrientation = 0;
        orientationState = false;
      }
     }   
   }
   
}