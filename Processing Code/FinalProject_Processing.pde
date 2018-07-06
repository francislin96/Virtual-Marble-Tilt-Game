/* --------------- LIBRARIES AND VARIABLES  --------------- */

import processing.serial.*;
import controlP5.*;
import java.util.Arrays;
Serial myPort;
ControlP5 cp5;

// game variables
boolean in_game = false;
int newScore = 0;
int game_time = 0;

// ball variables
float locX = 75;
float locY = 75;
float dirX = 0;
float dirY = 0;
int num_horWalls = 45;
int num_verWalls = 38;
horWall[] horWalls = new horWall[num_horWalls];
verWall[] verWalls = new verWall[num_verWalls];

// accelerometer variables
float angleX = 0;
float angleY = 0;
float x_accel = 0;
float y_accel = 0;
float z_accel = 1;

/* --------------- SETUP --------------- */

void setup() {

  // communicate with arduino
   myPort = new Serial(this, Serial.list()[0], 9600);
  
  // cp5
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Verdana", 20));
  
  // create all buttons
  
  // Play button
  cp5.addButton("Play")
    .setPosition(width/2-90, height/3)
    .setSize(180, 50);
  
  // HighScores button
  cp5.addButton("HighScores")
    .setPosition(width/2-90, height*2/3)
    .setSize(180, 50);
    
  // Back button (to home)
  cp5.addButton("Back")
    .setPosition(width/2-75, height*7/8)
    .setSize(150, 25);
    
  // PlayAgain button
  cp5.addButton("PlayAgain")
    .setPosition(width/2-100, height*4/9)
    .setSize(200, 50);

  // Name button (to input to high scores)
  cp5.addTextfield("Name")
    .setPosition(width/2-100, height*4.6/9)
    .setSize(200, 50)
    .setAutoClear(false);
  
  // Submit button (to input to high scores)
  cp5.addButton("Submit")
    .setPosition(width/2-75, height*6.5/9)
    .setSize(150, 50);

  // draw home page
  size(500, 500, P3D);
  Display_home();
}

void draw() {
  
  if (in_game == true) {
    
    // camera
    background(0);
    camera(250-250*x_accel, 250+250*y_accel, (height/2.0)/tan(PI*60 / 360), width/2, height/2, 0, 0, 1, 0);
    lights();
    
    // draw ball, goal, and maze walls
    ball(locX, locY, 0, 10);
    stroke(255, 0, 0); 
    fill(0);
    ellipse(425,425,35,35);
    walls(horWalls, verWalls);
    
    // calculate dirX, dirY from tilt of accelerometer
    getData();
    calculateDir();
    
    // detect wall collision. change dirX, dirY if collide
    for (int i = 0; i < num_horWalls; i++) {
      horWalls[i].changeDir();
    }
    for (int i = 0; i < num_verWalls; i++) {
      verWalls[i].changeDir();
    }
    
    // move the ball
    move_ball(dirX, dirY);
    
    // win game by moving ball to the end of maze
    if (locX > 425 && locY > 425) {
      
      // calculate score
      game_time = millis() - game_time;
      newScore = int(15000*exp(-0.0000358351893846*game_time));
      
      // reset game
      in_game = false;
      locX = 75; locY = 75;
      camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2, height/2, 0, 0, 1, 0);
      
      // display score
      Display_score(newScore);
    }
  }
}
