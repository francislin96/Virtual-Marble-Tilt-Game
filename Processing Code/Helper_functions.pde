/* --------------- HELPER FUNCTIONS --------------- */

void addHighScore() {
  String[] highscores = loadStrings("highscores.txt");
  int place_num = highscores.length;
  
  if (highscores.length < 10) {
    
    // add new line
    highscores = append(highscores, ".");
    
    // find place of newscore
    for (int i = highscores.length-2; i >= 0; i--) {
      int tempScore = int(split(highscores[i],',')[1]);
      if (newScore > tempScore) {
        place_num = i;
      }
    }

    // insert newscore
    for (int i = highscores.length-1; i >= place_num+1; i--) {
      highscores[i] = highscores[i-1];
    }
    highscores[place_num] = cp5.get(Textfield.class,"Name").getText() + ',' + str(newScore);
    
    // save new highscores
    saveStrings("highscores.txt", highscores);
  }
  else {
    // find place of newscore
    for (int i = 9; i >= 0; i--) {
      int tempScore = int(split(highscores[i],',')[1]);
      if (newScore > tempScore) {
        place_num = i;
      }
    }
    // insert newscore
    for (int i = 9; i >= place_num+1; i--) {
      highscores[i] = highscores[i-1];
    }
    highscores[place_num] = cp5.get(Textfield.class,"Name").getText() + ',' + str(newScore);

    // save new highscores
    saveStrings("highscores.txt", highscores);
  }
}

void hideAllButtons() {
  cp5.getController("Play").hide();
  cp5.getController("HighScores").hide();
  cp5.getController("Back").hide();
  cp5.getController("PlayAgain").hide();
  cp5.getController("Name").hide();
  cp5.getController("Submit").hide();
}

void ball(float x, float y, float z, float r) {
  pushMatrix();
  translate(x, y, z);
  noStroke();
  fill(255, 0, 0);
  sphere(r);
  popMatrix();
}

void move_ball(float delta_x, float delta_y) {
  locX += delta_x;
  locY += delta_y;
  dirX = 0;
  dirY = 0;
}

void calculateDir() {
  // change dirX, dirY
  dirX = 300*x_accel/50.0;
  dirY = -300*y_accel/50.0;
}

