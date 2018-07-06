// include necessary packages/libraries
#include "LIS3DH.h"
#define LIS3DH_CS 10

// initialize accelerometer and servos
LIS3DH accel = LIS3DH(LIS3DH_CS);

void setup() {
  Serial.begin(9600);
}

void loop() {
  accel.calculateAccel();
  accel.smoothData();
  accel.sendData();
  delay(15);
}

