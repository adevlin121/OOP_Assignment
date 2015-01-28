class Speeder extends Enemy
{
  int gofastTime;
  
  Speeder()
  {
    w = (int)(width / 26.6);
    h = height / 18;
    pos.x = (int)random(0, 26) * w;
    pos.y = 0;
    hp = 3;
    vel.y = speed*5;
  }
  
  void update()
  {
    gofastTime++;
    
    if(hp < 1 || pos.y > height)
    {
      alive = false;
      score += 10;
      killcount++;
      diff += 0.1f;
    }//end if()
    
    //timer to make the speeder pause before moving
    if(gofastTime/60 > 2)
    {
      pos.add(vel);
    }
  }//end update()
  
  void display()
  {
    stroke(255);
    fill(200, 70, 70);
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0, 0, w, h);
    popMatrix();
  }//end display()
}//end Grunt

