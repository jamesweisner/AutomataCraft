interface Gemstone {
  void passive(Entity entity);
  void activate(Entity entity);
}

class Cell {
  Chunk chunk;
  int x, y; // Position inside the chunk!
  float phase;
  color getColor()
  {
    return color(0, 0, 0);
  }
  Boolean collision()
  {
    return false;
  }
  int getID()
  {
    return -1;
  }
  int cost()
  {
    return 0;
  }
}

class CellEmpty extends Cell {
  int getID()
  {
    return 0;
  }
}

class CellRock extends Cell {
  color c;
  color getColor()
  {
    return c;
  }
  Boolean collision()
  {
    return true;
  }
  int getID()
  {
    return 1;
  }
  int cost()
  {
    return 100;
  }
}

class CellBrick extends Cell {
  color getColor()
  {
    return color(100, 0, 0);
  }
  Boolean collision()
  {
    return true;
  }
  int getID()
  {
    return 2;
  }
  int cost()
  {
    return 10000;
  }
}

class CellGold extends Cell implements Gemstone {
  CellGold()
  {
    this.phase = 2.0 + random(10);
  }
  color getColor()
  {
    int c = round(25 * sin(frameCount / phase));
    return color(200 + c, 150 - c, 50);
  }
  int getID()
  {
    return 3;
  }
  void passive(Entity entity)
  {
    entity.energy += this.chunk.syncGems(this);
  }
  void activate(Entity entity)
  {
    // TODO
  }
  int cost()
  {
    return 1000;
  }
}