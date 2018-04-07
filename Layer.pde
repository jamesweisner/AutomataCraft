class Layer {
  int level;
  World world;
  ArrayList<Entity> entities;
  HashMap<String, Chunk> chunks;
  Layer(int level, World world)
  {
    this.level = level;
    this.world = world;
    this.entities = new ArrayList<Entity>();
    this.chunks = new HashMap<String, Chunk>();
  }
  Chunk loadChunk(int x, int y)
  {
    String key = str(x) + '-' + str(y);
    if(this.chunks.containsKey(key))
      return this.chunks.get(key);
    Chunk chunk = new Chunk(x, y, this);
    this.chunks.put(key, chunk);
    return chunk;
  }
  Cell getCell(int x, int y)
  {
    Chunk chunk = loadChunk(x / world.chunkSize, y / world.chunkSize);
    int chunkX = Math.floorMod(x, world.chunkSize);
    int chunkY = Math.floorMod(y, world.chunkSize);
    return chunk.cells[chunkX][chunkY];
  }
  void setCell(Cell cell, int x, int y)
  {
    Chunk chunk = loadChunk(x / world.chunkSize, y / world.chunkSize);
    int chunkX = Math.floorMod(x, world.chunkSize);
    int chunkY = Math.floorMod(y, world.chunkSize);
    chunk.setCell(cell, chunkX, chunkY);
  }
  Boolean clearCell(int x, int y)
  {
    Cell cell = getCell(x, y);
    if(cell instanceof CellEmpty)
      return true; // It's already empty!
    if(focus.energy < cell.cost())
      return false; // Not enough energy.
    inventory[cell.getID()]++;
    focus.energy -= cell.cost();
    cell.chunk.cells[cell.x][cell.y] = new CellEmpty();
    return true;
  }
}