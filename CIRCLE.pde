class Circle
{
  float x, y, ax, ay, ang, spd;
  boolean fixed, trace, upd = true;
  int f_num, rad;
  
  
  Circle(float _x, float _y, int radius, float speed)
  {
    this.x = _x;
    this.y = _y;
    this.rad = radius;
    this.spd = speed;
  }
  
  Circle(int father, int radius, float speed)
  {
    this.f_num = father;
    this.rad = radius;
    this.spd = speed;
    this.fixed = true;
  }
  
  
  
  
  void show()
  {
    stroke(210);
    noFill();
    ellipse(this.x, this.y, this.rad, this.rad);
    
    stroke(120);
    
    line(this.x, this.y, this.ax, this.ay);
  }
    
  
  void update()
  {
    if(this.fixed)
    {
      this.x = circles[f_num].ax;
      this.y = circles[f_num].ay;
    }
    
    this.ax = this.x + (this.rad / 2) * cos(this.ang);
    this.ay = this.y + (this.rad / 2) * sin(this.ang);
    
    if(this.upd)
      this.ang += this.spd;
    
    if(this.ang >= TWO_PI || this.ang <= -TWO_PI)
      this.ang = 0; 
  
  
  if(this.trace && this.upd)
  {
    points.add(new Point(this.ax, this.ay));
  }
  
  }
  
  
}
