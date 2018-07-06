class horWall {
  float x, y, z;
  horWall(float _x, float _y, float _z) {
    x = _x; y = _y; z = _z;
    pushMatrix();
    translate(x, y, z);
    stroke(0);
    fill(100,100,255);
    scale(5, 1);
    box(10);
    popMatrix();
  }
  void changeDir() {
    float newX = locX + dirX;
    float newY = locY + dirY;
    
    // detect collisions
    // if ball comes from bottom or top
    if (locX >= x-25 && locX <= x+25) {
      if (newY-10 <= y+5 && locY >= y+5) {
        locY = y + 15;
      }
      else if (newY+10 >= y-5 && locY <= y-5) {
        locY = y - 15;
      }
    }
    // if ball comes from right or left
    else if (newY >= y-5 && newY <= y+5) {
      if (newX-10 <= x+25 && locX >= x+25) {
        locX = x + 35;
      } else if (newX+10 >= x-25 && locX <= x-25) {
        locX = x - 35;
      }
    }
    // if ball comes from upper left corner
    else if (dist(newX, newY, x-25, y-5) < 10) {
      //if (dirX > 0) dirX = 0; if (dirY > 0) dirY = 0;
      float theta = angle(locX-(x-25), locY-(y-5));
      locX = x-25 + 10*cos(theta);
      locY = y-5 - 10*sin(theta);
    }
    // if ball comes from upper right corner
    else if (dist(newX, newY, x+25, y-5) < 10) {
      float theta = angle(locX-(x+25), locY-(y-5));
      locX = x+25 + 10*cos(theta);
      locY = y-5 - 10*sin(theta);
    }
    // if ball comes from lower left corner
    else if (dist(newX, newY, x-25, y+5) < 10) {
      float theta = angle(locX-(x-25), locY-(y+5));
      locX = x-25 + 10*cos(theta);
      locY = y+5 - 10*sin(theta);
    }
    // if ball comes from lower right corner
    else if (dist(newX, newY, x+25, y+5) < 10) {
      float theta = angle(locX-(x+25), locY-(y+5));
      locX = x+25 + 10*cos(theta);
      locY = y+5 - 10*sin(theta);
    }
  }
}

class verWall {
  float x, y, z;
  verWall(float _x, float _y, float _z) {
    x = _x; y = _y; z = _z;
    pushMatrix();
    translate(x, y, z);
    fill(100,100,255);
    scale(1, 5);
    box(10);
    popMatrix();
  }
  void changeDir() {
    float newX = locX + dirX;
    float newY = locY + dirY;
    
    // detect collision
    // if ball comes from right or left
    if (newY >= y-25 && newY <= y+25) {
      if (newX-10 <= x+5 && locX >= x+5) {
        locX = x + 15;
      } else if (newX+10 >= x-5 && locX <= x-5) {
        locX = x - 15;
      }
    }
    // if ball comes from bottom or top
    if (newX >= x-5 && newX <= x+5) {
      if (newY-10 <= y+25 && locY >= y+25) {
        locY = y + 35;
      } else if (newY+10 >= y-25 && locY <= y-25) {
        locY = y - 35;
      }
    }
    // if ball comes from upper left corner
    else if (dist(newX, newY, x-5, y-25) < 10) {
      float theta = angle(locX-(x-5), locY-(y-25));
      locX = x-5 + 10*cos(theta);
      locY = y-25 - 10*sin(theta);
    }
    // if ball comes from upper right corner
    else if (dist(newX, newY, x+5, y-25) < 10) {
      float theta = angle(locX-(x+5), locY-(y-25));
      locX = x+5 + 10*cos(theta);
      locY = y-25 - 10*sin(theta);
    }
    // if ball comes from lower left corner
    else if (dist(newX, newY, x-5, y+25) < 10) {
      float theta = angle(locX-(x-5), locY-(y+25));
      locX = x-5 + 10*cos(theta);
      locY = y+25 - 10*sin(theta);
    }
    // if ball comes from lower right corner
    else if (dist(newX, newY, x+5, y+25) < 10) {
      float theta = angle(locX-(x+5), locY-(y+25));
      locX = x+5 + 10*cos(theta);
      locY = y+25 - 10*sin(theta);
    }
  }
}
