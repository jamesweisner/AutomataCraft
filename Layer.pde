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
    return chunk.cells[Math.floorMod(x, world.chunkSize)][Math.floorMod(y, world.chunkSize)];
  }
}