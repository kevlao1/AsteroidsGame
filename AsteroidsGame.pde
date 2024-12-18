//resolutions
int horizRes = 1920;
int vertRes = 1080;

//other random variables that are preferably global
int fontSize = horizRes/7;
int frameRateVar = 60;
int asteroidThickness = 5;
float scaling = 1.0;
boolean wPressed, sPressed, aPressed, dPressed, ePressed, spacePressed, rPressed, altPressed;

//instances
openingMenu firstMenu = new openingMenu();
starterMenu secondMenu = new starterMenu();
settingsMenu settings = new settingsMenu();
backgroundStars theBackground = new backgroundStars();
spaceship mothership = new spaceship();
settingsSubMenu subMenu = new settingsSubMenu();
allAsteroids asteroidField = new allAsteroids();
allBullets magazine = new allBullets();
inGameMenu gameMenu = new inGameMenu();
debugMenu debugCorner = new debugMenu();


void setup(){
 size(3840, 2160); 
 frameRate(frameRateVar);
}

void draw(){
  fontSize = horizRes/7;
  theBackground.displayBackground();
  secondMenu.showMenu();
  firstMenu.showMenu();
  settings.showMenu();
  subMenu.showMenu();
  for(int i = 0; i < magazine.allOfTheBullets.size(); i++){
    for(int a = 0; a < asteroidField.allOfTheAsteroids.size(); a++){
   if(i < magazine.allOfTheBullets.size() && a < asteroidField.allOfTheAsteroids.size() && dist(magazine.allOfTheBullets.get(i).getshipX(), magazine.allOfTheBullets.get(i).getshipY(), asteroidField.allOfTheAsteroids.get(a).getshipX(), asteroidField.allOfTheAsteroids.get(a).getshipY()) <= 50*scaling*asteroidField.gethitboxRatio()){
   magazine.allOfTheBullets.remove(i);
   if(i>0){i--;}
   asteroidField.allOfTheAsteroids.remove(a);
   if(a>0){a--;}
   }
    }
   }
  asteroidField.kaboom(mothership.getshipX(), mothership.getshipY());
  asteroidField.asteroidActions();
  magazine.bulletReload();
 if(spacePressed == true){magazine.bulletAdd(mothership.getshipAngle(), mothership.getshipX(), mothership.getshipY(), mothership.getshipSpeed());}
  magazine.bulletActions();
  mothership.show();
  mothership.move();
  mothership.hyperspace();
  gameMenu.showMenu();
  magazine.bulletCounter();
  firstMenu.crasherMoment();
  settings.setasteroidNum(asteroidField.getnumOfAsteroids());
  subMenu.setasteroidNum(asteroidField.getnumOfAsteroids());
  debugCorner.debugIndication(firstMenu.getMenuSelect(), settings.getMenuSelect(), subMenu.getMenuSelect(), mothership.getshipX(), mothership.getshipY(), mothership.getvelocityMethod(), mothership.getshipSpeed(), mothership.getvelocityX(), mothership.getvelocityY(), mothership.getshipAngle(), asteroidField.getnumOfAsteroids(), scaling, horizRes, vertRes, fontSize, frameRateVar);
}

