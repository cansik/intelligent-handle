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

void moveHandleToPosition(Handle handle, PVector p)
{
  for (Handle h : handles)
  {
    if (h == handle)
      continue;
      
    float d = Math.abs(handle.position.dist(h.position));
    float strength = 1f / d;
    
    PVector delta = p.copy().sub(h.position);
    h.position.add(delta.mult(strength));
    h.target = h.position;
  }

  handle.moveTo(p);
}