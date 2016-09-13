final color BACKGROUND = color(255, 246, 229);
final int GRID_WIDTH = 6;
final int GRID_HEIGHT = 4;

final float H_SPACE = 70;
final float V_SPACE = 70;

ArrayList<Handle> handles = new ArrayList<Handle>();

void setup()
{
  size(600, 400, FX2D);

  for (int i = 0; i < GRID_WIDTH * GRID_HEIGHT; i++)
    handles.add(new Handle());

  handles.get(5).fixed = true;

  resetGrid();
}

void draw()
{
  background(BACKGROUND);

  for (Handle h : handles)
  {
    h.update();
    h.render();
  }
}

void resetGrid()
{
  for (int u = 0; u < GRID_WIDTH; u++)
  {
    for (int v = 0; v < GRID_HEIGHT; v++)
    {
      Handle h = handles.get(u * GRID_HEIGHT + v);
      h.moveTo(new PVector(50 + H_SPACE * u, 50 + V_SPACE * v));
    }
  }
}

void keyPressed() {
  switch (key) {
  case 'R':
    resetGrid();
    break;
  default:  
    break;
  }
}