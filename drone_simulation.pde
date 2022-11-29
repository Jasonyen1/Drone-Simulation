int fps = 60;
int frames = 0;
float deltaT = 1/fps;
PImage img;
Human h;


void setup() {
  frameRate(fps);
  size(1273, 694); // needs to be exactly the dimensions of the background image
  img = loadImage("background.png"); // name of image file, file needs to be in same folder as code
  fires.add(new Fire(random(img.width/4, img.width*3/4), random(img.height/4, img.height *3/4)));
  drawFires();
  h = new Human(PVector.add(fires.get(0).position, new PVector(50, 50)));
}

void draw() {
  image(img, 0, 0);
  //redraw drones here
  //Fleet fleet = new Fleet(4, 2, 12);
  updateFires();
  if (frames++ % 10 == 0) {
    spreadFires();
  }
  h.tick();
  drawFires();
  h.drawHuman();
}
