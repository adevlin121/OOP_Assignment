class Life extends Powerup
{
  Life()
  {
    w = width / 64;
    h = height / 45;
    pos.x = (int)random(width - w);
    pos.y = 0;
    vel.y = speed;
  }//end Life()
  
  void update()
  {
    if(pos.y > height)
    {
      alive = false;
    }//end if
    
    pos.add(vel);
  }//end update()
  
  void display()
  {
    stroke(255);
    fill(random(255), random(255), random(255));
    rect(pos.x, pos.y, w, h);
  }//end display()
}//end life
