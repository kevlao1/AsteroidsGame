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
    stroke(255);
    strokeWeight(2);
    fill(0);
    rect(horizRes/8, vertRes/8, 3*horizRes/4, 3*vertRes/4);
    textSize(fontSize/6);
    textAlign(CENTER);
    fill(255);
    text("Welcome to Asteroids!\nThe keybinds are as follows:\nWASD to move\nE to hyperspace (teleport)\nSpace to fire bullets\nR to reload\nALT to spawn asteroids\nTAB/Backspace to return to the Main Menu\n\nCheck the settings for changes in gameplay!\n Have fun! -K. Lao (12/17/24)", horizRes/2, vertRes/5);
  }
}
}

//Settings Menu

class settingsMenu extends openingMenu{
 private boolean isTheSubMenuOpen;
 private int option;
 private int asteroidNum;
 public void setasteroidNum(int i){asteroidNum = i;}
 public void setSubMenu(boolean i){isTheSubMenuOpen = i;}
 public float hitboxRatio;
 public float gethitboxRatio(){return hitboxRatio;}
 public void sethitboxRatio(float i){hitboxRatio = i;}
 private boolean staticBackgroundOn;
 public void setstaticBackgroundOn(boolean i){staticBackgroundOn = i;}
 private boolean randomColorOn;
 public void setrandomColorOn(boolean i){randomColorOn = i;}
 private int frameInterval;
 public void setframeInterval(int i){frameInterval = i;}
 public int getframeInterval(){return frameInterval;}
 private boolean debugToggle;
 public void setdebugToggle(boolean i){debugToggle = i;}
  settingsMenu(){ 
   opening = false; 
   isTheSubMenuOpen = false;
   hitboxRatio = 1;
   staticBackgroundOn = false;
   randomColorOn = false;
   frameInterval = 60;
   debugToggle = false;
  }
  public int getoption(){return option;}
  public void setoption(int i){
if(i >= 0 && i <= 2) {option = i;}
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
      if(option == 0){
      fill(255);
      rect(13*horizRes/32, 23*vertRes/64, 3*horizRes/16, 3*vertRes/32);
      fill(0);
      text("Linked", horizRes/2, 27*vertRes/64);
      fill(255);
      }
      else{fill(255);text("Linked", horizRes/2, 27*vertRes/64);}
      if(option == 1){
      rect(21*horizRes/32, 23*vertRes/64, 3*horizRes/16, 3*vertRes/32);
      fill(0);
      text("Unlinked", 3*horizRes/4, 27*vertRes/64);
      fill(255);
      }
      else{fill(255); text("Unlinked", 3*horizRes/4, 27*vertRes/64);}
      line(5*horizRes/8, 7*vertRes/32, 5*horizRes/8, 5*vertRes/8);
      }
      //asteroids
     
      else if(menuSelect == 2){
      text("Number of Asteroids: " + asteroidNum, 5*horizRes/8, vertRes/4);
      text("Asteroid Outline Thickness: " + asteroidThickness, 5*horizRes/8, 3*vertRes/8);
      text("Hitbox Multiplier: " + hitboxRatio, 5*horizRes/8, vertRes/2);
      }
      //background
      else if(menuSelect == 3){
        text("Empty Background: " + staticBackgroundOn, 5*horizRes/8, vertRes/4);
        text("Random Star Color: " + randomColorOn, 5*horizRes/8, 3*vertRes/8);
        text("Refresh Rate: " + frameInterval, 5*horizRes/8, vertRes/2);
      }
      //debug
      else if(menuSelect == 4){
        text("Debug: " + debugToggle, 5*horizRes/8, 3*vertRes/8);
      }
    }
    
    fill(255);
    textSize(fontSize/10);
    textAlign(LEFT);
    text("Space/Enter to select, Up/Down or W/S to change settings menus, Left/Right or A/D to change options, TAB/Backspace/B to go back.", horizRes/100, 99*vertRes/100);
    textSize(2*fontSize/5);
   }
  }
}

