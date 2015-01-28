class Tank extends Enemy
{  
  Tank()
  {
    w = (int)(width / 26.6);
    h = height / 18;
    pos.x = (int)random(0, 26) * w;
    pos.y = 0;
    hp = 20;
    vel.y = speed/2;
  }
  
  void update()
  {    
    if(hp < 1 || pos.y > height)
    {
      alive = false;
      score += 10;
      killcount++;
      diff += 0.1f;
    }//end if()
    
    //timer to make the speeder pause before moving
    if(gofastTime/60 > 1)
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
    speeder.resize(w, h);
    image(speeder, 0, 0);
    popMatrix();
  }//end display()
}//end Grunt

