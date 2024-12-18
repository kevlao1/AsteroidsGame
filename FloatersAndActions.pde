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
 private float velocityX, velocityY;
 private int velocityMethod;
 public void setvelocityMethod(int i){velocityMethod = i;}
 public int getvelocityMethod(){return velocityMethod;}
 public float getshipSpeed(){return shipSpeed;}
 public float getshipX(){return shipX;}
 public float getshipY(){return shipY;}
 public float getshipAngle(){return shipAngle;}
 public float getvelocityX(){return velocityX;}
 public float getvelocityY(){return velocityY;}
 
  spaceship(){
  shipX = horizRes/2;
  shipY = vertRes/2;
  shipAngle = 3*PI/2;
  shipSpeed = 0;
  onOrOff = false;
  velocityX = 0;
  velocityY = 0;
  velocityMethod = 0;
  }
 void show(){
  if(onOrOff == true){
  float[] xVal = {30*scaling, -(30*scaling), -(7.5*scaling), -(30*scaling)};
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
 public void move(){
    if(onOrOff == true){
  if(wPressed == true){
  shipSpeed+=0.25;
  velocityX = velocityX+(cos(shipAngle)*0.25);
  velocityY = velocityY+(sin(shipAngle)*0.25);
}
  if(sPressed == true){
 shipSpeed-=0.25;
 velocityX = velocityX-(cos(shipAngle)*0.25);
 velocityY = velocityY-(sin(shipAngle)*0.25);
 }
  if(aPressed == true){shipAngle-=0.05;}
  if(dPressed == true){shipAngle+=0.05;}
  if(velocityMethod == 0){
  shipX = shipX+(float)(cos(shipAngle))*shipSpeed;
  shipY = shipY+(float)(sin(shipAngle))*shipSpeed;
  }
  else if(velocityMethod == 1){
  shipX = shipX + velocityX;
  shipY = shipY + velocityY;
  }
  //ship borders
  if(shipX > horizRes) {shipX = 0;}
  if(shipX < 0) {shipX = horizRes;}
  if(shipY > vertRes) {shipY = 0;}
  if(shipY < 0) {shipY = vertRes;}
    }
  }
  
 public void hyperspace(){
   if(onOrOff == true && ePressed == true){
  shipX = (int)(Math.random()*horizRes);
  shipY = (int)(Math.random()*horizRes);
  shipAngle = (int)(Math.random()*2*PI);
  shipSpeed = 0;
  velocityX = 0;
  velocityY = 0;
   }
  }
 }
 
 class indivAsteroid extends fineHeresYourFloater{ 
   private int numSides;
   private float asteroidRotation, sumOfRotation;
   indivAsteroid(){
     shipSpeed = (float)(Math.random()*5)+1;
     onOrOff = false;
     numSides = (int)(Math.random()*6)+3;
     asteroidRotation = (float)(Math.random()*PI/4)-(PI/8);
     sumOfRotation = 0;
   }
   public void show(){
     if(onOrOff == true){
     strokeWeight(asteroidThickness);
     noFill();
     stroke(255);
     float typLen = 37.5*scaling;
     sumOfRotation = sumOfRotation + asteroidRotation;
     translate(shipX, shipY);
     rotate(sumOfRotation);
     if(numSides == 3){triangle(0, typLen, -typLen, -typLen, typLen, -typLen);}
     else if(numSides == 4){quad(-typLen, typLen, -typLen, -typLen, typLen, -typLen, typLen, typLen);}
     else if(numSides == 5){beginShape(); vertex(0, typLen); vertex(typLen, 0); vertex(typLen/2, -typLen); vertex(-typLen/2, -typLen); vertex(-typLen, 0); vertex(0, typLen); endShape();}
     else if(numSides == 6){beginShape(); vertex(typLen/2, typLen); vertex(typLen, 0); vertex(typLen/2, -typLen); vertex(-typLen/2, -typLen); vertex(-typLen, 0); vertex(-typLen/2, typLen); vertex(typLen/2, typLen); endShape();}
     else if(numSides == 7){beginShape(); vertex(typLen/2, 3*typLen/4); vertex(typLen, 0); vertex(typLen/2, -typLen); vertex(-typLen/2, -typLen); vertex(-typLen, 0); vertex(-typLen/2, 3*typLen/4); vertex(0, typLen); vertex(typLen/2, 3*typLen/4); endShape();}
     else if(numSides == 8){beginShape(); vertex(2*typLen/5, typLen); vertex(typLen, 2*typLen/5); vertex(typLen, -2*typLen/5); vertex(2*typLen/5, -typLen); vertex(-2*typLen/5, -typLen); vertex(-typLen, -2*typLen/5); vertex(-typLen, 2*typLen/5); vertex(-2*typLen/5, typLen); vertex(2*typLen/5, typLen); endShape();}
     strokeWeight(1);
     rotate(-1*sumOfRotation);
     translate(-shipX, -shipY);
     }
   }
   public void move(){
     if(onOrOff == true){
  shipX = shipX + (shipSpeed*cos(shipAngle));
  shipY = shipY + (shipSpeed*sin(shipAngle));
  //ship borders
  if(shipX > horizRes) {shipX = 0;}
  if(shipX < 0) {shipX = horizRes;}
  if(shipY > vertRes) {shipY = 0;}
  if(shipY < 0) {shipY = vertRes;}
     }
   }
 }

 class allAsteroids{
   private int numOfAsteroids;
   public int getnumOfAsteroids(){return numOfAsteroids+1;}
   private float hitboxRatio;
   public float gethitboxRatio(){return hitboxRatio;}
   public void sethitboxRatio(float i){hitboxRatio = i;}
   private boolean asteroidStarterOn;
   protected ArrayList<indivAsteroid> allOfTheAsteroids;
   allAsteroids(){
    numOfAsteroids = (int)(Math.random()*21)+5;
    hitboxRatio = 1.0;
    asteroidStarterOn = false;
    allOfTheAsteroids = new ArrayList<indivAsteroid>();
    for(int i = 0; i <= numOfAsteroids; i++){
    allOfTheAsteroids.add(new indivAsteroid());}
   }
   public void asteroidStarter(boolean i){
     asteroidStarterOn = i;
     if(i == true){
       for(int a = 0; a < allOfTheAsteroids.size(); a++){allOfTheAsteroids.get(a).setonOrOff(true);}
     }
     if(i == false){
       for(int a = 0; a < allOfTheAsteroids.size(); a++){allOfTheAsteroids.get(a).setonOrOff(false);}
      }     
   }
   
   public void asteroidAdd(){
    allOfTheAsteroids.add(new indivAsteroid());
    if(asteroidStarterOn == true){
    allOfTheAsteroids.get(allOfTheAsteroids.size()-1).setonOrOff(true);
    allOfTheAsteroids.get(allOfTheAsteroids.size()-1).show();
    allOfTheAsteroids.get(allOfTheAsteroids.size()-1).move();
    }
    numOfAsteroids++;
   }
   
   public void asteroidSubtract(){
    if(numOfAsteroids > 0) {allOfTheAsteroids.remove(allOfTheAsteroids.get(allOfTheAsteroids.size()-1)); 
    numOfAsteroids--;
    }
   }
   
   public void asteroidActions(){
    for(int i = 0; i < allOfTheAsteroids.size(); i++){
     allOfTheAsteroids.get(i).show();
     allOfTheAsteroids.get(i).move();
   }
   }
   public void kaboom(float x, float y){
     for(int i = 0; i < allOfTheAsteroids.size(); i++){
     if(dist(x, y, allOfTheAsteroids.get(i).shipX, allOfTheAsteroids.get(i).shipY) < 50*scaling){
       allOfTheAsteroids.remove(i);
       numOfAsteroids--;
       i--;
     }
     if(allOfTheAsteroids.size() >= 2){
       for(int a = 0; a < allOfTheAsteroids.size(); a++){
         if(a < 0){a = 0;} 
         if(i < 0){i = 0;} 
         if(a >= allOfTheAsteroids.size()){break;}
         if(i >= allOfTheAsteroids.size()){break;}
     if(a == i){}
     else if(dist(allOfTheAsteroids.get(i).shipX, allOfTheAsteroids.get(i).shipY, allOfTheAsteroids.get(a).shipX, allOfTheAsteroids.get(a).shipY) < 50*scaling){
       allOfTheAsteroids.remove(i);
       if(a > 0){allOfTheAsteroids.remove(a-1);}
     numOfAsteroids-=2;
     }
     }
   }
   }
 }
 }
 
 class indivBullet extends fineHeresYourFloater{
   float displacement = 0;
   public float getdisplacement(){return displacement;}
   indivBullet(float angle, float x, float y, float speed, boolean onOff){
    shipX = x;
    shipY = y;
    shipAngle = angle;
    shipSpeed = speed+(10*scaling);
    onOrOff = onOff;
   }
   
   public void show(){
     if(onOrOff == true){
     strokeWeight(3);
     stroke(255);
     noFill();
     ellipse(shipX, shipY, 10*scaling, 10*scaling);
     }
   }
   
   public void move(){
     if(onOrOff == true){
    shipX = shipX + shipSpeed*scaling*cos(shipAngle);
    shipY = shipY + shipSpeed*scaling*sin(shipAngle);
    displacement = displacement + sqrt((shipSpeed*scaling*sin(shipAngle)*shipSpeed*scaling*sin(shipAngle))+(shipSpeed*scaling*cos(shipAngle)*shipSpeed*scaling*cos(shipAngle)));
    //ship borders
  if(shipX > horizRes) {shipX = 0;}
  if(shipX < 0) {shipX = horizRes;}
  if(shipY > vertRes) {shipY = 0;}
  if(shipY < 0) {shipY = vertRes;}
     }
   }
 }
 
 class allBullets{
   private int numOfBullets;
   private boolean bulletStarterOn;
   public int getnumOfBullets(){return numOfBullets;}
   protected ArrayList<indivBullet> allOfTheBullets;
   allBullets(){
    numOfBullets = 25; 
    bulletStarterOn = false;
    allOfTheBullets = new ArrayList<indivBullet>();
   }
   public void bulletStarter(boolean i){
     bulletStarterOn = i;
     if(i == true){
       for(int a = 0; a < allOfTheBullets.size(); a++){allOfTheBullets.get(a).setonOrOff(true);}
      } 
     if(i == false){
       for(int a = 0; a < allOfTheBullets.size(); a++){allOfTheBullets.get(a).setonOrOff(false);}
     }
   }
   
   public void bulletAdd(float angle, float x, float y, float speed){
    if(numOfBullets > 0 && millis()%4 == 0){
    allOfTheBullets.add(new indivBullet(angle, x, y, speed, true)); 
    numOfBullets--;   
    }
   }
   
   public void bulletReload(){if(rPressed == true) numOfBullets = 25;}
   
   public void bulletActions(){
     if(bulletStarterOn == true){
    for(int i = 0; i < allOfTheBullets.size(); i++){
     allOfTheBullets.get(i).show();
     allOfTheBullets.get(i).move();
     if(allOfTheBullets.get(i).getdisplacement() >= 750*scaling){allOfTheBullets.remove(allOfTheBullets.get(i));}
    }
   }
   }

public void bulletCounter(){
  if(bulletStarterOn == true){
  fill(255);
  textAlign(LEFT);
  textSize(fontSize/10);
  text("Ammo: " + numOfBullets + "/25", 17*horizRes/32, 63*vertRes/64);
  fill(0);
  strokeWeight(2);
  stroke(255);
  rect(17*horizRes/32, 57*vertRes/64, 25*(3*horizRes/400), vertRes/16);
  fill(255);
  for(int i = 1; i <= numOfBullets;i++){rect((17*horizRes/32)+(i-1)*(3*horizRes/400), 57*vertRes/64, 3*horizRes/400, vertRes/16);} 
  fill(0);
  noStroke();
  if(numOfBullets == 0){
  fill(255);
  rect(17*horizRes/32, 57*vertRes/64, 25*(3*horizRes/400), vertRes/16); 
  textAlign(CENTER);
  fill(0);
  textSize(fontSize/4);
  text("RELOAD!", 5*horizRes/8, 121*vertRes/128);
  }
}
 }
}
