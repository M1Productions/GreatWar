public class TroopsMenue {
  private int x, y, w, h; // x and y coordinate, width, heigh
  private int category; // selects betwen weapons(1)/soldiers(0)/builds(2)
  private ToggleButton weaponsTBt;// category where the weapons can be placed
  private Button placeWeapon; // todo : spaceholder!

  TroopsMenue(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.category = 0;

    this.weaponsTBt = new ToggleButton(this.x, this.y, this.w, this.h/8, "Weapons");
    this.weaponsTBt.setRoundness(roundness, 0, 0, 0);

    this.placeWeapon = new Button(this.x+this.w/3, int(this.y+this.h*1.5/8), this.w/3, this.h/8, "W");

    this.updateCategories();
  }

  private void updateCategories() {
    if(this.category == 0) {
      this.weaponsTBt.setState(true);
    }
  }

  public void draw() {
    //no strokeWeight because the game dictates it
    stroke(0);
    fill(255);
    rect(this.x, this.y+this.h/8, this.w, this.h*7/8, 0, 0, 0, roundness); // draw basic border

    // draw categories button
    this.weaponsTBt.draw();

    // draw content of weapons category
    this.placeWeapon.draw();
  }

  //true if mouse is over this button
  public boolean mouseIsOver() {
    return (mouseX-blackW>=this.x && mouseX-blackW<=this.x+this.w && mouseY-blackH>=this.y && mouseY-blackH<=this.y+this.h);
  }

  public void click() {
    // click categories
    if(this.weaponsTBt.mouseIsOver()) {
      this.category = 0;
      this.updateCategories();
    }
    // click content of weapons category
    else if(this.placeWeapon.mouseIsOver()) {
      game.gameField.addWeapon();
    }
  }
}
