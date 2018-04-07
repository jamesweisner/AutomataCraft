Boolean holdingShift = false;

void keyPressed()
{
  if(key == CODED)
  {
    switch(keyCode)
    {
      case SHIFT:
        holdingShift = true;
        break;
      case UP:
        if(holdingShift)
          focus.empty(0, -1);
        else
          focus.move(0, -1);
        break;
      case DOWN:
        if(holdingShift)
          focus.empty(0, +1);
        else
          focus.move(0, +1);
        break;
      case LEFT:
        if(holdingShift)
          focus.empty(-1, 0);
        else
          focus.move(-1, 0);
        break;
      case RIGHT:
        if(holdingShift)
          focus.empty(+1, 0);
        else
          focus.move(+1, 0);
        break;
    }
  }
  else
  {
    if(key >= '1' && key <= '9')
      hotbar = int("" + key);
    if(key == ' ')
      focus.place(hotbar);
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    switch(keyCode)
    {
      case SHIFT:
        holdingShift = false;
        break;
    }
  }
}