class settingsSubMenu extends openingMenu{
  private int option, asteroidFont, asteroidNum;
  public void setasteroidFont(int a){if(a>=0)asteroidFont = a;}
  public void setasteroidNum(int i){asteroidNum = i;}
  public int getasteroidFont(){return asteroidFont;}
  private boolean staticBackgroundOn;
 public void setstaticBackgroundOn(boolean i){staticBackgroundOn = i;}
  private boolean randomColorOn;
 public void setrandomColorOn(boolean i){randomColorOn = i;}
 private int frameInterval;
 public void setframeInterval(int i){frameInterval = i;}
 public int getframeInterval(){return frameInterval;}
  private boolean debugToggle;
 public void setdebugToggle(boolean i){debugToggle = i;}
  settingsSubMenu(){ 
  opening = false;
  menuSelect = 0;
  option = 0;
  staticBackgroundOn = false;
  randomColorOn = false;
  frameInterval = 60;
  debugToggle = false;
  }
  public int getoption(){return option;}
  public void setoption(int i){
if(i >= 0 && i <= 2) {option = i;}
}
  public void showMenu() {
    if(opening == true){
     textSize(fontSize/5);
     textAlign(CENTER);
      //display
      if(menuSelect == 0){
       if(option == 0){
       rect(7*horizRes/16, 3*vertRes/16, 3*horizRes/8, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Resolution: Changes the resolution the game\nis displayed at. Goes to 4K, supports only but\nall 16:9 resolutions.", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       textAlign(CENTER);
       fill(0);
     }
     else{fill(255);}
      text("Resolution: " + horizRes + " x " + vertRes, 5*horizRes/8, vertRes/4);
      
      if(option == 1){
       rect(horizRes/2, 5*vertRes/16, horizRes/4, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Framerate: Uses the left/right keys to\nchange the FPS down/up, respectively. Note\nthat this also changes the rate of acceleration,\nwhich is tied to the frame.", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
     }
     else{fill(255);}
      text("Framerate: " + frameRateVar, 5*horizRes/8, 3*vertRes/8);
      
      if(option == 2){
       rect(17*horizRes/32, 7*vertRes/16, 3*horizRes/16, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Scaling: Makes the asteroids' and spaceship's\nsizes change by x" + scaling + ". The default spaceship is\n60x50 pixels (L x W), scale accordingly.\n(Note: This does NOT scale UI.)", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
     }
     else{fill(255);}
      text("Scaling: " + scaling, 5*horizRes/8, vertRes/2);
      fill(0);
      }
      
      //movement
      else if(menuSelect == 1){ 
      text("Linked Velocity?", 5*horizRes/8, 3*vertRes/16);
      textAlign(LEFT);
      textSize(fontSize/7);
      text("Linked vs. Unlinked (Basic explanation):\nLinked velocity eliminates drift by making \nvelocity one vector. Unlinked velocity separates\nvelocity components, allowing drift.", 2*horizRes/5, 27*vertRes/40);
      line(5*horizRes/8, 7*vertRes/32, 5*horizRes/8, 5*vertRes/8);
      textSize(fontSize/5);
      textAlign(CENTER);
     
      if(option == 0){
      fill(255);
      rect(13*horizRes/32, 23*vertRes/64, 3*horizRes/16, 3*vertRes/32);
      fill(0);
      text("Linked", horizRes/2, 27*vertRes/64);
      fill(255);
      }
      else{fill(255);text("Linked", horizRes/2, 27*vertRes/64);}
      
      if(option == 1){
      rect(21*horizRes/32, 23*vertRes/64, 3*horizRes/16, 3*vertRes/32);
      fill(0);
      text("Unlinked", 3*horizRes/4, 27*vertRes/64);
      fill(255);
      }
      else{fill(255); text("Unlinked", 3*horizRes/4, 27*vertRes/64);}
      }
      //asteroids
      else if(menuSelect == 2){
          if(option == 0){
       rect(7*horizRes/16, 3*vertRes/16, 3*horizRes/8, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Number of Asteroids: Changes the number\nof asteroids present in the game at once.\n(Note: When increasing, the number may drop\ndue to invisible collisions.)", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       textAlign(CENTER);
       fill(0);
     }
     else{fill(255);}
      text("Number of Asteroids: " + asteroidNum, 5*horizRes/8, vertRes/4);
      
      if(option == 1){
       rect(13*horizRes/32, 5*vertRes/16, 7*horizRes/16, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Asteroid Outline Thickness: Changes the\nthickness of the asteroid. Helps visibility if\nincreased.", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
     }
     else{fill(255);}
      text("Asteroid Outline Thickness: " + asteroidThickness, 5*horizRes/8, 3*vertRes/8);
      
      if(option == 2){
       rect(15*horizRes/32, 7*vertRes/16, 5*horizRes/16, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Hitbox Multiplier: Multiplies the default radius\nof collision (" + (50*scaling) + " pixels) by the multiplier.\n\nWhy would you change this?", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
     }
     else{fill(255);}
      text("Hitbox Multiplier: " + scaling, 5*horizRes/8, vertRes/2);
      fill(0);
      }
      //background
      else if(menuSelect == 3){
      if(option == 0){
       rect(7*horizRes/16, 3*vertRes/16, 3*horizRes/8, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Empty Background: Toggles background\nstars on or off entirely." , 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       textAlign(CENTER);
       fill(0);
     }
     else{fill(255);}
      text("Empty Background: " + staticBackgroundOn, 5*horizRes/8, vertRes/4);
      
      if(option == 1){
       rect(13*horizRes/32, 5*vertRes/16, 7*horizRes/16, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Random Star Color: Each star's color in the\nbackground is randomized.\n\n(Also the settings does something cool :D)", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
     }
     else{fill(255);}
      text("Random Star Color: " + randomColorOn, 5*horizRes/8, 3*vertRes/8);
      
      if(option == 2){
       rect(15*horizRes/32, 7*vertRes/16, 5*horizRes/16, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Refresh Rate: Refreshes the star backdrop\nonce per " + frameInterval + " frame(s).\n\n(NOTE: possible epilepsy warning under ~10)", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
     }
     else{fill(255);}
      text("Refresh Rate: " + frameInterval, 5*horizRes/8, vertRes/2);
      fill(0);
      } 
      //debug
      else if(menuSelect == 4){
        rect(horizRes/2, 5*vertRes/16, horizRes/4, 3*vertRes/32);
       textSize(fontSize/7);
       textAlign(LEFT);
       text("Debug: Lists all relevant gameplay variables in\nthe top left corner of the screen.", 2*horizRes/5, 27*vertRes/40);
       textSize(fontSize/5);
       fill(0);
       textAlign(CENTER);
       text("Debug: " + debugToggle, 5*horizRes/8, 3*vertRes/8);
      }
      
    }
    }
}

class inGameMenu extends openingMenu{
  inGameMenu(){
    opening = false;
}
public void showMenu(){  
 if(opening == true){
 fill(0);
 stroke(255);
 strokeWeight(2);
 rect(horizRes/4, 7*vertRes/8, horizRes/2, vertRes/8);
 textAlign(LEFT);
 fill(255);
 textSize(fontSize/14);
 text("WASD: movement         R: Reload\nE: Hyperspace              TAB/Backspace/B: Main Menu\nALT: Spawn Asteroid\nSpace: Shoot Bullet", 17*horizRes/64, 29*vertRes/32);
 }
}
}

class debugMenu{
 private boolean debugToggle;
 public void setdebugToggle(boolean i){debugToggle = i;}
  debugMenu(){
 debugToggle = false;
  }
 
 public void debugIndication(int a, int b, int c, float d, float e, int f, float g, float h, float i, float j, int k, float l, int m, int n, int o, int p){ 
 if(debugToggle == true){
  textAlign(LEFT);
  fill(255);
  textSize(fontSize/16);
  text("Menu Option: " + a, horizRes/64, vertRes/32);
  text("Settings Menu Option: " + b, horizRes/64, 2*vertRes/32);
  text("Settings Submenu Option: " + c, horizRes/64, 3*vertRes/32);
  text("Spaceship X-Pos: " + d, horizRes/64, 4*vertRes/32);
  text("Spaceship Y-Pos: " + e, horizRes/64, 5*vertRes/32);
  text("Velocity Method: " + f, horizRes/64, 6*vertRes/32);
  text("Spaceship Speed (Linked): " + g, horizRes/64, 7*vertRes/32);
  text("Spaceship X-Velocity (Unlinked): " + h, horizRes/64, 8*vertRes/32);
  text("Spaceship Y-Velocity (Unlinked): " + i, horizRes/64, 9*vertRes/32);
  text("Spaceship Angle: " + j, horizRes/64, 10*vertRes/32);
  text("Number of Asteroids: " + k, horizRes/64, 11*vertRes/32);
  text("Scaling: " + l, horizRes/64, 12*vertRes/32);
  text("Horizontal Resolution: " + m, horizRes/64, 13*vertRes/32);
  text("Vertical Resolution: " + n, horizRes/64, 14*vertRes/32);
  text("Font Size: " + o, horizRes/64, 15*vertRes/32);
  text("Framerate: " + p, horizRes/64, 16*vertRes/32);
 }
 }
}
