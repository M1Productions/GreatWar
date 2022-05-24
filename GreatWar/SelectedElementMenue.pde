public class SelectedElementMenue {
  private boolean active; // if an element is selected or not
  private int x, y, w, h; // x and y coordinate, width, heigh
  private Button clearBt; // used to clear all elemnts on this tile
  private ToggleButton actionBt, buildTBt, deleteTBt; // select categories
  private Button placeWeaponBt; // todo : spaceholder!
  private Button shootBt; // shoot a weapon that is selected
  
  SelectedElementMenue() {
    this.x = int(bWidth*8/10);
    this.y = int(bHeight/10);
    this.w = int(bWidth*2/10);
    this.h = int(bHeight*8/10);
    
    this.active = false;
    
    this.clearBt = new Button(this.x+this.w/3, this.y+this.h*2/8, this.w/3, this.w/3, "clear");
    
    this.actionBt = new ToggleButton(this.x, this.y, this.w/3, this.h/8, "action");
    this.buildTBt = new ToggleButton(this.x+this.w/3, this.y, this.w/3, this.h/8, "build");
    this.deleteTBt = new ToggleButton(this.x+this.w*2/3, this.y, this.w/3, this.h/8, "delete");
    
    this.actionBt.setRoundness(roundness, 0, 0, 0);
    this.buildTBt.setRoundness(0, 0, 0, 0);
    this.deleteTBt.setRoundness(0, roundness, 0, 0);
    
    this.placeWeaponBt = new Button(this.x+this.w/3, this.y+this.h*2/8, this.w/3, this.w/3, "W");
    
    this.shootBt = new Button(this.x+this.w/3, this.y+this.h*2/8, this.w/3, this.w/3, "shoot");
  }
  
  private void update() {
    this.setCategory(1);
  }
  
  public void draw() {
    // if this.active is tested in game (in combination with troopsMenue)
    // no strokeWeight because the game dictates it
    stroke(0);
    fill(255);
    rect(this.x, this.y+this.h/8, this.w, this.h*7/8, 0, 0, 0, roundness); // draw basic border
    
    // content of delete category
    this.clearBt.draw();
    
    // content of build category
    this.placeWeaponBt.draw();
    
    // content of action category
    this.shootBt.draw();
    
    // draw categories
    this.actionBt.draw();
    this.buildTBt.draw();
    this.deleteTBt.draw();
  }
  
  private void setCategory(int i) { // changes the selected category
    if(i == 0) { // action category
      // categories
      this.actionBt.setState(true);
      this.buildTBt.setState(false);
      this.deleteTBt.setState(false);
      
      // content
      this.shootBt.setActive(game.gameField.selectedTile != null && game.gameField.selectedTile.getWeapon() == 1);
      this.placeWeaponBt.setActive(false);
      this.clearBt.setActive(false);
    }
    else if(i == 1) { // build category
      // categories
      this.actionBt.setState(false);
      this.buildTBt.setState(true);
      this.deleteTBt.setState(false);
      
      // content
      this.shootBt.setActive(false);
      this.placeWeaponBt.setActive(game.gameField.selectedTile != null && game.gameField.selectedTile.getWeapon() == 0);
      this.clearBt.setActive(false);
    }
    else { // deleteCategory
      // categories
      this.actionBt.setState(false);
      this.buildTBt.setState(false);
      this.deleteTBt.setState(true);
      
      // content
      this.shootBt.setActive(false);
      this.placeWeaponBt.setActive(false);
      this.clearBt.setActive(true);
    }
  }
  
  public void click() {
    // categories
    if(this.actionBt.mouseIsOver()) {
      this.setCategory(0);
    }
    else if(this.buildTBt.mouseIsOver()) {
      this.setCategory(1);
    }
    else if(this.deleteTBt.mouseIsOver()) {
      this.setCategory(2);
    }
    // content
    else if(this.clearBt.mouseIsOver()) { // delete everything on this tile
      game.gameField.clearTile();
      this.setCategory(1);
    }
    else if(this.placeWeaponBt.mouseIsOver()) { // build weapon
      game.gameField.addSpecificItem(0);
      this.placeWeaponBt.setActive(false);
    }
    else if(this.shootBt.mouseIsOver()) {
      game.gameField.addDraggedItem(-1, aimImg);
    }
  }
  
  public boolean isActive() {
    return this.active;
  }
  public void setActive(boolean a) {
    this.active = a;
    this.update();
  }
  
  //true if mouse is over this menu
  public boolean mouseIsOver() {
    return (mX>=this.x && mX<=this.x+this.w && mY>=this.y && mY<=this.y+this.h);
  }
}
