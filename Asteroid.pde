 class indivAsteroid extends fineHeresYourFloater{ 
   private int numSides;
   private float asteroidRotation, sumOfRotation;
   indivAsteroid(){
     super();
     shipSpeed = (float)(Math.random()*5)+1;
     onOrOff = false;
     numSides = (int)(Math.random()*6)+3;
     asteroidRotation = (float)(Math.random()*PI/4)-(PI/8);
     sumOfRotation = 0;
     
   }
   
   public void show(){
     if(onOrOff == true){
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
   private ArrayList<indivAsteroid> allOfTheAsteroids;
   allAsteroids(){
    numOfAsteroids = (int)(Math.random()*21)+5; 
    allOfTheAsteroids = new ArrayList<indivAsteroid>();
    for(int i = 0; i <= numOfAsteroids; i++){
    allOfTheAsteroids.add(new indivAsteroid());}
   }
   
   public void asteroidStarter(boolean i){
     if(i == true){
       for(int a = 0; a < allOfTheAsteroids.size(); a++){allOfTheAsteroids.get(a).setonOrOff(true);}
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
   }
   }
 }
 }
