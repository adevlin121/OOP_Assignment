class Grunt extends Enemy
{
  int w, h;
  
  Grunt()
  {
    w = 50;
    h = 50;
    pos.x = (int)random(width - w);
    pos.y = 0;
    hp = 5;
  }
  
  void update()
  {
    if(hp < 1)
    {
      alive = false;
    }//end if()
  }//end update()
}//end Grunt

