class Untouch extends Powerup
{
  boolean flash;
  int flashCount;
  
  Untouch()
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
    
    flashCount++;
    if(flashCount%10 == 0)
    {
      flash = !flash;
    }//end if()
  }//end update()
  
  void display()
  {
    stroke(255);
    if(flash)
    {
      fill(0, 0, 255);
    }//end iof()
    else
    {
      fill(0, 0, 255, 100);
    }
    rect(pos.x, pos.y, w, h);
  }//end display()
}//end life
