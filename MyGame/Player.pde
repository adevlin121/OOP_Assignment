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
    
  Player()
  {
    pos = new PVector();
    h = 40;
    w = 35;
    shootTime = 0;
    canShoot = true;
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
    shootTime++;
    if(shootTime > 0)
    {
      canShoot = true;
    }
    if (checkKey(up) && pos.y > 0)
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
    if (checkKey(right) && pos.x < width - w)
    {
      pos.x += (speed*2);
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1) && canShoot)
    {
      println("Player " + index + " button 1");
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
    stroke(255);
    fill(100, 200, 100);    
    rect(pos.x, pos.y, w, h);
  }  
}
