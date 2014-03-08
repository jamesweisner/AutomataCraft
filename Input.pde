void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      for(int i = player[0]; i < player[0] + player[2]; i++)
      {
        Cell c = world[i][player[1] + player[2] - 1];
        world[i][player[1] + player[2] - 1] = world[i][player[1] - 1];
        world[i][player[1] - 1] = c;
      }
      player[1]--;
      redraw();
    }
    if(keyCode == DOWN)
    {
      for(int i = player[0]; i < player[0] + player[2]; i++)
      {
        Cell c = world[i][player[1]];
        world[i][player[1]] = world[i][player[1] + player[2]];
        world[i][player[1] + player[2]] = c;
      }
      player[1]++;
      redraw();
    }
    if(keyCode == LEFT)
    {
      for(int i = player[1]; i < player[1] + player[2]; i++)
      {
        Cell c = world[player[0] + player[2] - 1][i];
        world[player[0] + player[2] - 1][i] = world[player[0] - 1][i];
        world[player[0] - 1][i] = c;
      }
      player[0]--;
      redraw();
    }
    if(keyCode == RIGHT)
    {
      for(int i = player[1]; i < player[1] + player[2]; i++)
      {
        Cell c = world[player[0]][i];
        world[player[0]][i] = world[player[0] + player[2]][i];
        world[player[0] + player[2]][i] = c;
      }
      player[0]++;
      redraw();
    }
  }
}

