public class GameTile {
  // explanation of each variables can be found in ../additionalData/tileStates.txt
  private int indexX, indexY;
  private int weaponType;
  private int groundType;

  public GameTile(int x, int y) {
    this.indexX = x; // needed?
    this.indexY = y;
  }

  public void draw() {
    if(this.groundType == 1) {
      image(dugoutImg, game.gameField.getGridWidth()*(this.indexX+0.5)+game.gameField.getX(), game.gameField.getGridWidth()*(this.indexY+0.5)+game.gameField.getY());
    }
    
    if(this.weaponType == 1) {
      image(weaponImg, game.gameField.getGridWidth()*(this.indexX+0.5)+game.gameField.getX(), game.gameField.getGridWidth()*(this.indexY+0.5)+game.gameField.getY());
    }
  }

  public int[] getIndices() {
    int[] i = {this.indexX, indexY};
    return i;
  }
  
  public void addItem(int type) { // 0=spaceholderWeapon, 1=dugout
    if(type == -1) { // damage
      this.clearTile();
    }
    else if(type == 0) { // weapon
      if(this.weaponType == 0) { // no weapon there yet
        this.weaponType = type+1; // +1 because there are groundType calculated into type, but not into weaponType because type can be everything
      }
    }
    else if (type == 1) { // ground type
      if(this.groundType == 0) { // no special ground set yet
        this.groundType = type; 
      }
    }
  }
  
  public void clearTile() {
    this.weaponType = 0;
    this.groundType = 0;
  }
  
  public int[] getTypes() {
    int[] i = {this.weaponType, this.groundType};
    return i;
  }
}
