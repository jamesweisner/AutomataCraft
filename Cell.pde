interface Cell {
  int update();
  color getColor();
}

class CellEmpty implements Cell {
  int update()
  {
    return -1;
  }
  color getColor()
  {
    return color(0, 0, 0);
  }
}

class CellDirt implements Cell {
  color c;
  CellDirt(int i)
  {
    this.c = color(i, i, i);
  }
  int update()
  {
    return -1;
  }
  color getColor()
  {
    return c;
  }
}

class CellPlayer implements Cell {
  int update()
  {
    return -1;
  }
  color getColor()
  {
    return color(128, 0, 0);
  }
}

class CellEnergy implements Cell {
  float glowRate;
  CellEnergy()
  {
    this.glowRate = 2.0 + random(10);
  }
  int update()
  {
    return 4;
  }
  color getColor()
  {
    int c = round(25 * sin(frameCount / glowRate));
    return color(200 + c, 150 - c, 50);
  }
}

