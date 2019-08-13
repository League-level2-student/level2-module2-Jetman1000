// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//I left off on the 2nd part of the snake proect
//*

import javax.swing.JOptionPane;
class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;


// Add a constructor with parameters to initialize each variable.


Segment(int x, int y){
  this.x= x;
  this.y= y;
}

}


// All the game variables that will be shared by the game methods are here
//****GAME VARIABLES****

int foodX;
int foodY;
Segment head;
   int foodEaten;
int direction=UP;
int amountEaten = 0;
//Segment is snake tail
ArrayList<Segment> tail= new ArrayList<Segment>();



//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {


size(500,500);
frameRate(20);
head=new Segment(250,250); 
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);

}


//*

void draw(){

  background(0,0,2);
  drawFood();
  move();
  drawSnake();
  eat();
  
}

// draw the food
void drawFood() {
 fill(255,0,0);
 rect(foodX,foodY,10,10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0,225,44);
  rect(head.x,head.y,10,10);
  //drawTail();
}
void manageTail(){
 checkTailCollision();
 drawTail();
   
   tail.add(new Segment(head.x,head.y));
   tail.remove(0); 
}
//left off here, on part 3 
void drawTail(){
  for(int i = 0; i <tail.size(); i++){
    Segment s = tail.get(i);
        rect(s.x, s.y, 10,10);
  }
}

 void checkTailCollision() {

  //Set the direction of the snake according to the arrow keys pressed

  if(keyCode==UP){
    direction=UP;
  }
  if(keyCode==DOWN){
    direction=DOWN;
  }
  if(keyCode==LEFT){
    direction=LEFT;
  }
  if(keyCode==RIGHT){
    direction=RIGHT; 
  }
  //I left off here on part 3, tail collision  *****************
  for(int i=0; i<tail.size();i++){
    if(head.x==tail.get(i).x&&head.y==tail.get(i).y){
    foodEaten=0;
    tail.add(new Segment(head.x,head.y));
    JOptionPane.showMessageDialog(null, "You lose!");
    System.exit(0);
    }
  }
  
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.

    

  switch(direction) {
  case UP:
    // move head up here 
    head.y-=10; 
    break;
  case DOWN:
    // move head down here 
    head.y+=10;
    break;
  case LEFT:
   // figure it out 
   head.x-=10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.x+=10;
    break;
  }
  
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
  
 if(head.y<=-1||head.y==height){
   JOptionPane.showMessageDialog(null, "You Lose!");
   System.exit(0);
 }
 if(head.x<=-1||head.x==width){
   JOptionPane.showMessageDialog(null, "You Lose!");
   System.exit(0);
 }

}
 void eat(){
   if(head.x==foodX&&head.y==foodY){
     dropFood();
    foodEaten++;
    println (foodEaten);
   }
  
 }


void keyPressed(){
 if (keyCode==UP){
direction=UP;
 }
 if (keyCode==DOWN){
direction=DOWN;
 }
 if (keyCode==LEFT){
direction=LEFT;
 }
 if (keyCode==RIGHT){
direction=RIGHT;
 }
}
