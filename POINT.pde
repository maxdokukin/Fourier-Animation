class Point
{
  float x, y;
  
  Point(float _x, float _y)
  {
    this.x = _x;
    this.y = _y;
  }
  
  void show()
  {
    stroke(245, 66, 200);
    strokeWeight(2);
    
    point(this.x, this.y);
    
    strokeWeight(1);
  }
}
