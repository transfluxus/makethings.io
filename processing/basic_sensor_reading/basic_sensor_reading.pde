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
  // printing all serial ports
  println(Arduino.list());
  // connecting to arduino. It needs StandardFirmata running on it, which is in the Arduino examples
  arduino = new Arduino(this, portName, 57600);
}

// forever repeating function
void draw() {
  // getting a value from the sensor(between 0 and 1023) that is connected to A0
  int sensor1 = arduino.analogRead(0); 
  // print it!
  println(sensor1);
  // set the background brightness according to the sensor reading
  background(sensor1/4);
}
