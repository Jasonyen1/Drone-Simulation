int fps = 60;
int frames = 0;
float deltaT = 1/fps;
PImage img;

void setup() {
  frameRate(fps);
  size(1273, 694); // needs to be exactly the dimensions of the background image
  img = loadImage("background.png"); // name of image file, file needs to be in same folder as code
  fires.add(new Fire(random(img.width/4, img.width*3/4), random(img.height/4, img.height *3/4)));
  drawFires();
  
  createCameraDrones();
  
  //println(img.width);
  //println(img.height);
}

void draw() {
  image(img, 0, 0);
  updateFires();
  if (frames++ % 10 == 0) {
    spreadFires();
  }
  drawFires();
  
  updateCameraDrones();
}