void walls(horWall[] horWalls, verWall[] verWalls) {
  // draw horizontal walls
  horWalls[0] = new horWall(75, 50, 0);
  horWalls[1] = new horWall(125, 50, 0);
  horWalls[2] = new horWall(175, 50, 0);
  horWalls[3] = new horWall(225, 50, 0);
  horWalls[4] = new horWall(275, 50, 0);
  horWalls[5] = new horWall(325, 50, 0);
  horWalls[6] = new horWall(375, 50, 0);
  horWalls[7] = new horWall(425, 50, 0);
  horWalls[8] = new horWall(75, 100, 0);
  horWalls[9] = new horWall(175, 100, 0);
  horWalls[10] = new horWall(175, 100, 0);
  horWalls[11] = new horWall(325, 100, 0);
  horWalls[12] = new horWall(375, 100, 0);
  horWalls[13] = new horWall(125, 150, 0);
  horWalls[14] = new horWall(275, 150, 0);
  horWalls[15] = new horWall(375, 150, 0);
  horWalls[16] = new horWall(425, 150, 0);
  horWalls[17] = new horWall(175, 200, 0);
  horWalls[18] = new horWall(375, 200, 0);
  horWalls[19] = new horWall(125, 250, 0);
  horWalls[20] = new horWall(175, 250, 0);
  horWalls[21] = new horWall(225, 250, 0);
  horWalls[22] = new horWall(425, 250, 0);
  horWalls[23] = new horWall(125, 300, 0);
  horWalls[24] = new horWall(175, 300, 0);
  horWalls[25] = new horWall(225, 300, 0);
  horWalls[26] = new horWall(275, 300, 0);
  horWalls[27] = new horWall(375, 300, 0);
  horWalls[28] = new horWall(75, 350, 0);
  horWalls[29] = new horWall(125, 350, 0);
  horWalls[30] = new horWall(275, 350, 0);
  horWalls[31] = new horWall(325, 350, 0);
  horWalls[32] = new horWall(125, 400, 0);
  horWalls[33] = new horWall(125, 400, 0);
  horWalls[34] = new horWall(225, 400, 0);
  horWalls[35] = new horWall(275, 400, 0);
  horWalls[36] = new horWall(425, 400, 0);
  horWalls[37] = new horWall(75, 450, 0);
  horWalls[38] = new horWall(125, 450, 0);
  horWalls[39] = new horWall(175, 450, 0);
  horWalls[40] = new horWall(225, 450, 0);
  horWalls[41] = new horWall(275, 450, 0);
  horWalls[42] = new horWall(325, 450, 0);
  horWalls[43] = new horWall(375, 450, 0);
  horWalls[44] = new horWall(425, 450, 0);
  
  // draw vertical walls
  verWalls[0] = new verWall(50, 75, 0);
  verWalls[1] = new verWall(50, 125, 0);
  verWalls[2] = new verWall(50, 175, 0);
  verWalls[3] = new verWall(50, 225, 0);
  verWalls[4] = new verWall(50, 275, 0);
  verWalls[5] = new verWall(50, 325, 0);
  verWalls[6] = new verWall(50, 375, 0);
  verWalls[7] = new verWall(50, 425, 0);
  verWalls[8] = new verWall(100, 125, 0);
  verWalls[9] = new verWall(100, 225, 0);
  verWalls[10] = new verWall(100, 275, 0);
  verWalls[11] = new verWall(150, 125, 0);
  verWalls[12] = new verWall(150, 375, 0);
  verWalls[13] = new verWall(200, 125, 0);
  verWalls[14] = new verWall(200, 175, 0);
  verWalls[15] = new verWall(200, 375, 0);
  verWalls[16] = new verWall(250, 75, 0);
  verWalls[17] = new verWall(250, 125, 0);
  verWalls[18] = new verWall(250, 175, 0);
  verWalls[19] = new verWall(250, 225, 0);
  verWalls[20] = new verWall(300, 75, 0);
  verWalls[21] = new verWall(300, 225, 0);
  verWalls[22] = new verWall(300, 275, 0);
  verWalls[23] = new verWall(300, 375, 0);
  verWalls[24] = new verWall(350, 225, 0);
  verWalls[25] = new verWall(350, 275, 0);
  verWalls[26] = new verWall(350, 325, 0);
  verWalls[27] = new verWall(350, 375, 0);
  verWalls[28] = new verWall(350, 425, 0);
  verWalls[29] = new verWall(400, 375, 0);
  verWalls[30] = new verWall(450, 75, 0);
  verWalls[31] = new verWall(450, 125, 0);
  verWalls[32] = new verWall(450, 175, 0);
  verWalls[33] = new verWall(450, 225, 0);
  verWalls[34] = new verWall(450, 275, 0);
  verWalls[35] = new verWall(450, 325, 0);
  verWalls[36] = new verWall(450, 375, 0);
  verWalls[37] = new verWall(450, 425, 0);
}

float angle(float a, float b) {
  PVector v1 = new PVector(a, b);
  PVector v2 = new PVector(1, 0);
  float ang = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  if (ang < 0) ang += TWO_PI;
  return ang;
}

void getData() {
  if (myPort.available() > 0) {
    String val = myPort.readStringUntil('\n');
    
    // make sure val is legit string and split it into variables
    if (legitMessage(val)) {
      String[] list = split(val, ',');
      x_accel = float(list[0]);
      y_accel = float(list[1]);
      z_accel = float(list[2]);
      //print(x_accel + "   " + y_accel + "   " + z_accel);
      //print('\n');
    }
  }
}

boolean legitMessage(String val) {
  if (val == null) {
    return false; 
  }
  else {
    int count = 0;
    for (int i = 0; i < val.length(); i++) {
      if (val.charAt(i) == ',') {
        count = count + 1; 
      }
    }
    if (count != 2) {
      return false;
    }
    else
      return true;
  }
}
