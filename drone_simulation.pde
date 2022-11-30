int fps = 60;
int frames = 0;
float deltaT = 1/fps;
PImage img;

void setup() {
  frameRate(fps);
  size(1273, 694); // needs to be exactly the dimensions of the background image
  img = loadImage("background.png"); // name of image file, file needs to be in same folder as code
  for (int i = 0; i < 2; i++)
    fires.add(new Fire(random(img.width/4, img.width*3/4), random(img.height/4, img.height *3/4)));
  drawFires();
  
  createCameraDrones();
  
  //println(img.width);
  //println(img.height);
  for (int i = 0; i < 10; i++)
    humans.add(new Human(new PVector(random(img.width/4, img.width*3/4), random(img.height/4, img.height *3/4))));

}

void draw() {
  image(img, 0, 0);
  updateFires();
  if (frames++ % 10 == 0) {
    spreadFires();
  }
  for (Human h : humans) h.tick();
  drawFires();
  
  updateCameraDrones();
  for (Human h : humans) h.drawHuman();
}

void mouseClicked() {
  humans.add(new Human(new PVector(mouseX, mouseY)));
}
