int fps = 60;
int frames = 0;
float deltaT = 1/fps;
PImage img;

ArrayList<Fire> fires = new ArrayList<Fire>();
  
void drawFires() {
  strokeWeight(0);
  for (Fire f : fires) {
    f.drawFire();
  }
}

void updateFires() {
  for (Fire f : fires) {
    f.enlarge();
    f.intensify();
  }
}

void spreadFires() {
  ArrayList<Fire> newFires = new ArrayList<Fire>();
  for (Fire f : fires) {
    newFires.add(f.spread(fires.size()));
  }
  for (Fire f : newFires) {
    if (f != null) {
      fires.add(f);
    }
  }
}

void setup() {
  frameRate(fps);
  size(1273, 694); // needs to be exactly the dimensions of the background image
  img = loadImage("background.png"); // name of image file, file needs to be in same folder as code
  fires.add(new Fire(random(img.width/4, img.width*3/4), random(img.height/4, img.height *3/4)));
  drawFires();
}

void draw() {
  image(img, 0, 0);
  //redraw drones here
  //Fleet fleet = new Fleet(4, 2, 12);
  updateFires();
  if (frames++ % 10 == 0) {
    spreadFires();
  }
  drawFires();
}
