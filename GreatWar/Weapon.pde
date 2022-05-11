public class Weapon {
  private int x, y, w, h; // x and y coordinate, width, height
  private PImage img; // the image of the weapon

  //constructor
  public Weapon(int x, int y, int w, int h, PImage img) {
    this.x   = x;
    this.y   = y;
    this.w   = w;
    this.h   = h;
    this.img = img;
  }

  public void draw() {
    image(this.img, x, y, w, h);
  }
}
