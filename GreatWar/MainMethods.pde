//sets up all variables and objects
public void setupNew() {
  // variables
  mode = 0;
  roundness = 20;

  // images
  loadImages();

  // classes
  mainMenue = new MainMenue();
  
  // Styles
  imageMode(CENTER);
}

// load all images
public void loadImages() {
  backGroundImg = loadImage("background.png"); // background image desert
  backGroundImg.resize(int(bWidth), int(bHeight));
}

// calculates how the screen has to be changed to be a 16:9 format
public void setScreenSize() {
  if((width)*9/16 > height) { //screen is too wide
    blackSize = (width-(height)*9/16)/2;
    bWidth = width-blackSize*2;
    bHeight = height;
    blackH = 0;
    blackW = blackSize;
  }
  else { //screen is too heigh or 16:9
    blackSize = (height-(width)*9/16)/2;
    bWidth = width;
    bHeight = height-blackSize*2;
    blackH = blackSize;
    blackW = 0;
  }
}

// change between screens (game/mainMenue ...)
public void changeMode(int changeMode) {
  switch(changeMode) {
    case 0: mainMenue.update(); game.gameField.dropTile(); break;
    case 1: game.update();                                 break;
  }
  
  mode = changeMode;
}

// draws the menue the player currently is in (enumerated by menu variable)
public void modeDraw() {
  switch(mode) {
    case 0:
      mainMenue.draw(); break;
    case 1:
      game.draw();      break;
  }
}
