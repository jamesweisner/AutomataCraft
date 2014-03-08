void draw()
{
  for(int i = 0; i < 127; i++)
  {
    for(int j = 0; j < 127; j++)
    {
      Cell c = world[i][j];
      fill(c.getColor());
      rect(i * 10, j * 10, 10, 10);
    }
  }
}

