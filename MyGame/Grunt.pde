class Grunt extends Enemy
{
  int w, h;
  
  Grunt()
  {
    w = (int)(width / 26.6);
    h = height / 18;
    pos.x = (int)random(0, 26) * w;
    pos.y = 0;
    hp = 5;
  }
  
  void update()
  {
    if(hp < 1 || pos.y > height)
    {
      alive = false;
    }//end if()
    
    pos.add(vel);
  }//end update()
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0, 0, w, h);
    popMatrix();
  }//end display()
}//end Grunt

