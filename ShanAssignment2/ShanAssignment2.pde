float r = 255, g, b; // global var
color linecolor = color(200);

void setup() {
  size(800, 450);
  background(255);
  //frameRate(60);  default value: refresh 60 times a second
}

void draw() { 
  //colorful trace
  println(frameCount);
  if (frameCount%5 == 0) {  // remainder judgement
    for (int i = 0; i < 40; i++) {  // local var i
      g = map(mouseX, 0, width, 0, 255); // color mapping
      b = map(mouseY, 0, height, 0, 255); 
      fill(r, g, b);
      noStroke();
      ellipse(mouseX+random(-10,10), mouseY+random(-10,10),random(15),random(15));
    } // random location and size can make trace more random
  } 
  
  // pattern
  stroke(200);
  for( int y = 10; y <= 450; y+=10){     // left side
    for(int x = 10; x <= 60; x += 10){
      if ((x % 20) == 0){
        line(x, y, x+6, y-6);
      } else{
        line(x, y, x+6, y+6);
      }
    }
  }  
  for( int y = 10; y <= 450; y+=10){     // right side
    for(int x = 740; x <= 790; x += 10){
      if ((x % 20) == 0){
        line(x, y, x+6, y-6);
      } else{
        line(x, y, x+6, y+6);
      }
    }
  }  
 
  // central tangram pattern 
  noStroke();
  fill(180,0,0); // red tri
  triangle(300,125,300,325,width/2,height/2);
  fill(0,0,120); // blue tri
  triangle(300,125,500,125,width/2,height/2);
  fill(0,200,100); // green tri
  triangle(450,175,500,125,500,225);
  fill(255,255,120); // parallelogram
  quad(300,325,350,275,450,275,width/2,325);
  fill(100,200,200,90); // square
  quad(width/2,height/2,450,175,500,225,450,275); 
  fill(200); // quarter circle
  arc(500,325,100*sqrt(2),100*sqrt(2),PI,PI+HALF_PI); 
  fill(50,90); //right bottom
  rectMode(CORNERS);
  rect(500,275,490,325,5); 
  fill(255,10); // for not being covered
  rect(300,125,500,325);
  
  // key press interaction
  if (keyPressed) {
    if(key == 32) { // press space, foggy sides and changing lines
      fill(255,30);
      rect(0,0,175,height);
      rect(625,0,800,height);  
    }      
    else if(key == 'b' || key == 'B'){ // black background and patterns
      background(0);
    }  // else if ends
  }  // if ends 
}  // draw ends 

// restart
void mousePressed() {  
  background(255);
}  