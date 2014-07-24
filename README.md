makethings.io
=============

Some Arduino and Processing sketches for using sensors attached to Arduino and using Processing to access and vizualise them

What is Arduino?
---------------
>"Arduino is an open-source electronics platform based on easy-to-use hardware and software. It's intended for anyone making interactive projects."

**THE BLUE THING ON THE TABLE**

#### Arduino Board

Arduino senses the environment by receiving inputs from many sensors, and affects its surroundings by controlling lights, motors, and other actuators.

#### Arduino Software

You can tell your Arduino what to do by writing code in the Arduino programmming language and using the Arduino development environment.

__You won't need that in this workshop. I'll take care of the Arduino Software :)__

What is Processing?
-----
Processing is a programming language, development environment, and online community. Since 2001, Processing has promoted software literacy within the visual arts and visual literacy within technology. Initially created to serve as a software sketchbook and to teach computer programming fundamentals within a visual context, Processing evolved into a development tool for professionals. Today, there are tens of thousands of students, artists, designers, researchers, and hobbyists who use Processing for learning, prototyping, and production.

* Free to download and open source
* Interactive programs with 2D, 3D or PDF output
* OpenGL integration for accelerated 3D
* For GNU/Linux, Mac OS X, and Windows
* Over 100 libraries extend the core software
* Well documented, with many books available

Basic Instructions
--------------------
Even tho we use the Arduino http://arduino.cc you don't need to download the Arduino Software to program it. There will be a program installed on the Arduino that makes it accessible from Processing.  
Your Arduino board is connected to some sensors and buttons. The sensors are connected to analog input pins. That means we an can values between 0 and 255 depending on the state of the sensor.   
So go and get Processing from http://processing.org  
Open Processing and go to the Menu: Sketch > Import Library... > Add Library  
Search for Arduino, which will show you Arduino (Firmata)  
Install it and restart Processing  
There are some examples under File > Examples > Constributed Libraries > Arduino
but a simple program that reads a sensor attached to an analog input looks like this:  

    // Basic Processing sketch to communicate to an arduino via Firmata.
    // StandardFirmata should be installed on the Arduino.
    // The sketch is reading from a sensor that is attached to pin A0

    // Define the port you want to use !
    String portName = "COM4";
 
    import processing.serial.*;
    import cc.arduino.*;
    Arduino arduino;


    void setup() {
      println(Arduino.list());
      arduino = new Arduino(this, portName, 57600);
    }

    void draw() {
      int sensor1 = arduino.analogRead(0); 
      println(sensor1);
      background(sensor1);
    }

  
  
Now we can start to read the other sensor and create some cool vizualisations. A good example which is nice to play with is the Tree example in Examples > Topicy > Fractals and L-System.
