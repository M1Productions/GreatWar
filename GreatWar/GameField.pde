public class GameField {
  private int x, y, w, h; // x and y coordinate, width, height

  //constructor
  public GameField(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  public void draw() {
    //no strokeWeight because the game dictates it
    stroke(0);
    noFill();
    rect(this.x, this.y, this.w, this.h);
  }
}
