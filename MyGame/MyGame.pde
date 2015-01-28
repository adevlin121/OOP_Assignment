/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
boolean[] keys = new boolean[526];
int w = 1280;
int h = 900;
int speed = 3;
int score = 0;
int killcount = 0;
//difficulty variable
float diff = 1f;
int splash;
boolean flash;

void setup()
{
  size(w, h);
  setUpPlayerControllers();
  rectMode(CORNER);
  splash = 0;
  flash = true;
}

void draw()
{
  background(0);
  
  if(splash == 0)
  {
    if(frameCount%10 == 0)
    {
      flash = !flash;
    }
    
    fill(255);
    textSize(120);
    text("SPACEJET FIGHTER ", 120, 200);
    text("COMBAT SIMULATOR", 30, 400);
    
    textSize(80);
    text("Press Enter to Start", 300, 800);
    
    textSize(20);
    text("Shoot enemies: ", 350, 600);
    stroke(255);
    fill(70, 70, 70);
    rect(520, 570, 50, 50);
    
    fill(255);
    text("Extra life:", 650, 600);
    stroke(255);
    fill(random(255), random(255), random(255));
    rect(760, 585, 20, 20);
    
    fill(255);
    text("Invincible:", 830, 600);
    if(flash)
    {
      fill(0, 0, 255, 100);
    }
    else
    {
      fill(0, 0, 255);
    }
    rect(950, 585, 20, 20);
    
    if(keyPressed && key == '\n')
    {
      splash = 2;
    }
  }
  
  else if(splash == 1)
  {
    fill(255);
    textSize(50);
    text("SPACEJET FIGHTER COMBAT SIMULATOR", 150, 200);
    textSize(100);
    text("GAME OVER", 380, 400);
    textSize(20);
    text("Your score: " + score, 600, 500);
  }
  
  else
  { 
    //hud();
    fill(0, 255, 0);
    text("Score: " + score, width - 100, 40);
    
    //for loop that calls the player methods to update the location and display it to the screen
    for(int i=0; i<players.size(); i++)
    {
      players.get(i).update();
      players.get(i).display();
      
      fill(0, 255, 0);
      textSize(12);
      text("Player 1 lives: " + players.get(0).lives, 40, 40);
      text("Player 2 lives: " + players.get(1).lives, 40, 60);
      
      if(players.get(i).alive == false)
      {
        splash = 1;
      }
    }//end for()
    
    //for loop to update the position of all bullets and display them on screen
    for(int i = 0; i < bullets.size(); i++)
    {
      bullets.get(i).update();
      bullets.get(i).display();
      
      //if statement to remove bullets from the list
      if(bullets.get(i).alive == false)
      {
        bullets.remove(i);
        //println("bullet " + i + " removed");
      }//end if()
    }//end for()
    
    //if statement to create new grunts
    if(frameCount % (60*2.5) == 0 && frameCount > 0)
    {
      //println("new enemy");
      Enemy e = new Grunt();
      enemies.add(e);
    }//end if()
    
    //if statement to create new speeders
    if(frameCount % (60*6) == 0 && frameCount > 0)
    {
      //println("new enemy");
      Enemy e = new Speeder();
      enemies.add(e);
    }//end if()
    
    //for loop to update position and display enemies
    for(int i = 0; i < enemies.size(); i++)
    {
      enemies.get(i).update();
      enemies.get(i).display();
      
      //if statement to remove an enemy from the list when it dies
      if(enemies.get(i).alive == false)
      {
        enemies.remove(i);
        //println("enemy " + i + " removed");
      }//end if()
    }//end for()
    
    //collision detecting nested for loops for the bullets and enemies
    for(int i=0; i<enemies.size(); i++)
    {
      for(int j=0; j<bullets.size(); j++)
      {
        if(bullets.get(j).pos.y <= enemies.get(i).pos.y + enemies.get(i).h)
        {
          if(bullets.get(j).pos.y >= enemies.get(i).pos.y)
          {
            if(bullets.get(j).pos.x >= enemies.get(i).pos.x)
            {
              if(bullets.get(j).pos.x <= enemies.get(i).pos.x + enemies.get(i).w)
              {
                enemies.get(i).hp--;
                bullets.get(j).alive = false;
                score++;
              }//end inner inner if()
            }//end inner if()
          }//end outer if()
        }//end outer outer if()
      }//end inner for()
    }//end outer for()
    
    //collision detecting for enemies on players using nested for loops
    for(int i=0; i<enemies.size(); i++)
    {
      for(int j=0; j<players.size(); j++)
      {
        if((players.get(j).pos.y - (players.get(j).h/2)) < enemies.get(i).pos.y + enemies.get(i).h &&
            players.get(j).pos.y + (players.get(j).h/2) > enemies.get(i).pos.y &&
            players.get(j).pos.x - (players.get(j).w/2) < enemies.get(i).pos.x + enemies.get(i).w &&
            players.get(j).pos.x + (players.get(j).w/2) > enemies.get(i).pos.x &&
            players.get(j).untouch == false)
        {
          players.get(j).lives--;
          players.get(j).untouchTime = 0;
        }//end if()
      }//end inner for()
    }//end outer for()
    
    //if statement to count the enemies killed and give a life after certain number of enemies are killed
    if(killcount%(5*(int)diff) == 0 && killcount > 0)
    {
      //println("new life");
      Powerup l = new Life();
      powerups.add(l);
      killcount++;
    }//end if()
    
    if(killcount%(4*(int)diff) == 0 && killcount > 0)
    {
      //println("new untouch");
      Powerup u = new Untouch();
      powerups.add(u);
      killcount++;
    }//end if()
    
    //for loop to update and display the powerup
    for(int i = 0; i < powerups.size(); i++)
    {
      powerups.get(i).update();
      powerups.get(i).display();
      
      //if statement to remove a powerup from the list when it dies
      if(powerups.get(i).alive == false)
      {
        powerups.remove(i);
        diff++;
        //println("powerup " + i + " removed");
      }//end if()
    }//end for()
    
    //collision for collecting powerups
    for(int i=0; i<powerups.size(); i++)
    {
      for(int j=0; j<players.size(); j++)
      {
        if((players.get(j).pos.y - (players.get(j).h/2)) < powerups.get(i).pos.y + powerups.get(i).h &&
            players.get(j).pos.y + (players.get(j).h/2) > powerups.get(i).pos.y &&
            players.get(j).pos.x - (players.get(j).w/2) < powerups.get(i).pos.x + powerups.get(i).w &&
            players.get(j).pos.x + (players.get(j).w/2) > powerups.get(i).pos.x)
        {
          powerups.get(i).alive = false;
          if(powerups.get(i) instanceof Life)
          {
            players.get(j).lives++;
          }
          if(powerups.get(i) instanceof Untouch)
          {
            players.get(j).untouchTime = -180;
          }
        }//end if()
      }//end inner for()
    }//end outer for()
  }//end else()
}//end draw()

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
    Player p = new Player(i, playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = (h/20) * 19;
    players.add(p);         
  }
}
