class Theme {
  
  color background;
  color block;
  color blockStroke;
  color shape;
  color shapeStroke;
  color food;
  color foodStroke;
  
  color poisonText;
  
  //THEME #1 - SCI-FI
  void theme01 () {
    background = color(43, 46, 50);
    block = color(87, 95, 104);
    blockStroke = color(255, 255, 255, 0);
    shape = color(71, 255, 232);
    shapeStroke = color(255, 255, 255, 0);
    food = color(247, 127, 127);
    foodStroke = color(255, 255, 255, 0);
    
    poisonText = color(87, 95, 104);
  }

  //THEME #2 - SIMPLE
  void theme02 () {
    background = color(242, 242, 242);
    block = color(87, 95, 104);
    blockStroke = color(255, 255, 255, 0);
    shape = color(242, 242, 242);
    shapeStroke = color(0, 255);
    food = color(247, 127, 127);  
    foodStroke = color(255, 255, 255, 0);
    
    poisonText = color(87, 95, 104);
  }
  
  //THEME #3 - B/W
  void theme03 () {
    background = color(242, 242, 242);
    block = color(26, 26, 26);
    blockStroke = color(87, 95, 104, 255);
    shape = color(77, 77, 77);
    shapeStroke = color(255, 255, 255, 0);    
    food = color(255, 255, 255);  
    foodStroke = color(0, 0, 0, 255);
    
    block = color(87, 95, 104);
  }
  
  //THEME #4 - PIPE
  void theme04 () {
    background = color(216, 233, 245);
    block = color(36, 58, 134);
    blockStroke = color(255, 255, 255, 0);
    shape = color(255, 255, 255);
    shapeStroke = color(40, 45, 132, 255);
    food = color(190, 23, 78);
    foodStroke = color(255, 255, 255, 0);
    
    block = color(36, 58, 134);
  }
  
  //THEME #5 - GREEN ROBOT
  void theme05 () {
    background = color(159, 220, 210);
    block = color(247, 127, 127);
    blockStroke = color(255, 255, 255, 0);
    shape = color(255, 237, 164);
    shapeStroke = color(255, 255, 255, 0);
    food = color(56, 182, 192);
    foodStroke = color(255, 255, 255, 0);
    
    block = color(247, 127, 127);
  }  
}