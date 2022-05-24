public class Menue {
  private int x, y, w, h; // x and y coordinate, width, height
  private Button mainMenueBt, inventoryBt; // Button that leads to main Menue; Button for the inventory
  private int textS; //size of all text in this menue
  private Inventory inventory;
  
  //constructor
  public Menue() {
    this.x = int(bWidth/3);
    this.y = int(bHeight*9/10);
    this.w = int(bWidth/3);
    this.h = int(bHeight/10);

    this.textS = this.h/5;

    this.mainMenueBt = new Button(this.x+this.w/10, this.y+this.h/6, this.w*2/10, this.h*4/6, "menu");
    this.inventoryBt = new Button(this.x+this.w*4/10, this.y+this.h/6, this.w*2/10, this.h*4/6, "inventory");
    
    this.inventory = new Inventory();
  }

  // draws this, mainMenue Button
  public void draw() {
    // no strokeWeight because the game dictates it

    textSize(this.textS);

    // ^ allways first ^

    stroke(0);
    fill(255);
    rect(this.x, this.y, this.w, this.h, roundness, roundness, 0, 0);

    this.mainMenueBt.draw();
    this.inventoryBt.draw();
    
    this.inventory.draw();
  }

  public void click() {
    if(this.mainMenueBt.mouseIsOver()) {
      changeMode(0);
    }
    else if(this.inventoryBt.mouseIsOver()) {
      this.inventory.setActive(true);
    }
  }

  public boolean mouseIsOver() {
    return(mX>=this.x && mX<=this.x+this.w && mY>=this.y && mY<=this.y+this.h);
  }
}
