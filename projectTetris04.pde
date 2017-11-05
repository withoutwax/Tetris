GameBoard b;
Shapes s;

int scl = 20;
int boardWidth = 10;
int boardHeight = 20;
float speed = 1;
int currentShape = Math.round(random(6));
int shapeOrientation = 0;
boolean orientationState = false;
boolean hitBottom = false;

ArrayList<Block> blocks = new ArrayList<Block>();

ArrayList<Block> boardBlocks = new ArrayList<Block>();
int[][] boardBlocks02 = new int[boardHeight+2][boardWidth];

int[] rowCount = new int[boardHeight+2];

//ArrayList<PVector> hitTest = new ArrayList<PVector>();

ArrayList<PVector> sideTest = new ArrayList<PVector>();
ArrayList<PVector> bottomTest = new ArrayList<PVector>();





void setup() {
  size(800, 800);
  frameRate(4);
  
  // Initialize the GameBoard
  b = new GameBoard(boardWidth, boardHeight);
  s = new Shapes(boardWidth/2-1, 0);

}





void draw() {
  background(255, 255, 255);
  fill(255);

    translate(160, 150);
    
    rect(0, 0, b.boardWidth*scl, b.boardHeight*scl);
    
    s.update();
    b.update();
    s.render();
    b.render();
    
  
  // DISPLAY ROW COUNT :: DEBUGGER
  /*
  for (int i = 0; i < rowCount.length-1; i++) {
    text("ROW COUNT: " + rowCount[i], -100, 15+(i*scl));
  }
  */
}





void keyPressed() {
  if (key == CODED) {
      if (keyCode == UP) {
       orientationState = true; 

      } else if (keyCode == DOWN) {
        s.move(0, 1);
      } else if (keyCode == LEFT) {
        s.move(-1, 0);
      } else if (keyCode == RIGHT) {
        s.move(1, 0); 
      }
  }
  
  if (key == ' ') {
    frameRate(200);
  }
  
  //DEBUGGER CONTROLS
  if (key == '1') {
    clearArray();
    currentShape = 0;
    s.shapeCreation();
  } else if (key == '2') {
    clearArray();
    currentShape = 1;
    s.shapeCreation();
  } else if (key == '3') {
    clearArray();
    currentShape = 2;
    s.shapeCreation();
  } else if (key == '4') {
    clearArray();
    currentShape = 3;
    s.shapeCreation();
  } else if (key == '5') {
    clearArray();
    currentShape = 4;
    s.shapeCreation();
  } else if (key == '6') {
    clearArray();
    currentShape = 5;
    s.shapeCreation();
  } else if (key == '7') {
    clearArray();
    currentShape = 6;
    s.shapeCreation();
  }

  
  if (key == 'r') {
    //clearArray();
    orientationState = true;
    //s.shapeCreation();
  }
  
}


void clearArray() {
  blocks.clear();
    //hitTest.clear();
  sideTest.clear();
  bottomTest.clear();
}