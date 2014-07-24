#include <VSync.h>

#define trigPin 13
#define echoPin 12

int distance;
int analog1;
int analog2;
int digital1;

int digitalInPin = 3;
ValueSender<4> sender;

void setup() {
  Serial.begin (57600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(digitalInPin,INPUT_PULLUP);
  
  sender.observe(distance);
  sender.observe(analog1);
  sender.observe(analog2);
  sender.observe(digital1);
}

void loop() {
  // for the ultra-sonic
  long duration;
  digitalWrite(trigPin, LOW);  // Added this line
  delayMicroseconds(2); // Added this line
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10); // Added this line
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = (duration/2) / 29.1;
  // other inputs
  analog1 = analogRead(0);
  analog2 = analogRead(1);
  digital1 = digitalRead(digitalInPin) == LOW ? HIGH : LOW;
  delay(20);
  sender.sync();
}
