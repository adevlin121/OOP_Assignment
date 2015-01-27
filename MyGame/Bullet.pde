class Bullet
{
  PVector pos;
  PVector vel;
  boolean alive;
  color colour;
  
  Bullet()
  {
    alive = true;
    pos = new PVector();
    vel = new PVector(0, speed*(-2));
  }//end Bullet()
  
  void update()
  {
    if(pos.y < 0)
    {
      alive = false;
    }//end if()
    
    pos.add(vel);
  }//end update()
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    line(17, 5, 17, -5);
    popMatrix();
  }//end display()
}//end Bulet
