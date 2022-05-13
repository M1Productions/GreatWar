public class Menue {
  private int x, y, w, h; // x and y coordinate, width, height
  private Button mainMenueBt; // Button that leads to main Menue
  private int textS; //size of all text in this menue

  //constructor
  public Menue(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.textS = this.h/5;

    this.mainMenueBt = new Button(this.x+this.w/10, this.y+this.h/4, this.h/2, this.h/2, "|||");
  }

  //draws this, mainMenue Button
  public void draw() {
    //no strokeWeight because the game dictates it

    textSize(this.textS);

    //^ allways first ^

    stroke(0);
    fill(255);
    rect(this.x, this.y, this.w, this.h, roundness, roundness, 0, 0);

    this.mainMenueBt.draw();
  }

  public void click() {
    if(this.mainMenueBt.mouseIsOver()) {
      changeMode(0);
    }
  }

  public boolean mouseIsOver() {
    return(mouseX-blackW>=this.x && mouseX-blackW<=this.x+this.w && mouseY-blackH>=this.y && mouseY-blackH<=this.y+this.h);
  }
}
