//resolutions
int horizRes = 1920;
int vertRes = 1080;

//instances
openingMenu firstMenu = new openingMenu();
starterMenu secondMenu = new starterMenu();
settingsMenu settings = new settingsMenu();
backgroundStars theBackground = new backgroundStars();
spaceship mothership = new spaceship();
settingsSubMenu subMenu = new settingsSubMenu();
allAsteroids asteroidField = new allAsteroids();

//other random variables that need to be global
int fontSize = horizRes/7;
int frameRateVar = 60;
float scaling = 1;
boolean wPressed, sPressed, aPressed, dPressed, ePressed;


void setup(){
 size(1920, 1080); 
 frameRate(frameRateVar);
}

void draw(){
  theBackground.displayBackground();
  secondMenu.showMenu();
  firstMenu.showMenu();
  settings.showMenu();
  mothership.show();
  asteroidField.kaboom(mothership.getshipX(), mothership.getshipY());
  asteroidField.asteroidActions();
  mothership.move();
  mothership.hyperspace();
  firstMenu.crasherMoment();
}

void keyPressed(){
  //yes ik i put key == ' ' like a thousand times but its for organization :p
  //spaceship movement
  if(key == 'w'){wPressed = true;}
  if(key == 's'){sPressed = true;}
  if(key == 'a'){aPressed = true;}
  if(key == 'd'){dPressed = true;}
  if(key == 'e'){ePressed = true;}
  //starter menu
  if(firstMenu.getopening() == false && secondMenu.getopening() == true) {
    if(key == ' ' || keyCode == ENTER){
  secondMenu.setopening(false); 
  mothership.setonOrOff(true);
  asteroidField.asteroidStarter(true);
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
    if(firstMenu.getopening() == false && secondMenu.getopening() == false &&  settings.getopening() == true && subMenu.getopening() == false && keyCode == TAB){
    settings.setopening(false); 
    firstMenu.setopening(true);
    }
  if(firstMenu.getopening() == false && secondMenu.getopening() == false &&  settings.getopening() == true && subMenu.getopening() == true && keyCode == TAB){
  subMenu.setopening(false);
  settings.setSubMenu(false);
}
  if(firstMenu.getopening() == false && secondMenu.getopening() == false && settings.getopening() == true && subMenu.getopening() == false){
    if(keyCode == ENTER || key == ' '){
  subMenu.setopening(true);
  settings.setSubMenu(true);
    }
}
  //settings menu
    if(key == ' ' && firstMenu.getMenuSelect() == 1 && firstMenu.getopening() == true && secondMenu.getopening() == false && settings.getopening() == false) {
    settings.setopening(true);
    firstMenu.setopening(false);
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
}

//this might be buggy af, i DIDNT use the provided code and coded this section myself :p

class fineHeresYourFloater{
  protected float shipX, shipY, shipAngle, shipSpeed;
  protected boolean onOrOff;
  public float getshipX(){return shipX;}
  public float getshipY(){return shipY;}
  public void setonOrOff(boolean i){onOrOff = i;}  
  fineHeresYourFloater(){
    shipX = (int)(Math.random()*horizRes);
    shipY = (int)(Math.random()*vertRes);
    shipAngle = (float)(Math.random()*2*PI);
    shipSpeed = 0;
    onOrOff = false;
  }
}

class spaceship extends fineHeresYourFloater{
  spaceship(){
  shipX = horizRes/2;
  shipY = vertRes/2;
  shipAngle = 3*PI/2;
  shipSpeed = 0;
  onOrOff = false;
  }
  
 void show(){
  if(onOrOff == true){
  float[] xVal = {25*scaling, -(35*scaling), -(12.5*scaling), -(35*scaling)};
  float[] yVal = {0, (25*scaling), 0, -(25*scaling)};
  stroke(160);
  fill(255);
  strokeWeight(1);
  translate(shipX, shipY);
  rotate(shipAngle);
  quad(xVal[0], yVal[0], xVal[1], yVal[1], xVal[2], yVal[2], xVal[3], yVal[3]);
  rotate(-shipAngle);
  translate(-shipX, -shipY);
  }
  }
  
  void move(){
    if(onOrOff == true){
  if(wPressed == true){shipSpeed+=0.25;}
  if(sPressed == true){shipSpeed-=0.25;}
  if(aPressed == true){shipAngle-=0.05;}
  if(dPressed == true){shipAngle+=0.05;}
  shipX = shipX+(float)(cos(shipAngle))*shipSpeed;
  shipY = shipY+(float)(sin(shipAngle))*shipSpeed;
  //ship borders
  if(shipX > horizRes) {shipX = 0;}
  if(shipX < 0) {shipX = horizRes;}
  if(shipY > vertRes) {shipY = 0;}
  if(shipY < 0) {shipY = vertRes;}
    }
  }
  void hyperspace(){
   if(onOrOff == true && ePressed == true){
  shipX = (int)(Math.random()*horizRes);
  shipY = (int)(Math.random()*horizRes);
  shipAngle = (int)(Math.random()*2*PI);
  shipSpeed = 0;
   }
  }
 }

//Opening Menu (instance of openingMenu is firstMenu)

class openingMenu{
protected boolean opening;
protected int menuSelect = 0;
public boolean getopening(){return opening;}
public void setopening(boolean i){opening = i;}
public int getMenuSelect() {return menuSelect;}
public void setMenuSelect(int i){menuSelect = i;}
private boolean crasher = false;
public void setcrasher(boolean i){crasher = i;}
openingMenu(){
  opening = true;
}
public void showMenu(){
  if(opening == true){
    textAlign(CENTER);
    textSize(fontSize);
    fill(255);
    text("ASTEROIDS!", horizRes/2, vertRes/3);
    textSize(3*fontSize/5);
    if(menuSelect == 0){rect(3*horizRes/10, 3*vertRes/8, 2*horizRes/5, vertRes/4); fill(0);} else {fill(255);}
    text("START!", horizRes/2, 11*vertRes/20);
    textSize(2*fontSize/5);
    if(menuSelect == 1){rect(horizRes/3, 5*vertRes/8, horizRes/3, 3*vertRes/16); fill(0);} else {fill(255);}
    text("Settings", horizRes/2, 3*vertRes/4);
    textSize(fontSize/5);
    if(menuSelect == 2){rect(9*horizRes/20, 5*vertRes/6, horizRes/10, vertRes/15); fill(0);} else {fill(255);}
    text("Quit", horizRes/2, 8*vertRes/9);
    fill(255);
    textAlign(LEFT);
    textSize(fontSize/10);
    text("Space/Enter to select, Up/Down Arrows or W/S to change options.", horizRes/100, 99*vertRes/100);
    textSize(2*fontSize/5);
  }
}
public void crasherMoment(){
 if(crasher == true){
  background(0);
  textAlign(CENTER);
  textSize(3*fontSize/4);
  fill(255);
  text("why would you\n do this", horizRes/2, vertRes/4);
  textSize(fontSize/5);
  text("the quit button divides 1/0 btw\n why did i add this? idk but enjoy i guess\n-K. Lao 12/8/24", horizRes/2, 3*vertRes/4);
  if(frameCount%100 == 0){int wompWomp = 1/0;} 
 }
}
}

//Starter Menu

class starterMenu extends openingMenu{
 
 starterMenu(){
   opening = false;
 }
 public void showMenu(){
  if(opening == true){
    textSize(60);
    textAlign(CENTER);
    fill(255);
    text("starting page is still a placeholder :p  \n  PRESS THE SPACEBAR TO START PLAYING \n WASD to move, E to hyperspace \n -K.Lao 12/9/24", horizRes/2, vertRes/2);
  }
}
}

//Settings Menu

class settingsMenu extends openingMenu{
 private boolean isTheSubMenuOpen;
 public void setSubMenu(boolean i){isTheSubMenuOpen = i;}
  settingsMenu(){ 
   opening = false; 
   isTheSubMenuOpen = false;
  }
  public void showMenu(){
   if(opening == true){
     fill(0);
     rect(horizRes/8, vertRes/8, 3*horizRes/4, 3*vertRes/4);
     line(3*horizRes/8, vertRes/8, 3*horizRes/8, 7*vertRes/8);
     line(3*horizRes/8, 5*vertRes/8, 7*horizRes/8, 5*vertRes/8);
     //0: display (resolution, framerate, scaling), 1: Movement(velocity method), 2: Asteroids(both number + framerate), 3: Background, 4: debug
     textSize(fontSize/5);
     textAlign(CENTER);
     fill(255);
     if(menuSelect == 0){
       rect(5*horizRes/32, 3*vertRes/16, 3*horizRes/16, 3*vertRes/32);
       fill(0);
     }
     else{fill(255);}
     text("Display", horizRes/4, vertRes/4);
     
     
     if(menuSelect == 1){
       rect(5*horizRes/32, 5*vertRes/16, 3*horizRes/16, 3*vertRes/32);
       fill(0);
     }
     else{fill(255);}
     text("Movement", horizRes/4, 3*vertRes/8);
     
     if(menuSelect == 2){
       rect(5*horizRes/32, 7*vertRes/16, 3*horizRes/16, 3*vertRes/32);
       fill(0);
     }
     else{fill(255);}
     text("Asteroids", horizRes/4, vertRes/2);
     
     if(menuSelect == 3){
       rect(5*horizRes/32, 9*vertRes/16, 3*horizRes/16,  3*vertRes/32);
       fill(0);
     }
     else{fill(255);}
     text("Background", horizRes/4, 5*vertRes/8);
     
     if(menuSelect == 4){
       rect(5*horizRes/32, 11*vertRes/16, 3*horizRes/16, 3*vertRes/32);
       fill(0);
     }
     else{fill(255);}
     text("Debug", horizRes/4, 3*vertRes/4);
    
    if(isTheSubMenuOpen == false){
      fill(255);
      textSize(fontSize/5);
      textAlign(CENTER);
      text("Press Space or Enter to open!", 5*horizRes/8, 3*vertRes/4); 
      //display
           if(menuSelect == 0){       
      text("Resolution: " + horizRes + " x " + vertRes, 5*horizRes/8, vertRes/4);
      text("Framerate: " + frameRateVar, 5*horizRes/8, 3*vertRes/8);
      text("Scaling: " + scaling, 5*horizRes/8, vertRes/2);
      }
      //movement
      else if(menuSelect == 1){
      text("Linked Velocity?", 5*horizRes/8, 3*vertRes/16);
      text("Linked", horizRes/2, 9*vertRes/32);
      text("Unlinked", 3*horizRes/4, 9*vertRes/32);
      line(5*horizRes/8, 7*vertRes/32, 5*horizRes/8, 5*vertRes/8);
      }
      //asteroids
     /*(still a work in progress, 12/9/24)
     else if(menuSelect == 2){
        
      }
      //background
      else if(menuSelect == 3){
        
      }
      //debug
      else if(menuSelect == 4){
        
      }
      */
    }
    
    fill(255);
    textSize(fontSize/10);
    textAlign(LEFT);
    text("Space/Enter to select, Up/Down Arrows or W/S to change options, TAB to go back.", horizRes/100, 99*vertRes/100);
    textSize(2*fontSize/5);
   }
  }
}
// (still a work in progress, 12/9/24)
class settingsSubMenu extends openingMenu{
  settingsSubMenu(){ 
  opening = false;
  menuSelect = 0;
  }
  public void showMenu() {
    if(opening == true){
      //display
      if(menuSelect == 0){
      
      }
      //movement
      else if(menuSelect == 1){
        
      }
      //asteroids
      else if(menuSelect == 2){
        
      }
      //background
      else if(menuSelect == 3){
        
      }
      //debug
      else if(menuSelect == 4){
        
      }
      
    }
    }
}


//individual star

class indivStar{
protected int starX, starY, starRadius, starColor;
  indivStar(){
    starX = (int)(Math.random()*horizRes);
    starY = (int)(Math.random()*vertRes);
    starRadius = (int)(Math.random()*(horizRes/100));
    starColor = 180;
  }

public void show(){
    fill(starColor);
    stroke(starColor);
    strokeWeight(1);
    ellipse(starX, starY, starRadius, starRadius);
}
}

//array of 0-100 stars

class backgroundStars extends indivStar{
 private int numOfStars;
 indivStar[] starBackground;
 backgroundStars(){
 numOfStars = (int)(Math.random()*91)+10;
 starBackground = new indivStar[numOfStars];
 for(int i = 0; i < starBackground.length; i++){starBackground[i] = new indivStar();}
 }
  
 public int getNumStars(){return numOfStars;}
public void displayBackground(){
  background(0);
     if(frameCount%6==0){
    for(int i = 0; i < starBackground.length; i++){
      starBackground[i].starX = (int)(Math.random()*horizRes);
      starBackground[i].starY = (int)(Math.random()*vertRes);
    }
  }
   for(int i = 0; i < starBackground.length; i++){
  //  starBackground[i] = new indivStar();
    starBackground[i].show();
   }
 }
}
