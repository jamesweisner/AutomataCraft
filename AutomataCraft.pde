World world;
EntityPlayer focus;

int NUM_LAYERS = 5;
int CHUNK_SIZE = 5;
int CAM_WIDTH  = 130;
int CAM_HEIGHT = 100;

void setup()
{
  size(1300, 1000);
  frameRate(10);
  ellipseMode(CORNER);
  world = new World(NUM_LAYERS, CHUNK_SIZE);
  focus = new EntityPlayer(0, 0, 0);
  world.layers[0].entities.add(focus);
}