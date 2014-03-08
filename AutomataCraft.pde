Cell[][] world;
int[] player;

void setup()
{
  size(1270, 1270);
  frameRate(10);
  world = new Cell[127][127];
  for(int i = 0; i < 127; i++)
  {
    for(int j = 0; j < 127; j++)
    {
      Cell cell;
      
      // Fill the world with empty space or dirt.
      noiseSeed(1);
      float c = noise(i * 0.1, j * 0.1);
      if(c < 0.5) cell = new CellEmpty();
      else        cell = new CellDirt(round(c * 255));

      // Scatter energy cells.
      noiseSeed(2);
      if(noise(j * 0.1, i * 0.1) + c > 1.30)
        cell = new CellEnergy();
      
      world[i][j] = cell;
    }
  }
  int x = 127 / 2;
  int y = 127 / 2;
  int r = 7;
  player = new int[]{x, y, r};
  for(int i = x; i < x + r; i++)
    for(int j = y; j < y + r; j++)
      world[i][j] = new CellPlayer();
}

