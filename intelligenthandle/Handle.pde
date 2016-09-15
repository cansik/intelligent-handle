class Handle
{
  final float SIZE = 25f;
  final float STROKE_WEIGHT = 2f;

  final color NORMAL_COLOR = color(62, 69, 76);
  final color GRAB_COLOR = color(255, 137, 102);

  final color INNER_COLOR = color(126, 206, 253);
  final color FIXED_COLOR = color(33, 133, 197);

  final float EASING = 0.2;

  PVector position;
  PVector target;

  boolean grabbed;
  boolean fixed;

  public  Handle()
  {
    this(0, 0);
  }

  public Handle(float x, float y)
  {
    position = new PVector(x, y);
    target = new PVector();
    grabbed = false;
    fixed = false;
  }

  public void update()
  {
    PVector delta = target.copy().sub(position);
    position.add(delta.mult(EASING));
  }

  public void moveTo(PVector v)
  {
    moveTo(v, true);
  }

  public void moveTo(PVector v, boolean checkFixed)
  {
    if (checkFixed && fixed)
      return;
    target = v;
  }

  public void render()
  {
    strokeWeight(STROKE_WEIGHT);
    stroke(grabbed ? GRAB_COLOR : NORMAL_COLOR);
    fill(fixed ? FIXED_COLOR : INNER_COLOR);

    ellipse(position.x, position.y, SIZE, SIZE);
  }

  public boolean isInside(PVector p)
  {
    return (Math.abs(p.dist(position)) < SIZE);
  }
}