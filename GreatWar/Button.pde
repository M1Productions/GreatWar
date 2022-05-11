public class Button {
  protected int x, y, w, h; //x,y coordinates, width, height
  private boolean active; //button does not draw or react if false
  protected boolean manualRoundness; // true if corner0 to corner3 != null
  private String label; //the text on the button
  protected int corner0, corner1, corner2, corner3; // values for roundness of corners

  //constructor
  public Button(int x, int y, int w, int h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;

    this.manualRoundness = false;
    this.active = true;
  }

  public void setRoundness(int corner0, int corner1, int corner2, int corner3) {
    this.corner0 = corner0;
    this.corner1 = corner1;
    this.corner2 = corner2;
    this.corner3 = corner3;

    this.manualRoundness = true;
  }

  //draws button
  public void draw() {
    if(this.active) {
      //no strokeWeight because the menue this Button is in dictates it
      stroke(0);
      fill(255);
      if(this.manualRoundness) {
        rect(this.x, this.y, this.w, this.h, this.corner0, this.corner1, this.corner2, this.corner3);
      }
      else {
        rect(this.x, this.y, this.w, this.h, roundness);
      }

      //no textSize because the menue this Button is in dictates it
      fill(0);
      textAlign(CENTER, CENTER);
      text(this.label, this.x+this.w/2, this.y+this.h/2);
    }
  }

  //true if mouse is over this button
  public boolean mouseIsOver() {
    return this.active && (mouseX-blackW>=this.x && mouseX-blackW<=this.x+this.w && mouseY-blackH>=this.y && mouseY-blackH<=this.y+this.h);
  }

  public void setActive(boolean set) {
    this.active = set;
  }
}

public class ToggleButton extends Button {
  private boolean state; // if the button is turned on or of but does not controll the drawing or other operations

  ToggleButton(int x, int y, int w, int h, String label) {
    super(x, y, w, h, label);
    this.state = false;
  }

  public void draw() {
    super.draw();
    if( !this.state) {
      fill(200, 200);
      noStroke();
      if(this.manualRoundness) {
        rect(this.x+game.strokeW/2, this.y+game.strokeW/2, this.w-game.strokeW, this.h-game.strokeW, this.corner0, this.corner1, this.corner2, this.corner3);
      }
      else {
        rect(this.x+game.strokeW/2, this.y+game.strokeW/2, this.w-game.strokeW, this.h-game.strokeW, roundness);
      }
    }
  }

  public void toggleState() {
    this.state = !this.state; // invertes this.state
  }
  public void setState(boolean state) {
    this.state = state;
  }
  public boolean getState() {
    return this.state;
  }
}
