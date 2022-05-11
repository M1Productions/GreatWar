public class MainMenue {
  private int x, y, w, h; // x and y coordinate, width, height
  private Button newGameBt, continueGameBt; //buttons to start game
  private int strokeW, textS; // weight of all strokes in this menue; size of all text in this menue

  //constructor
  public MainMenue() {
    this.x = bWidth/3;
    this.y = bHeight/3;
    this.w = bWidth/3;
    this.h = bHeight/3;

    this.strokeW = this.h/37;
    this.textS = this.h/30;

    this.newGameBt = new Button(this.x+this.w/5, this.y+this.h/2-this.w/10, this.w/5, this.w/5, "new");
    this.continueGameBt = new Button(this.x+this.w*3/5, this.y+this.h/2-this.w/10, this.w/5, this.w/5, "continue");

    this.update();
  }

  public void update() {
    this.continueGameBt.setActive(game != null);
  }

  //draws menue
  public void draw() {
    strokeWeight(this.strokeW);
    textSize(this.textS);

     //^ allways first ^

    stroke(0);
    fill(255);
    rect(this.x, this.y, this.w, this.h, roundness);

    this.continueGameBt.draw();
    this.newGameBt.draw();
  }

  //handles the press of any mouse button
  public void click() {
    if(this.newGameBt.mouseIsOver()) {
      game = new Game();
      changeMode(1);
    }

    else if(this.continueGameBt.mouseIsOver()) {
      changeMode(1);
    }
  }
}
