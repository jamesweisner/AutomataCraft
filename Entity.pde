class Entity {
  int x, y, z;
  int energy;
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
  void update()
  {
    Cell cell = world.layers[z].getCell(this.x, this.y);
    if(cell instanceof Gemstone)
      ((Gemstone) cell).passive((Entity) this);
  }
}

class EntityPlayer extends Entity {
  EntityPlayer(int x, int y, int z)
  {
    super(x, y, z);
  }
  void move(int x, int y)
  {
    if(world.layers[z].getCell(this.x + x, this.y + y).collision())
      return; // Blocked by collision.
    this.x += x;
    this.y += y;
  }
  void empty(int x, int y)
  {
    if(!world.layers[z].clearCell(this.x + x, this.y + y))
      return; // Failed to clear cell.
    this.x += x;
    this.y += y;
  }
  void place(int id)
  {
    if(inventory[id] < 1)
      return; // Not enough of this item.
    if(!(world.layers[z].getCell(this.x, this.y) instanceof CellEmpty))
      return; // Can only place into empty cells.
    inventory[id]--;
    Cell cell = null;
    switch(id)
    {
      case 1:
        cell = new CellRock();
        break;
      case 2:
        cell = new CellBrick();
        break;
      case 3:
        cell = new CellGold();
        break;
      case 4:
        // TODO cell = new CellEmerald();
        break;
      case 5:
        // TODO cell = new CellRuby();
        break;
      case 6:
        // TODO cell = new CellSapphire();
        break;
      case 7:
        // TODO cell = new CellTopaz();
        break;
      case 8:
        // TODO cell = new CellDiamond();
        break;
      case 9:
        // TODO cell = new CellOnyx();
        break;
    }
    if(cell == null)
      return; // Unable to instantiate.
    world.layers[z].setCell(cell, this.x, this.y);
  }
  void activate()
  {
    Cell cell = world.layers[z].getCell(this.x, this.y);
    if(!(cell instanceof Gemstone))
      return; // Only works on gemstones.
    ((Gemstone) cell).activate(this);
  }
  color getColor()
  {
    int c = round(50 * (1 + sin(frameCount / 10.0)));
    return color(155 + c, c, c);
  }
}

class EntityMob extends Entity {
  EntityMob(int x, int y, int z)
  {
    super(x, y, z);
  }
}