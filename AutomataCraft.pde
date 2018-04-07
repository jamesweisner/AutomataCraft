World world;
EntityPlayer focus;
int[] inventory;
int hotbar = 3;

int NUM_LAYERS = 2;
int CHUNK_SIZE = 9;
int CAM_WIDTH  = 130;
int CAM_HEIGHT = 100;

void setup()
{
  size(1300, 1000);
  frameRate(30);
  ellipseMode(CORNER);
  inventory = new int[10];
  world = new World(NUM_LAYERS, CHUNK_SIZE);
  focus = new EntityPlayer(1000, 1000, 0);
  focus.energy = 1000;
  world.layers[0].entities.add(focus);
}