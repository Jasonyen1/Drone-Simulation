int fps = 60;
float deltaT = 1/fps;
String image = ""; // name of image file, file needs to be in same folder as code

void setup() {
  frameRate(fps);
  size(640, 360); // needs to be exactly the dimensions of the background image
  loadImage(image);
}

void draw() {
  loadImage(image);
  //redraw drones here
}
