class Chunk {
  int x, y;
  Layer layer;
  Cell[][] cells;
  Chunk(int x, int y, Layer layer)
  {
    this.x = x;
    this.y = y;
    this.layer = layer;
    int chunkSize = layer.world.chunkSize;
    this.cells = new Cell[chunkSize][chunkSize];
    if(layer.level > 0)
      return; // Leave all cells transparent i.e. null.
    for(int i = 0; i < chunkSize; i++)
    {
      int cellX = (x * chunkSize + i);
      for(int j = 0; j < chunkSize; j++)
      {
        int cellY = (y * chunkSize + j);

        Cell cell;

        // Fill the world with rocks.
        noiseSeed(1);
        float c = noise(cellX * 0.1, cellY * 0.1);
        if(c < 0.5)
          cell = new CellEmpty();
        else
        {
          cell = new CellRock();
          ((CellRock) cell).c = color(round(c * 255));
        }

        // Scatter energy cells.
        noiseSeed(2);
        if(noise(cellX * 0.1, cellY * 0.1) + c > 1.30)
          cell = new CellGold();
      
        this.setCell(cell, i, j);
      }
    }
  }
  void setCell(Cell cell, int x, int y)
  {
    // Link up the cell into this chunk.
    this.cells[x][y] = cell;
    cell.chunk = this;
    cell.x = x;
    cell.y = y;
  }
  int syncGems(Cell c)
  {
    int id = c.getID();
    int count = 0;
    for(int i = 0; i < cells.length; i++)
      for(int j = 0; j < cells.length; j++)
        if(cells[i][j].getID() == id)
        {
          cells[i][j].phase = c.phase;
          count++;
        }
    return count;
  }
}