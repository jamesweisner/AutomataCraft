void keyPressed()
{
  if(key == CODED)
  {
    switch(keyCode)
    {
      case UP:
        focus.move(0, -1);
        break;
      case DOWN:
        focus.move(0, +1);
        break;
      case LEFT:
        focus.move(-1, 0);
        break;
      case RIGHT:
        focus.move(+1, 0);
        break;
    }
  }
}