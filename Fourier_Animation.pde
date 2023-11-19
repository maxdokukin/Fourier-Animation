int C_NUM = 6, LINE_LEN = 500;


Circle circles[] = new Circle[C_NUM];

ArrayList<Point> points = new ArrayList<Point>();

float roll_spd = 1;

boolean rollX = false, rollY = false, dr_lines = false, clr_ln = true;


void setup()
{
  size(900, 650);
  circles[0] = new Circle(width / 2, height / 2, 400, 0.01);
  circles[1] = new Circle(0, 100, 0.2);
  circles[2] = new Circle(1, 50, -0.015);
  circles[3] = new Circle(2, 50, 0.1);  
  circles[4] = new Circle(3, 50, 0.1);
  circles[5] = new Circle(4, 50, -0.1);//*/
  
  circles[C_NUM - 1].trace = true;
  
  
  
}




void draw()
{
  
  background(255);
  
  fill(20);
  textSize(30);
  text(points.size(), 70, 51);
    
  
  if(rollX || rollY)
    movePoints();
  
  if(clr_ln)
  {
    fill(0, 255, 0);
    ellipse(40, 40, 30, 30);
    
    if(points.size() >= LINE_LEN)
      points.remove(0);
    
  }
  else
  {
    fill(255, 0, 0);
    ellipse(40, 40, 30, 30);
  }
  
  
  
  if(dr_lines)
  {
    noFill();
    beginShape();
    
    for(Point p : points)
    {
      vertex(p.x, p.y);
    }
    
    endShape();
  }
  
  if(!dr_lines)
    for (Point p : points) 
    {
      p.show();
    }
  
  for(int i = 0; i < C_NUM; i++)
  { 
    circles[i].show();
    circles[i].update();
  }
  

  
}



void keyPressed()
{
  
  switch(key)
  {
  case 's':
    frameRate(map(mouseX, 0, width, 1, 120));
    break;
  
  case 'x':
    rollX = !rollX;
    break;
    
  case 'y':
    rollY = !rollY;
    break;
    
  case 'c':
    points.clear();
    break;
    
  case 'f':
    clr_ln = !clr_ln;
    break;
    
  case 'd':
    for(int i = 0; i < C_NUM; i++)
      circles[i].upd = !circles[i].upd;
    break;
    
  case 'l':
    dr_lines = !dr_lines;
    break;
    
  }
    
    
}

void mouseWheel(MouseEvent event) 
{ 
  roll_spd -= event.getCount() / (float) 10;
}


void movePoints()
{
  for (Point p : points) 
  {
    if(rollY)
      p.y += roll_spd;
    
    if(rollX)
      p.x += roll_spd;
  }
  
  for(int i = points.size() - 1; i >= 0; i--)
  {
    Point p = points.get(i);
    
    if(p.y > height + 40 || p.x > width + 40 || p.y < -40 || p.x < -40)
      points.remove(i);
    
  }
  
}
