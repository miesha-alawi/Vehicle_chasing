Vehicle v;
PVector target;

void setup()
{
  size(400,400);
  v = new Vehicle(width/2, height/2);
}

void draw()
{
  background(50);
  target = new PVector(mouseX,mouseY);
  v.update();
  v.seek(target);
  v.draw();
}
