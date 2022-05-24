public class Inventory {
  private int x, y, w, h;
  private boolean active;
  
  public Inventory() {
    this.x = int(bWidth/3);
    this.y = int(bHeight*2/3);
    this.w = int(bWidth/3);
    this.h = int(bHeight/3);
    
    this.active = false;
  }
  
  public void draw() {
    if(this.active) {
      fill(200, 150);
      rect(0, 0, bWidth, bHeight); // grey out background
      fill(255);
      rect(this.x, this.y, this.w, this.h); // draw basic box
      
      pushStyle();
        textAlign(CENTER, CENTER);
        fill(0);
        textSize(this.h/1.5);
        text("x", this.x-this.w/2, this.y+this.h/2); // draw close button (but actually u can close it all arround the rect)
      popStyle();
    }
  }
  
  public void setActive(boolean set) {
    this.active = set;
  }
  public boolean getActive() {
    return this.active;
  }
  
  public boolean mouseOver() {
    return (this.x <= mX && this.x+this.w >= mX && this.y <= mY && this.y+this.h >= mY);
  }
}
