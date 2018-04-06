void draw()
{
  stroke(0);
  for(int i = 0; i < CAM_WIDTH; i++)
  {
    for(int j = 0; j < CAM_HEIGHT; j++)
    {
      int x = focus.x + i;
      int y = focus.y + j;
      Cell c = world.layers[0].getCell(x, y);
      fill(c.getColor());
      rect(i * 10, j * 10, 10, 10);
      // TODO draw other layers
    }
  }

  noStroke();
  for(int i = 0; i < world.layers[0].entities.size(); i++)
  {
    Entity entity = world.layers[0].entities.get(i);
    fill(entity.getColor());
    ellipse(CAM_WIDTH / 2 * 10 + 2, CAM_HEIGHT / 2 * 10 + 2, 7, 7);
  }
}