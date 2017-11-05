GameBoard b;
PFont gotham;
Shapes s;
Theme theme;

int scl = 20;
int boardWidth = 10;
int boardHeight = 20;
float speed = 1;
int currentShape = Math.round(random(6));
int shapeOrientation = 0;
boolean orientationState = false;
boolean wallHitLeft = false;
boolean wallHitRight = false;
boolean hitBottom = false;

boolean debuggerMode = false;

ArrayList<Block> blocks = new ArrayList<Block>();

ArrayList<Block> boardBlocks = new ArrayList<Block>();
int[][] boardBlocks02 = new int[boardHeight+2][boardWidth];

int[] rowCount = new int[boardHeight+2];

//ArrayList<PVector> hitTest = new ArrayList<PVector>();

ArrayList<PVector> sideTest = new ArrayList<PVector>();
ArrayList<PVector> bottomTest = new ArrayList<PVector>();

int score = 0;
int highScore = 0;
int level = 0;
int frameSpeed = 2;


void setup() {
  size(800, 800);
  frameRate(frameSpeed);
  theme = new Theme();
  theme.theme01();
  gotham = createFont("Gotham-Bold.otf", 12);
  textFont(gotham);
  
  // Initialize the GameBoard
  b = new GameBoard(boardWidth, boardHeight);
  s = new Shapes(boardWidth/2-1, 0);

}





void draw() {
  background(0, 0, 0);
    
    translate(160, 150);
    scoreBoard();
    
    fill(theme.background);
    rect(0, 0, b.boardWidth*scl, b.boardHeight*scl);
    
    s.update();
    b.update();
    s.render();
    b.render();
    b.level();
    b.death();
  
  // DISPLAY ROW COUNT :: DEBUGGER
  if (debuggerMode == true) {
    stroke(255);
    for (int i = 0; i < rowCount.length-1; i++) {
      text("ROW COUNT: " + rowCount[i], -100, 15+(i*scl));
    }
    
    if (wallHitLeft == true) {
      text("WALL HIT LEFT: TRUE", 0, -scl);
    } else if (wallHitRight == true) {
      text("WALL HIT RIGHT: TRUE", 0, -scl);
    } else if (wallHitLeft == false && wallHitRight == false) {
      text("WALL HIT: FALSE", 0, -scl);
    }
    
    
  } else {
  }
  
}





void keyPressed() {
  if (key == CODED) {
      if (keyCode == UP) {
        if (debuggerMode == false) {
          orientationState = true; 
        } else if (debuggerMode == true) {
          s.move(0, -1);
        }
      } else if (keyCode == DOWN) {
        s.move(0, 1);
      } else if (keyCode == LEFT) {
        s.move(-1, 0);
        wallHitRight = false;
      } else if (keyCode == RIGHT) {
        s.move(1, 0); 
        wallHitLeft = false;
      }
  }
  
  if (key == ' ') {
    frameRate(200);
  } else if (key == 'p') {
    noLoop();
  } else if (key == 'o') {
    loop();
  } else if (key == 'd') {
    //DEBUGGER MODE!!!
    debuggerMode = true;
  } else if (key == 'n') {
    //PLAYMODE!!!
    debuggerMode = false;
  }
  
  if (debuggerMode == false) {
    //DEBUGGER CONTROLS
    if (key == '1') {
      theme.theme01();
    } else if (key == '2') {
      theme.theme02();
    } else if (key == '3') {
      theme.theme03();
    } else if (key == '4') {
      theme.theme04();
    } else if (key == '5') {
      theme.theme05();
    } 
  } else if (debuggerMode == true) {
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
  }
  
  if (debuggerMode == false) {
    if (key == 'r') {
      setup();
      loop();
      score = 0;
      
      s.shapeCreation();
      
    }
  } else if (debuggerMode == true) {
    if (key == 'r') {
      clearArray();
      orientationState = true;
      s.shapeCreation();
  }
  }
  
  
}


void clearArray() {
  blocks.clear();
    //hitTest.clear();
  sideTest.clear();
  bottomTest.clear();
}



// SCOREBOARD / DIRECTIONS INFO

void scoreBoard() {
  int textLocx = (b.boardWidth+1)*scl;
  int textLocy = 20;
  
  //SCOREBOARD
  fill(255);
  textAlign(LEFT);
  text("SCORE: ", textLocx, textLocy);
  text(score, textLocx+50, textLocy);
  text("HIGH SCORE: ", textLocx, textLocy+15);
  text(highScore, textLocx+85, textLocy+15);
  text("CONTROLS: ", textLocx, textLocy+30);
  text("PAUSE: P", textLocx, textLocy+55);
  text("PLAY: O", textLocx, textLocy+70);
  text("LEVEL:", textLocx, textLocy+95);
  text(level, textLocx+45, textLocy+95);
  
  /*
  //ITEM INFO
  fill(theme.food);
  rect(textLocx, textLocy+110, scl, scl); 
  text("FOOD", textLocx+scl+5, textLocy+122);  
 
  fill(theme.shape);
  rect(textLocx, textLocy+135, scl, scl); 
  text("SNAKE", textLocx+scl+5, textLocy+147);    
  
  stroke(theme.blockStroke);
  fill(theme.block);
  rect(textLocx, textLocy+160, scl, scl); 
  text("POISON", textLocx+scl+5, textLocy+172); 
  */
  
  //THEME INFO
  fill(71, 255, 232);
  rect(textLocx, textLocy+250, scl, scl); 
  text("THEME 01: SCI-FI", textLocx+scl+5, textLocy+262);
  
  fill(247, 127, 127);
  rect(textLocx, textLocy+275, scl, scl); 
  text("THEME 02: SIMPLE", textLocx+scl+5, textLocy+287);   
  
  stroke(87, 95, 104, 255);
  fill(0, 0, 0);
  rect(textLocx, textLocy+300, scl, scl);
  fill(87, 95, 104);
  text("THEME 03: BLACK & WHITE", textLocx+scl+5, textLocy+312); 
  
  noStroke();
  fill(36, 58, 134);
  rect(textLocx, textLocy+325, scl, scl); 
  text("THEME 04: PIPE", textLocx+scl+5, textLocy+337);   
 
  fill(159, 220, 210);
  rect(textLocx, textLocy+350, scl, scl); 
  text("THEME 05: GREEN ROBOT", textLocx+scl+5, textLocy+362);    
}