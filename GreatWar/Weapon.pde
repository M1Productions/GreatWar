public class Weapon {
  private int x, y, w, h; // x and y coordinate, width, height
  private boolean followMouse; // if true, follow mouse
  private PImage img; // the image of the weapon

  //constructor
  public Weapon(int x, int y, int w, int h, PImage img) {
    this.x   = x;
    this.y   = y;
    this.w   = w;
    this.h   = h;
    this.img = img;
    this.img.resize(this.w, this.h);
    
    this.followMouse = true;
  }
  
  private void update() {
    if(this.followMouse) {
      this.x = mouseX-blackW;
      this.y = mouseY-blackH;
      
      int[] i = game.gameField.getLimits(); // returns x, x+w, y, y+h
      this.x = constrain(this.x, i[0], i[1]);
      this.y = constrain(this.y, i[2], i[3]);
    }
  }

  public void draw() {
    this.update();
    
    //^ Allways first ^
    
    image(this.img, this.x-this.w/2, this.y-this.h/2);
  }
  
  public void place() {
    this.followMouse = false;
  }
}
