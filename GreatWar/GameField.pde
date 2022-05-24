public class GameField {
  private float x, y, w, h; // x and y coordinate, width, height
  private int gridSize, gridSizeH; private float gridWidth; // how many grid places there are in one line (horizontal), one row (vertical); how wide/height one tile is
  private DraggedItem draggedItem; // the item that gets dragged arround the field, right befor u place it onto one tile
  private boolean showGrid; // if the grid is drawn or not
  private Tile selectedTile; // the tile u clicked on and which can be edited over the selectedElementsMenue(seMenue)

  private GameTile[][] tiles;

  // constructor
  public GameField(float x, float y, float w, int gridSize) {
    this.x = x;
    this.y = y;
    this.w = w;

    this.gridSize = gridSize;
    this.gridWidth = this.w/this.gridSize;
    this.gridSizeH = int(this.gridSize*9/16);
    this.h = this.gridSizeH*this.gridWidth;
    
    this.loadImages();

    this.tiles = new GameTile[this.gridSize][this.gridSizeH];
    
    for(int i=0; i<this.gridSize; i++) {
      for(int j=0; j<this.gridSizeH; j++) {
        this.tiles[i][j] = new GameTile(i, j); // create objects that save properties for each tile
      }
    }
  }
  
  public void update() {
    this.showGrid = mainMenue.settings.getShowGrid();
  }
  
  private void loadImages() { // reloads the images to teir original solution and scales them correctly
    int size = int(this.gridWidth+0.5);
    weaponImg  = loadImage("weaponSpaceholder.png");
    weaponImg.resize(size, size);
    dugoutImg  = loadImage("dugout.png");
    dugoutImg.resize(size, size);
    aimImg     = loadImage("aim.png");
    aimImg.resize(size, size);
  }

  public void draw() {
    stroke(0);
    //no strokeWeight because the game dictates it
    noFill();
    
    this.drawAllTiles();
    
    rect(this.x, this.y, this.w, this.h);

    if(this.showGrid) {
      pushStyle();
        strokeWeight(game.strokeW/2);

        for(int i = 1; i< this.gridSize; i++) { // vertical lines
          line(this.x+this.gridWidth*i, this.y, this.x+this.gridWidth*i, this.y+this.h);
        }

        for(int i = 1; i< this.gridSizeH; i++) { // horizontal lines
          line(this.x, this.y+this.gridWidth*i, this.x+this.w, this.y+this.gridWidth*i);
        }
      popStyle(); // restoring normal strokeWeight
    }
    
    // v Allways last! v
    if(this.draggedItem != null) {
      this.draggedItem.draw();
    }

    if(this.selectedTile != null) {
      this.selectedTile.draw();
    }
  }

  private void drawAllTiles() {
    for(int i=0; i<this.gridSize; i++) {
      for(int j=0; j<this.gridSizeH; j++) {
        this.tiles[i][j].draw();
      }
    }
  }

  public void click() {
    if(this.x > mX || this.x+this.w < mX || this.y > mY || this.y+this.h < mY) { // if the mouse is outside the gameField
      this.dropTile();
    }
    else if(this.draggedItem != null) {
      this.placeItem();
    }
    else {
      int newTileIndexX = int((mX - this.x) / this.gridWidth);
      int newTileIndexY = int((mY - this.y) / this.gridWidth);
      newTileIndexX = constrain(newTileIndexX, 0, this.gridSize -1);
      newTileIndexY = constrain(newTileIndexY, 0, this.gridSizeH -1);
      this.selectedTile = new Tile(newTileIndexX, newTileIndexY); // set the inecies of the selected tile

      game.seMenue.setActive(true);
    }
  }

  public void addDraggedItem(int type, PImage img) { // prepares a new item to be placed // todo : rename!
    this.draggedItem = new DraggedItem(mX, mY, img, type);
  }
  private void placeItem() { // puts the weapon down
    this.tiles[this.draggedItem.getIndices()[0]][this.draggedItem.getIndices()[1]].addItem(this.draggedItem.getType());
    this.draggedItem = null;
  }
  public void addSpecificItem(int type) { // places a weapon directly to the selected tile
    this.tiles[this.selectedTile.getIndices()[0]][this.selectedTile.getIndices()[1]].addItem(type);
    this.selectedTile.refreshTypes();
  }

  public int[] getLimits() {
    int[] i = {int(this.x), int(this.x+this.w), int(this.y), int(this.y+this.h)};
    return i;
  }

  public float getGridWidth() { // width/ height of each tile
    return this.gridWidth;
  }
  public int getGridSize() { // horizontal
    return this.gridSize;
  }
  public int getGridSizeH() { // vertical
    return this.gridSizeH;
  }

  public float getX() {
    return this.x;
  }
  public float getY() {
    return this.y;
  }

  public void clearTile() {
    int indexXST=this.selectedTile.getIndices()[0], indexYST=this.selectedTile.getIndices()[1];
    this.tiles[indexXST][indexYST].clearTile();
  }
  
  public void dropTile() {
    game.seMenue.setCategory(1);
    game.seMenue.setActive(false);
    this.selectedTile = null;
  }
  
  public int[] getTypes (int x, int y) {
    return this.tiles[x][y].getTypes();
  }
}
