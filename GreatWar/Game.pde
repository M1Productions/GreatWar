public class Game {
  private int strokeW;  //weight of all strokes (also for all menues);

  private GameField gameField; //the place where the battlefield takes place
  private Menue menue; //bar on bottom of screen to controll the game
  private TroopsMenue troopsMenue; //where u can select what weapons and troops u whant to buy
  private SelectedElementMenue seMenue; // when u click anything on the gameField

  //constructor
  public Game() {
    this.strokeW = int(bHeight/90);

    this.gameField = new GameField(bWidth/20, bHeight/10, bWidth*7/10, 10);
    this.menue = new Menue();
    this.troopsMenue = new TroopsMenue();
    this.seMenue = new SelectedElementMenue();
  }
  
  public void update() {
    this.gameField.update();
  }
  
  public void draw() {
    strokeWeight(this.strokeW);

    // ^ Allways first ^

    //draw borders of playing field
    this.gameField.draw();

    //draw menue at right side of screen
    if(this.seMenue.isActive()) {
      this.seMenue.draw();
    }
    else {
      this.troopsMenue.draw();
    }

    //draw menue bar at bottom of screen
    this.menue.draw();
  }

  //looks for elements that are clicked
  public void click() {
    if(this.menue.inventory.getActive()) {
      if(!this.menue.inventory.mouseOver()) {
        this.menue.inventory.setActive(false);
      }
    }
    else if(this.menue.mouseIsOver()) {
      this.menue.click();
    }
    else if(this.troopsMenue.mouseIsOver() && !this.seMenue.isActive()){
      this.troopsMenue.click();
    }
    else if(this.seMenue.mouseIsOver() && this.seMenue.isActive()) {
      this.seMenue.click();
    }
    else {
      this.gameField.click();
    }
  }
}
