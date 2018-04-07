void draw()
{
  stroke(0);
  for(int i = 0; i < CAM_WIDTH; i++)
  {
    for(int j = 0; j < CAM_HEIGHT; j++)
    {
      int x = focus.x + i - CAM_WIDTH  / 2;
      int y = focus.y + j - CAM_HEIGHT / 2;
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
    entity.update();
    fill(entity.getColor());
    ellipse(CAM_WIDTH / 2 * 10 + 2, CAM_HEIGHT / 2 * 10 + 2, 7, 7);
  }

  // Draw HUD.
  fill(255);
  rect(5, 5, 150, 245);
  fill(0);
  text("X: "        + str(focus.x), 10, 20);
  text("Y: "        + str(focus.y), 10, 40);
  text("Energy: "   + str(focus.energy), 10, 60);
  text("[1] Rock: "     + str(inventory[1]), 25, 80);
  text("[2] Brick: "    + str(inventory[2]), 25, 100);
  text("[3] Gold: "     + str(inventory[3]), 25, 120);
  text("[4] Emerald: "  + str(inventory[4]), 25, 140);
  text("[5] Ruby: "     + str(inventory[5]), 25, 160);
  text("[6] Sapphire: " + str(inventory[6]), 25, 180);
  text("[7] Topaz: "    + str(inventory[7]), 25, 200);
  text("[8] Diamond: "  + str(inventory[8]), 25, 220);
  text("[9] Onyx: "     + str(inventory[9]), 25, 240);
  text(">", 13, 60 + 20 * hotbar);
}