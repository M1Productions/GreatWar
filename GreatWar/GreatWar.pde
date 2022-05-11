public int blackSize; //how high/ wide the black boxes on the edges of the screen are (to put the game in 16:9)
public int blackH, blackW; //one is allways 0, used to correct mouseClickOpperations
public static int bWidth, bHeight; //width and height but corrected for the 16:9 format
public int mode; //the current menue (mainMEnue/game)
public int roundness; //roundness of all corners

public PImage backGroundImg;

MainMenue mainMenue;
Game game;

public void setup() {
  fullScreen();
  frameRate(25);

  //calculates how the screen has to be changed to be a 16:9 format
  setScreenSize();

  //^ allways first ^

  //sets up all variables and objects
  setupNew();
}

public void draw() {
  //translates 0,0 next to the left/ upper black box (which make the screen 16:9)
  translateIn();

  image(backGroundImg, 0, 0, bWidth, bHeight);

  //draws the menue the player currently is in (enumerated by menu variable)
  modeDraw();

  //v allways last v

  //draws balck boxes to make the screen 16:9
  drawScreenBorders();
}

public void mousePressed() {
  switch(mode) {
    case 0:
      mainMenue.click();  break;
    case 1:
      game.click();       break;
  }
}
