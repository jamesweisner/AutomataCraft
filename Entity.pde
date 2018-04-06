class Entity {
  int x;
  int y;
  int z;
  Entity(int x, int y, int z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  color getColor()
  {
    return 0;
  }
}

class EntityPlayer extends Entity {
  EntityPlayer(int x, int y, int z)
  {
    super(x, y, z);
  }
  void move(int x, int y)
  {
    world.layers[z].getCell(this.x + x, this.y + y).isEmpty();
    this.x += x;
    this.y += y;
    redraw();
  }
  color getColor()
  {
    int c = round(25 * sin(frameCount / 20));
    return color(100 + c, c, c);
  }
}

class EntityMob extends Entity {
  EntityMob(int x, int y, int z)
  {
    super(x, y, z);
  }
}