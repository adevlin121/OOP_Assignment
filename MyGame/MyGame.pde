/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean[] keys = new boolean[526];
int w = 1280;
int h = 900;
int speed = 5;
int px, py;

void setup()
{
  size(w, h);
  setUpPlayerControllers();
}

void draw()
{
  background(0);
  
  //for loop that calls the player methods to update the location and display it to the screen
  for(Player player:players)
  {
    player.update();
    player.display();
  }
  
  //for loop to update the position of all bullets and display them on screen
  for(int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).update();
    bullets.get(i).display();
    
    if(bullets.get(i).alive == false)
    {
      bullets.remove(i);
      println("bullet " + i + " removed");
    }//end if()
  }//end for()
  
  //if statement to create new enemies
  if(frameCount % (60*4) == 0)
  {
    println("new enemy");
    
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = (h/20) * 19;
    players.add(p);         
  }
}
