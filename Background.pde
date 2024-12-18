//individual star

class indivStar{
protected int starX, starY, starRadius, starColor;
public void setstarColor(int i, int j, int k){starColor = color(i, j, k);}
  indivStar(){
    starX = (int)(Math.random()*horizRes);
    starY = (int)(Math.random()*vertRes);
    starRadius = (int)(Math.random()*(horizRes/100));
    starColor = color(180, 180, 180);
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
 private int frameInterval;
 public void setframeInterval(int i){frameInterval = i;}
 public int getframeInterval(){return frameInterval;}
 private boolean staticBackgroundOn;
 public void setstaticBackgroundOn(boolean i){staticBackgroundOn = i;}
 private boolean randomColorOn;
 public void setrandomColorOn(boolean i){randomColorOn = i;}
 indivStar[] starBackground;
 backgroundStars(){
 numOfStars = (int)(Math.random()*91)+10;
 frameInterval = 60;
 staticBackgroundOn = false;
 randomColorOn = false;
 starBackground = new indivStar[numOfStars];
 for(int i = 0; i < starBackground.length; i++){starBackground[i] = new indivStar();}
 }
 
 public int getNumStars(){return numOfStars;}
public void displayBackground(){
  background(0);
  if(staticBackgroundOn == false){
     if(frameCount%frameInterval==0){
    for(int i = 0; i < starBackground.length; i++){
      if(randomColorOn == false){starBackground[i].setstarColor(180, 180, 180);}
      else{starBackground[i].setstarColor((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));}
      starBackground[i].starX = (int)(Math.random()*horizRes);
      starBackground[i].starY = (int)(Math.random()*vertRes);
    }
  }
   for(int i = 0; i < starBackground.length; i++){
    starBackground[i].show();
   }
 }
}
}
