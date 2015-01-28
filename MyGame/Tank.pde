class Tank extends Enemy
{  
  Tank()
  {
    w = 80;
    h = 80;
    pos.x = (int)random(0, 16) * w;
    pos.y = 0;
    hp = 20;
    vel.y = speed/2;
  }
  
  void update()
  {    
    if(hp < 1 || pos.y > height)
    {
      alive = false;
      score += 50;
      killcount++;
      diff += 0.1f;
    }//end if()
    
    //timer to make the speeder pause before moving
    pos.add(vel);
  }//end update()
  
  void display()
  {
    stroke(255);
    fill(200, 70, 70);
    pushMatrix();
    translate(pos.x, pos.y);
    tank.resize(w, h);
    image(tank, 0, 0);
    popMatrix();
  }//end display()
}//end Grunt

