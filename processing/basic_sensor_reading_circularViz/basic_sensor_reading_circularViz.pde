// Define the port you want to use. 
String portName = "COM4";
/* When you start the sketch and get an error message, 
 you most likely didn't use the right port.
 The console will show you all available ports. choose wisely
 */


import processing.serial.*;
import cc.arduino.*;

// our connector to Arduino
Arduino arduino;

// entrance function
void setup() {
  size(600, 600);
  // printing all serial ports
  println(Arduino.list());
  // connecting to arduino. It needs StandardFirmata running on it, which is in the Arduino examples
  arduino = new Arduino(this, portName, 57600);
  noStroke();
  fill(100, 200, 0);
}

// forever repeating function
void draw() {
  background(0);
  // getting a value from the sensor(between 0 and 1023) that is connected to A0
  int sensor1 = arduino.analogRead(0); 
  // print it!
  println(sensor1);
  // speed of the cursor
  float v = frameCount*0.01f;
  // basic cursor direction
 
  PVector pos =  PVector.fromAngle(v);
  // cursor distance from the center depends on the sensor reading
  float r = map(sensor1, 0, 1023, 20, width/2);
  pos.mult(r);
  translate(width/2, height/2);
  ellipse(pos.x, pos.y, 20, 20);
}

