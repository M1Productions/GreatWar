public class Game {
  private int strokeW;  //weight of all strokes (also for all menues);

  private GameField gameField; //the place where the battlefield takes place
  private Menue menue; //bar on bottom of screen to controll the game
  private TroopsMenue troopsMenue; //where u can select what weapons and troops u whant to buy

  //constructor
  public Game() {
    this.strokeW = bHeight/90;

    this.gameField = new GameField(bWidth/20, bHeight/10, bWidth*7/10, 10);
    this.menue = new Menue(bWidth/3, bHeight*9/10, bWidth/3, bHeight/10);
    this.troopsMenue = new TroopsMenue(bWidth*8/10, bHeight/10, bWidth*2/10, bHeight*8/10);
  }

  //draws menue bar on bottom
  public void draw() {
    strokeWeight(this.strokeW);

    // ^ allways first ^

    //draw borders of playing field
    this.gameField.draw();

    //draw menue at right side of screen
    this.troopsMenue.draw();

    //draw menue bar at bottom of screen
    this.menue.draw();
  }

  //looks for elements that are clicked
  public void click() {
    if(this.menue.mouseIsOver()) {
      this.menue.click();
    }
    else if(this.troopsMenue.mouseIsOver()){
      this.troopsMenue.click();
    }
  }
}
