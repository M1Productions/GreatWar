public int blackSize; //how high/ wide the black boxes on the edges of the screen are (to put the game in 16:9)
public static int blackH, blackW; //one is allways 0, used to correct mouseClickOpperations
public static float bWidth, bHeight; //width and height but corrected for the 16:9 format
public int mode; //the current menue (mainMEnue/game)
public int roundness; //roundness of all corners
public float mX, mY; // mouseX and mouseY corrected for the translation

public PImage backGroundImg, weaponImg, dugoutImg, aimImg;

MainMenue mainMenue;
Game game;

public void setup() {
  fullScreen();
  frameRate(25);

  // calculates how the screen has to be changed to be a 16:9 format
  setScreenSize();

  // ^ Allways first ^

  // sets up all variables and objects
  setupNew();
  
  noLoop();
  redraw();
}

public void draw() {
  mX = mouseX-blackW;
  mY = mouseY-blackH;
  
  background(0);

  //translates 0,0 next to the left/ upper black box (which make the screen 16:9)
  translate(blackW, blackH);
  
  // ^ Allways first! ^
  
  image(backGroundImg, bWidth/2, bHeight/2);

  //draws the menue the player currently is in (enumerated by menu variable)
  modeDraw();

  //v allways last v

  //draws balck boxes to make the screen 16:9
  //drawScreenBorders();
}

public void mousePressed() {
  mX = mouseX-blackW;
  mY = mouseY-blackH;
  switch(mode) {
    case 0:
      mainMenue.click();  break;
    case 1:
      game.click();       break;
  }
  
  redraw();
}

public void keyPressed() {
  if(key == 27) { // escape
    if(mode > 0) {
      changeMode(mode-1);
    }
    else {
      exit();
    }
  }
  
  // v Allways last! v
  
  key = 0; // catch the escape button to not quit the application
  
  redraw();
}

public void mouseMoved() {
  if(game != null && game.gameField.draggedItem != null) { // draging a weapon over the field
    redraw();
  }
}
