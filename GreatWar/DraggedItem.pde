public class DraggedItem { // this is the item that gets dragged with the mouse right before u place it
  private float x, y; // x and y coordinates of the center
  private PImage img; // the image of the weapon
  private int indexX, indexY; // how many tiles there are up/left of this
  private int type; // what type of weapon/soldier etc. this is (only distinguishable with this and the image)

  //constructor
  public DraggedItem(float x, float y, PImage img, int type) {
    this.x   = x;
    this.y   = y;
    this.img = img;
    this.type = type;
  }

  private void update() {
    this.x = mX;
    this.y = mY;

    int[] i = game.gameField.getLimits(); // returns x, x+w, y, y+h
    this.x = constrain(this.x, i[0], i[1]); // stick inside the gameField
    this.y = constrain(this.y, i[2], i[3]); // stick inside the gameField

    float gridWidth = game.gameField.getGridWidth();
    this.indexX = int((this.x-game.gameField.getX()) / gridWidth); // count which Field the weapon is in
    this.indexX = constrain(this.indexX, 0, game.gameField.getGridSize()-1);
    this.x = int((this.indexX *  gridWidth) + game.gameField.getX() + gridWidth/2); // stick weapon to grid of gameField
    this.indexY = int((this.y-game.gameField.getY()) / gridWidth); // count which Field the weapon is in
    this.indexY = constrain(this.indexY, 0, game.gameField.getGridSizeH());
    this.y = int((this.indexY *  gridWidth) + game.gameField.getY() + gridWidth/2); // stick weapon to grid of gameField
  }

  public void draw() {
    this.update();

    //^ Allways first ^
    image(this.img, this.x, this.y);
  }

  public int[] getIndices() {
    int[] i = {this.indexX, this.indexY};
    return i;
  }
  public void setIndices(int x, int y) {
    this.indexX = x;
    this.indexY = y;
  }
  
  public int getType() {
    return this.type;
  }
}
