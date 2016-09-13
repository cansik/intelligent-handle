boolean mouseDown = false;
Handle currentHandle = null;
PVector mouseDelta = null;

void mousePressed() {
  if (!mouseDown)
  {
    PVector m = new PVector(mouseX, mouseY);
    for (Handle h : handles)
    {
      if (h.isInside(m))
      {
        currentHandle = h;
        h.grabbed = true;
        mouseDelta = PVector.sub(h.position, m);
        mouseDown = true;
        return;
      }
    }
  }
}

void mouseDragged() 
{
  if (mouseDown)
  {
    if (currentHandle.fixed)
      return;

    PVector m = new PVector(mouseX, mouseY);
    moveHandleToPosition(currentHandle, PVector.add(mouseDelta, m));
  }
}

void mouseReleased() {
  if (mouseDown)
  {
    mouseDown = false;
    currentHandle.grabbed = false;
    currentHandle = null;
  }
}

void moveHandleToPosition(Handle h, PVector p)
{
  h.moveTo(p);
}