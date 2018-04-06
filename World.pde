class World {
  int chunkSize;
  Layer[] layers;
  World(int numLayers, int chunkSize)
  {
    this.chunkSize = chunkSize;
    this.layers = new Layer[numLayers];
    for(int i = 0; i < numLayers; i++)
      layers[i] = new Layer(i, this);
  }
}