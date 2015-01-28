class Bullet
{
  PVector pos;
  PVector vel;
  boolean alive;
  
  Bullet()
  {
    alive = true;
    pos = new PVector();
    vel = new PVector(0, speed*(-3));
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
    stroke(255, 0, 0);
    pushMatrix();
    translate(pos.x, pos.y);
    line(17, 5, 17, -5);
    popMatrix();
  }//end display()
}//end Bulet
