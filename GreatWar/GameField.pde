public class GameField {
  private float x, y, w, h; // x and y coordinate, width, height
  private int gridSize; private float gridWidth; // how many grid places there are in one line (horizontal)
  private ArrayList <Weapon> weapons; // all weapons in the game are stored here
  private Weapon selectedWeapon; // a shortcut to the selected weapon
  private boolean showGrid; // if the grid is drawn or not

  //constructor
  public GameField(int x, int y, int w, int gridSize) {
    this.x = x;
    this.y = y;
    this.w = w;
    
    this.gridSize = gridSize;
    this.gridWidth = this.w/this.gridSize;
    this.h = int(this.gridSize*9/16)*this.gridWidth;
    
    this.weapons = new ArrayList <Weapon>();
    
    this.showGrid = mainMenue.settings.getShowGrid();
  }

  public void draw() {
    stroke(0);
    
    if(this.showGrid) {
      pushStyle();
        strokeWeight(game.strokeW/2);
      
        for(int i = 1; i< this.gridSize; i++) { // vertical lines
          line(this.x+this.gridWidth*i, this.y, this.x+this.gridWidth*i, this.y+this.h);
        }
      
        for(int i = 1; i< int(this.gridSize*9/16); i++) { // horizontal lines
          line(this.x, this.y+this.gridWidth*i, this.x+this.w, this.y+this.gridWidth*i);
        }
      popStyle(); // restoring normal strokeWeight
    }
    //no strokeWeight because the game dictates it
    noFill();
    rect(this.x, this.y, this.w, this.h);
    
    for(Weapon w : this.weapons) {
      w.draw();
    }
  }
  
  public void addWeapon() {
    Weapon w = new Weapon(mouseX, mouseY, 100, 100, weaponImg);
    this.selectedWeapon = w;
    this.weapons.add(w);
  }
  
  public void placeWeapon() {
    this.selectedWeapon.place();
    this.selectedWeapon = null;
  }
  
  public int[] getLimits() {
    int[] i = {int(this.x), int(this.x+this.w), int(this.y), int(this.y+this.h)};
    return i;
  }
}
