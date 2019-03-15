int rDots = 20;
int cDots = 20;
int mode = 1;
float dt = 0.01;
int[][] matrix = {{1,-10},
                  {10,1}};
Dot[] dots = new Dot[rDots*cDots];

void setup(){
  size(800,800);
  float spaceX = width/(cDots);
  float spaceY = width/(rDots);
  //float spaceX = 30;
  //float spaceY = 30;
  
  background(0);
  translate(width/2,height/2);
  int i,j;
  float oX = -1 * (cDots-1.0)/2.0 * spaceX;
  float oY = -1 * (rDots-1.0)/2.0 * spaceY;
  for (i=0;i<rDots;i++){
    for (j=0;j<cDots;j++){
      float x = oX + spaceX*j;
      float y = oY + spaceY*i;
      float col = atan(y/x);
      col = map(col,-PI/2,PI/2,0,255);
      dots[i+j*cDots] = new Dot(x,y,col);
    }
  }
}

void draw(){
  background(0);
  translate(width/2,height/2);
  
  for (Dot d : dots){
    d.show(2,mode);
    d.update(matrix,dt);
  }
  
  stroke(100);
  strokeWeight(2);
  line(0,height/2,0,-height/2);
  line(width/2,0,-width/2,0);
}