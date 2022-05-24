public class Settings { // menu in mainMenue
  private boolean active; // does not draw if false
  private int x, y, w, h;
  private ToggleButton showGridTBt;
  
  Settings() {
    this.x = int(bWidth*9/20);
    this.y = int(bHeight/10);
    this.w = int(bWidth*10/20);
    this.h = int(bHeight*7/10);
    
    this.active = false;
    
    this.showGridTBt = new ToggleButton(this.x+this.w*2/3, this.y+this.h/10, this.w/6, this.w/6, "on", "off");
    this.showGridTBt.setState(true);
  }
  
  void draw() {
    if(this.active) {
      rect(this.x, this.y, this.w, this.h, roundness);
      
      // show grid option
      fill(0);
      text("show grid", this.x+this.w/3, this.y+this.h/10+this.w/12);
      this.showGridTBt.draw();
    }
  }
  
  public void click() {
    if(!this.active){} // does not give feedback if not active
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
