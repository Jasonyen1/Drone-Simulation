class Fire {
  PVector position;
  int radius;
  int[] rgb = {230, 130, 10};
  
  Fire(float x, float y) {
    position = new PVector(x, y);
    radius = int(random(10, 15));
  }
  
  void drawFire() {
    fill(rgb[0], rgb[1], rgb[2]);
    circle(position.x, position.y, radius);
  }
  
  Fire spread(int numFires) {
    if (random(1, 100) > 10/numFires + 1) {
      return null;
    }
    float newX = position.x + random(-50, 50);
    float newY = position.y + random(-50, 50);
    //float newX = random(displayWidth/4, displayWidth*3/4);
    //float newY = random(displayHeight/4, displayHeight*3/4);
    return new Fire(newX, newY);
  }
  
  void enlarge() {
    if (radius >= 35 || random(1, 100) > 3) {
      return;
    }
    radius += 1;
  }
  
  void intensify() {
    //rgb[0] += int(random(100, 150));
    rgb[1] -= int(random(-2, 2));
    if (rgb[1] < 0) {
      rgb[1] = 0;
    }
  }
}
