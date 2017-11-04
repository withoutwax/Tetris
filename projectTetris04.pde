GameBoard b;
Shapes s;

int scl = 20;
int boardWidth = 10;
int boardHeight = 20;
float speed = 1;
int currentShape = 1;
boolean wallHit = false;

ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Block> boardBlocks = new ArrayList<Block>();

ArrayList<PVector> hitTest = new ArrayList<PVector>();

void setup() {
  size(800, 800);
  
  // Initialize the GameBoard
  b = new GameBoard(boardWidth, boardHeight);
  s = new Shapes(boardWidth/2, 0);
  
  
}


void draw() {
  background(255, 255, 255);
  fill(255);
  translate(160, 150);
  
  rect(0, 0, b.boardWidth*scl, b.boardHeight*scl);
  
  s.render();
  s.update();
  b.render();
}





void keyPressed() {
  if (key == CODED) {
      if (keyCode == UP) {
        s.move(0, -1);
      } else if (keyCode == DOWN) {
        s.move(0, 1);
      } else if (keyCode == LEFT) {
        s.move(-1, 0);
      } else if (keyCode == RIGHT) {
        s.move(1, 0); 
      }
  }


  if (key == '1') {
    blocks.clear();
    hitTest.clear();
    currentShape = 0;
    s.shapeCreation();
  } else if (key == '2') {
    blocks.clear();
    hitTest.clear();
    currentShape = 1;
    s.shapeCreation();
  } else if (key == '3') {
    blocks.clear();
    hitTest.clear();
    currentShape = 2;
    s.shapeCreation();
  } else if (key == '4') {
    blocks.clear();
    hitTest.clear();
    currentShape = 3;
    s.shapeCreation();
  } else if (key == '5') {
    blocks.clear();
    hitTest.clear();
    currentShape = 4;
    s.shapeCreation();
  } else if (key == '6') {
    blocks.clear();
    hitTest.clear();
    currentShape = 5;
    s.shapeCreation();
  } else if (key == '7') {
    blocks.clear();
    hitTest.clear();
    currentShape = 6;
    s.shapeCreation();
  }


  
  
  //if (key == 'n') {

  //  if (s == null) {
  //    //s = new Shapes(ShapeType.SQUARE);
      
  //  }
  //} else if (key == 'r') {
  //  for (int i = 0; i < s.blocks.size(); i++) {
      
  //  }
  //}
}