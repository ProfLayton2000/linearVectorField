class Dot{
  PVector pos;
  float col;
  ArrayList<PVector> vertices;
 
  Dot(float x, float y, float c){
    pos = new PVector(x,y);
    col = c;
    vertices = new ArrayList<PVector>();
    vertices.add(new PVector(x,y));
  }
  
  void show(float r,int mode){
    colorMode(HSB);
    strokeWeight(r);
    stroke(col,255,255);
    fill(col,255,255);
    ellipse(pos.x,-pos.y,2*r,2*r);
    
    if (mode == 1){
      noFill();
      beginShape();
      for (PVector v: vertices){
        vertex(v.x,-v.y);
      }
      endShape();
    }
  }
  
  void update(int[][] matrix, float dt){
    //float dx = (11*pos.x-3*pos.y)*dt;
    //float dy = (8*pos.x + pos.y)*dt;
    
    float dx = (matrix[0][0]*pos.x + matrix[0][1]*pos.y)*dt;
    float dy = (matrix[1][0]*pos.x + matrix[1][1]*pos.y)*dt;
    //println(dx,dy);
    vertices.add(new PVector(pos.x,pos.y));
    
    pos.x += dx;
    pos.y += dy;
  }
}