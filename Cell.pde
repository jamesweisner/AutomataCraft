class Cell {
  color getColor()
  {
    return color(0, 0, 0);
  }
  Boolean isEmpty()
  {
    return false;
  }
}

class CellEmpty extends Cell {
  Boolean isEmpty()
  {
    return true;
  }
}

class CellRock extends Cell {
  color c;
  CellRock(int i)
  {
    this.c = color(i, i, i);
  }
  color getColor()
  {
    return c;
  }
}

class CellGold extends Cell {
  float glowRate;
  CellGold()
  {
    this.glowRate = 2.0 + random(10);
  }
  color getColor()
  {
    int c = round(25 * sin(frameCount / glowRate));
    return color(200 + c, 150 - c, 50);
  }
}