void keyPressed(){
  //yes ik i put key == ' ' like a thousand times but its for organization :p
  //spaceship movement
  if(key == 'w'){wPressed = true;}
  if(key == 's'){sPressed = true;}
  if(key == 'a'){aPressed = true;}
  if(key == 'd'){dPressed = true;}
  if(key == 'e'){ePressed = true;}
  if(key == ' '){spacePressed = true;}
  if(key == 'r'){rPressed = true;}
  if(keyCode == ALT){altPressed = true;}
  
  //submenu options
  if(subMenu.getopening() == true){
  if(subMenu.getMenuSelect() != 1){
  if(keyCode == UP || key == 'w'){subMenu.setoption(subMenu.getoption()-1);}
  if(keyCode == DOWN || key == 's'){subMenu.setoption(subMenu.getoption()+1);} 
  }
  if(subMenu.getMenuSelect() == 0){
  if(subMenu.getoption() == 0){
  if(keyCode == LEFT || key == 'a'){horizRes-=16; vertRes-=9;}   
  if(keyCode == RIGHT || key == 'd'){horizRes+=16; vertRes+=9;}
}  
  if(subMenu.getoption() == 1){
   if(keyCode == LEFT || key == 'a'){if(frameRateVar > 1){frameRateVar--; frameRate(frameRateVar);}}
   if(keyCode == RIGHT || key == 'd'){frameRateVar++; frameRate(frameRateVar);}
  }
   if(subMenu.getoption() == 2){
   if(keyCode == LEFT || key == 'a'){scaling-=0.10; scaling = Math.round(scaling*10.0)/10.0;}
   if(keyCode == RIGHT || key == 'd'){scaling+=0.10; scaling = Math.round(scaling*10.0)/10.0;}
  }
  }
  else if(subMenu.getMenuSelect() == 1){   
   if(keyCode == LEFT || key == 'a'){mothership.setvelocityMethod(0); settings.setoption(0); subMenu.setoption(0);}
   if(keyCode == RIGHT || key == 'd'){mothership.setvelocityMethod(1); settings.setoption(1); subMenu.setoption(1);}
  }
  else if(subMenu.getMenuSelect() == 2){
    if(subMenu.getoption() == 0){
    if(keyCode == LEFT || key == 'a'){asteroidField.asteroidSubtract(); subMenu.setasteroidNum(asteroidField.getnumOfAsteroids());}
    if(keyCode == RIGHT || key == 'd'){asteroidField.asteroidAdd(); subMenu.setasteroidNum(asteroidField.getnumOfAsteroids());}
    }
    else if(subMenu.getoption() == 1){
    if(keyCode == LEFT || key == 'a'){asteroidThickness--;}   
    if(keyCode == RIGHT || key == 'd'){asteroidThickness++;}
    }
  }
else if(subMenu.getMenuSelect() == 3){
if(subMenu.getoption() == 0){
   if(keyCode == LEFT || key == 'a'){theBackground.setstaticBackgroundOn(false); subMenu.setstaticBackgroundOn(false); settings.setstaticBackgroundOn(false);}   
   if(keyCode == RIGHT || key == 'd'){theBackground.setstaticBackgroundOn(true); subMenu.setstaticBackgroundOn(true); settings.setstaticBackgroundOn(true);}
}
else if(subMenu.getoption() == 1){
   if(keyCode == LEFT || key == 'a'){theBackground.setrandomColorOn(false); subMenu.setrandomColorOn(false); settings.setrandomColorOn(false);}   
   if(keyCode == RIGHT || key == 'd'){theBackground.setrandomColorOn(true); subMenu.setrandomColorOn(true); settings.setrandomColorOn(true);}
}
else if(subMenu.getoption() == 2){
  if(keyCode == LEFT || key == 'a'){if(theBackground.getframeInterval()-1 > 0)theBackground.setframeInterval(theBackground.getframeInterval()-1); if(subMenu.getframeInterval()-1 > 0)subMenu.setframeInterval(subMenu.getframeInterval()-1); if(settings.getframeInterval()-1 > 0)settings.setframeInterval(settings.getframeInterval()-1);}   
   if(keyCode == RIGHT || key == 'd'){theBackground.setframeInterval(theBackground.getframeInterval()+1); subMenu.setframeInterval(subMenu.getframeInterval()+1); settings.setframeInterval(settings.getframeInterval()+1);}
}
}
  else if(subMenu.getMenuSelect() == 4){
  if(keyCode == LEFT || key == 'a'){debugCorner.setdebugToggle(false); subMenu.setdebugToggle(false); settings.setdebugToggle(false);}   
  if(keyCode == RIGHT || key == 'd'){debugCorner.setdebugToggle(true); subMenu.setdebugToggle(true); settings.setdebugToggle(true);}
  }
  }
  
  //starter menu
  if(firstMenu.getopening() == false && secondMenu.getopening() == true && settings.getopening() == false) {
    if(key == ' ' || keyCode == ENTER){
  secondMenu.setopening(false); 
  mothership.setonOrOff(true);
  asteroidField.asteroidStarter(true);
  magazine.bulletStarter(true);
  gameMenu.setopening(true);
    }
}
  //gameplay
  if(firstMenu.getopening() == false && secondMenu.getopening() == false && settings.getopening() == false){
  if(keyCode == ALT){asteroidField.asteroidAdd();}
  if(keyCode == TAB || keyCode == BACKSPACE){
  firstMenu.setopening(true);
  mothership.setonOrOff(false);
  asteroidField.asteroidStarter(false);
  magazine.bulletStarter(false);
  gameMenu.setopening(false);
  }
  }
  
  //main/opening menu
  if(firstMenu.getopening() == true && firstMenu.getMenuSelect() == 2){
  if(keyCode == ENTER || key == ' '){firstMenu.setcrasher(true);}
}
  if(firstMenu.getopening() == true && firstMenu.getMenuSelect() == 0){
   if(key == ' ' || keyCode == ENTER){
  firstMenu.setopening(false); 
  secondMenu.setopening(true);
  magazine.bulletStarter(false);
  asteroidField.asteroidStarter(false);
  }
}
  if(firstMenu.getopening() == true && secondMenu.getopening() == false){
    if(keyCode == UP || key == 'w'){
  int menuNum = firstMenu.getMenuSelect();
  if(firstMenu.getMenuSelect() > 0) firstMenu.setMenuSelect(menuNum-1);
    }
  }
  if(firstMenu.getopening() == true && secondMenu.getopening() == false){
    if(keyCode == DOWN || key == 's'){
  int menuNum = firstMenu.getMenuSelect();
  if(firstMenu.getMenuSelect() < 2) firstMenu.setMenuSelect(menuNum+1);
    }
  }
  //submenu
    if(firstMenu.getopening() == false && secondMenu.getopening() == false &&  settings.getopening() == true && subMenu.getopening() == false){
      if(keyCode == TAB || keyCode == BACKSPACE){
    settings.setopening(false); 
    firstMenu.setopening(true);
      }
    }
  if(firstMenu.getopening() == false && secondMenu.getopening() == false &&  settings.getopening() == true && subMenu.getopening() == true){
  if(keyCode == TAB || keyCode == BACKSPACE){
  subMenu.setopening(false);
  settings.setSubMenu(false);
  }
}
  if(firstMenu.getopening() == false && secondMenu.getopening() == false && settings.getopening() == true && subMenu.getopening() == false){
    if(keyCode == ENTER || key == ' '){
  subMenu.setopening(true);
  settings.setSubMenu(true);
    }
}
  //settings menu
    if(firstMenu.getMenuSelect() == 1 && firstMenu.getopening() == true && secondMenu.getopening() == false && settings.getopening() == false) {
      if(keyCode == ENTER || key == ' '){
    settings.setopening(true);
    firstMenu.setopening(false);
      }
  }
  //settings options
    if(firstMenu.getopening() == false && secondMenu.getopening() == false && settings.getopening() == true) {
       if(keyCode == UP || key == 'w'){
           if(subMenu.getopening() == true){return;}
  int menuNum = settings.getMenuSelect();
  settings.setMenuSelect(menuNum-1);
  subMenu.setMenuSelect(menuNum-1);
    if(settings.getMenuSelect() < 0) settings.setMenuSelect(0);
    if(subMenu.getMenuSelect() < 0) subMenu.setMenuSelect(0);
  }  
    if(firstMenu.getopening() == false && secondMenu.getopening() == false && settings.getopening() == true) {
       if(keyCode == DOWN || key == 's'){
         if(subMenu.getopening() == true){return;}
  int menuNum = settings.getMenuSelect();
  settings.setMenuSelect(menuNum+1);
  subMenu.setMenuSelect(menuNum+1);
   if(settings.getMenuSelect() > 4) {settings.setMenuSelect(4);}
   if(subMenu.getMenuSelect() > 4) {subMenu.setMenuSelect(4);}
       }
}
  }
}
  
void keyReleased(){
  //spaceship movement
  if(key == 'w'){wPressed = false;}
  if(key == 's'){sPressed = false;}
  if(key == 'a'){aPressed = false;}
  if(key == 'd'){dPressed = false;}
  if(key == 'e'){ePressed = false;}
  if(key == ' '){spacePressed = false;}
  if(key == 'r'){rPressed = false;}
  if(keyCode == ALT){altPressed = false;}
}
