public class TroopsMenue {
  private int x, y, w, h; // x and y coordinate, width, heigh
  private int category; // selects betwen weapons(1)/soldiers(0)/builds(2)
  private ToggleButton weaponsTBt, groundTypesTBt;// category where the weapons can be placed, where ground types can be selected
  private Button placeWeaponBt; // todo : spaceholder!
  private Button placeDugoutBt; // dig out the ground on a selected tile

  TroopsMenue() {
    this.x = int(bWidth*8/10);
    this.y = int(bHeight/10);
    this.w = int(bWidth*2/10);
    this.h = int(bHeight*8/10);

    this.weaponsTBt = new ToggleButton(this.x, this.y, this.w/2, this.h/8, "weapons");
    this.weaponsTBt.setRoundness(roundness, 0, 0, 0);
    this.groundTypesTBt = new ToggleButton(this.x+this.w/2, this.y, this.w/2, this.h/8, "ground");
    this.groundTypesTBt.setRoundness(0, 0, 0, 0);
    
    this.placeWeaponBt = new Button(this.x+this.w/3, this.y+this.h*2/8, this.w/3, this.w/3, "W");
    this.placeDugoutBt = new Button(this.x+this.w/3, this.y+this.h*2/8, this.w/3, this.w/3, "dugout");

    this.updateCategories(0);
  }

  private void updateCategories(int c) {
    this.category = c;
    
    if(c == 0) {
      this.weaponsTBt.setState(true);
      this.groundTypesTBt.setState(false);
    }
    else if(c == 1) {
      this.weaponsTBt.setState(false);
      this.groundTypesTBt.setState(true);
    }
  }

  public void draw() {
    //no strokeWeight because the game dictates it
    stroke(0);
    fill(255);
    rect(this.x, this.y+this.h/8, this.w, this.h*7/8, 0, 0, 0, roundness); // draw basic border

    // draw categories buttons
    this.weaponsTBt.draw();
    this.groundTypesTBt.draw();

    // draw content of weapons category
    if(this.category == 0) {
      this.placeWeaponBt.draw();
    }
    else if(this.category == 1) {
      this.placeDugoutBt.draw();
    }
  }

  //true if mouse is over this menu
  public boolean mouseIsOver() {
    return (mX>=this.x && mX<=this.x+this.w && mY>=this.y && mY<=this.y+this.h);
  }

  public void click() {
    if(this.weaponsTBt.mouseIsOver()) { // click categories
      this.updateCategories(0);
    }
    else if(this.groundTypesTBt.mouseIsOver()) {
      this.updateCategories(1);
    }
    else if(this.category == 0) { // click content of weapons category
      if(this.placeWeaponBt.mouseIsOver()) {
        game.gameField.addDraggedItem(0, weaponImg);
      }
    }
    else if(this.category == 1) { // click content of groundTypes category
      if(this.placeDugoutBt.mouseIsOver()) {
        game.gameField.addDraggedItem(1, dugoutImg);
      }
    }
  }
}
