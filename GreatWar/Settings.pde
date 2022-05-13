public class Settings { // menu in mainMenue
  private boolean active; // does not draw if false
  private int x, y, w, h;
  private ToggleButton showGridTBt;
  
  Settings() {
    this.x = bWidth*9/20;
    this.y = bHeight/10;
    this.w = bWidth*10/20;
    this.h = bHeight*7/10;
    
    this.active = false;
    
    this.showGridTBt = new ToggleButton(this.x+this.w*2/3, this.y+this.h/10, this.w/6, this.w/6, "on");
    this.showGridTBt.setState(true);
  }
  
  void draw() {
    if(this.active) {
      rect(this.x, this.y, this.w, this.h, roundness, roundness, roundness, roundness);
      
      this.showGridTBt.draw();
    }
  }
  
  public void click() {
    if(!this.active){} // does not give feedback
    else if(this.showGridTBt.mouseIsOver()) {
      this.showGridTBt.toggleState();
    }
  }
  
  public void activate() {
    this.active = true;
  }
  public void deactivate() {
    this.active = false;
  }
  
  public boolean getShowGrid() {
    return this.showGridTBt.getState();
  }
}
