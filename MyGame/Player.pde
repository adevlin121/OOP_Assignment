class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  int h, w;
  boolean canShoot;
  int shootTime;
  int lives;
  boolean untouch;
  boolean flash;
  int untouchTime;
  boolean alive;
    
  Player()
  {
    pos = new PVector();
    h = 40;
    w = 35;
    shootTime = 0;
    canShoot = true;
    lives = 5;
    untouch = false;
    untouchTime = 181;
    alive = true;
  }
  
  Player(int index, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, XML xml)
  {
    this(index
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if(lives < 1)
    {
      alive = false;
    }
    //if/else if statement to control invincibility from hit or powerup
    if(untouchTime < 180)
    {
      untouchTime++;
      untouch = true;
      
      if(untouchTime%5 == 0)
      {
        flash = !flash;
      }
    }
    else if(untouchTime >= 180)
    {
      untouch = false;
    }
    
    //timer to control shooting
    shootTime++;
    if(shootTime > 0)
    {
      canShoot = true;
    }
    
    //key checking
    if (checkKey(up) && pos.y > h)
    {
      pos.y -= (speed*2);
    }
    if (checkKey(down) && pos.y < height - h)
    {
      pos.y += (speed*2);
    }
    if (checkKey(left) && pos.x > 0)
    {
      pos.x -= (speed*2);
    }    
    if (checkKey(right) && pos.x < width)
    {
      pos.x += (speed*2);
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1) && canShoot)
    {
      //println("Player " + index + " button 1");
      Bullet b = new Bullet();
      b.pos = pos.get();
      bullets.add(b);
      shootTime = -10;
      canShoot = false;
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }
  }
  
  void display()
  {
    rectMode(CENTER);
    //if else statement for the player being invincible after hit or powerup
    if(untouch && flash)
    {
      stroke(0);
    }//end if()
    else
    {
      stroke(255);
    }//end else
    
    //drawing the players
    //rect(pos.x, pos.y, w, h);
    line(pos.x, pos.y - (h/2), pos.x + (w/2), pos.y + (h/2));
    line(pos.x + (w/2), pos.y + (h/2), pos.x, pos.y);
    line(pos.x, pos.y, pos.x - (w/2), pos.y + (h/2));
    line(pos.x - (w/2), pos.y + (h/2), pos.x, pos.y - (h/2));
    rectMode(CORNER);
  }//end display()
}//end Player
