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
  color colour;
  int h, w;
    
  Player()
  {
    pos = new PVector();
    h = 40;
    w = 35;
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
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
    if (checkKey(up) && pos.y > 0)
    {
      pos.y -= speed;
    }
    if (checkKey(down) && pos.y < height - h)
    {
      pos.y += speed;
    }
    if (checkKey(left) && pos.x > 0)
    {
      pos.x -= speed;
    }    
    if (checkKey(right) && pos.x < width - w)
    {
      pos.x += speed;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
      Bullet b = new Bullet();
      b.pos = pos.get();
      bullets.add(b);
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour);    
    rect(pos.x, pos.y, w, h);
  }  
}
