public class MainMenue {
  private int x, y, w, h; // x and y coordinate, width, height
  private int xs, drawX; // shifted x and y coordinates for other menues to be shown on the screen, current x coordinate
  private Button newGameBt, continueGameBt; //buttons to start game
  private Button quitBt; // Button to quit the application
  private ToggleButton settingsTBt, gameTBt; // Buttons to open categories
  private Settings settings; // settings Menue for advanced settings only!
  private int strokeW, textS; // weight of all strokes in this menue; size of all text in this menue
  private Button advancedSettingsBt;

  //constructor
  public MainMenue() {
    this.x = bWidth/3;
    this.xs = bWidth/20;
    this.y = bHeight/3;
    this.w = bWidth/3;
    this.h = bHeight/3;

    this.strokeW = this.h/37;
    this.textS = this.h/10;
    
    this.drawX = this.x;
    this.instanziateButtons();
    
    this.quitBt = new Button(bWidth/3, bHeight-bHeight/10, bWidth/3, bHeight/10, "quit");
    this.quitBt.setRoundness(roundness, roundness, 0, 0);
    
    this.settings = new Settings(); // one category of the main menue structure
    this.setCategory(0); // switch between categories (0=game, 1=settings)

    // v Allwas last! v  
  
    this.update();
  }
  
  private void instanziateButtons() {
    this.advancedSettingsBt = new Button(this.x+this.w/5, this.y+this.h/2-this.w/10, this.w/5, this.w/5, "advanced");
    this.gameTBt = new ToggleButton(this.x, this.y-this.h/3, this.w/2, this.h/3, "game");
    this.settingsTBt = new ToggleButton(this.x+this.w/2, this.y-this.h/3, this.w/2, this.h/3, "settings");
    this.newGameBt = new Button(this.x+this.w/5, this.y+this.h/2-this.w/10, this.w/5, this.w/5, "new");
    this.continueGameBt = new Button(this.x+this.w*3/5, this.y+this.h/2-this.w/10, this.w/5, this.w/5, "continue");
    
    this.settingsTBt.setRoundness(roundness, roundness, 0, 0);
    this.gameTBt.setRoundness(roundness, roundness, 0, 0);
  }

  public void update() {
    this.continueGameBt.setActive(game != null);
    
    this.shiftButtons();
  }
  
  private void shiftButtons() {
    this.advancedSettingsBt.setX(this.drawX+this.w/5);
    this.gameTBt.setX(this.drawX);
    this.settingsTBt.setX(this.drawX+this.w/2);
    this.newGameBt.setX(this.drawX+this.w/5);
    this.continueGameBt.setX(this.drawX+this.w*3/5);
  }

  //draws menue
  public void draw() {
    strokeWeight(this.strokeW);
    textSize(this.textS);
    stroke(0);
    fill(255);

    //^ allways first ^
    
    this.settings.draw(); // advanced settings
    
    rect(this.drawX, this.y, this.w, this.h, 0, 0, roundness, roundness); // draw main menue

    // select categories
    this.settingsTBt.draw();
    this.gameTBt.draw();

    // content of game category
    if(this.gameTBt.getState()) {
      this.continueGameBt.draw();
      this.newGameBt.draw();
    }
    // content of settings category
    if(this.settingsTBt.getState()) {
      this.advancedSettingsBt.draw();
    }
    
    // quit button on bottom of screen
    this.quitBt.draw();
  }
  
  private void setCategory(int i) { // changes the selected category
    if(i == 0) { // game category
      this.drawX = this.x;
      this.update();
      this.gameTBt.setState(true);
      this.settingsTBt.setState(false);
      this.settings.deactivate();
    }
    else { // settings category
      this.gameTBt.setState(false);
      this.settingsTBt.setState(true);
    }
  }

  //handles the press of any mouse button
  public void click() {
    if(this.newGameBt.mouseIsOver() && this.gameTBt.getState()) {
      game = new Game();
      changeMode(1);
    }
    else if(this.continueGameBt.mouseIsOver() && this.gameTBt.getState()) {
      changeMode(1);
    }
    else if(this.advancedSettingsBt.mouseIsOver() && this.settingsTBt.getState()) {
      this.settings.activate();
      this.drawX = this.xs;
      this.shiftButtons();
    }
    else if(this.gameTBt.mouseIsOver()) {
      this.setCategory(0);
    }
    else if(this.settingsTBt.mouseIsOver()) {
      this.setCategory(1);
    }
    else if(this.quitBt.mouseIsOver()) {
      exit(); // exit the programm
    }
    else {
      this.settings.click();
    }
  }
}
