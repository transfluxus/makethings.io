/*
This program doesn't use Firmata but the Library called VSync.
The arduino should have ulra_sonic_sensor sketch in the arduino folder installed.

When you start the sketch and get an error message, 
you most likely didn't use the right port.
*/

import processing.serial.*;
import vsync.*;

//  We create a new ValueReceiver to receive values from the arduino
ValueReceiver receiver;


// Define the port you want to use
String portName = "COM4";

// we are getting a distance value from the ultra-sonic sensor, 2 other analog readings and a button reading
public int distance;
public int analog1;
public int analog2;
public int digital1;

void setup() {
  size(600, 600);
  Serial serial = new Serial(this, portName, 57600);
  receiver = new ValueReceiver(this, serial);
  receiver.observe("distance");
  receiver.observe("analog1");
  receiver.observe("analog2");
  receiver.observe("digital1");
}

void draw() {
  println("distance: "+distance + " "+ " analog1: "+analog1+ " analog2: "+analog2+ " digital1: "+digital1);
}

