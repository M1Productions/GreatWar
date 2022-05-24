public class Tile { // this is only for the selected Tile of game.gameField
  private int indexX, indexY; // the number of tiles above/left to it there are
  private float x, y, size; // coordinates and width/height of square
  private int weaponType, groundType;
  
  Tile(int indexX, int indexY) {
    this.indexX = indexX;
    this.indexY = indexY;
    
    this.size = game.gameField.getGridWidth();
    this.x = this.indexX * this.size + game.gameField.getX();
    this.y = this.indexY * this.size + game.gameField.getY();
    
    this.refreshTypes();
  }
  
  public void draw () {
    pushStyle();
      noStroke();
      fill(200, 200);
      rectMode(CORNER);
      square(this.x, this.y, this.size);
    popStyle();
  }
  
  public int[] getIndices() {
    int[] i = {this.indexX, this.indexY};
    return i;
  }
  public float[] getMiddle() { // returns the coordinates of the middle of the tile
    float[] i = {this.x+this.size/2, this.y+this.size/2};
    return i;
  }
  
  public int getWeapon() {
    return this.weaponType;
  }
  public int getGround() {
    return this.groundType;
  }
  
  public void refreshTypes() { // gets called when constructo is called and when u click add Weapon in seMenue
    this.weaponType = game.gameField.getTypes(this.indexX, this.indexY)[0];
    this.groundType = game.gameField.getTypes(this.indexX, this.indexY)[1];
  }
}
