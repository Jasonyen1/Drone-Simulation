class CameraDrone extends Drone {
  int sight = 80;
  
  CameraDrone(PVector startPos, PVector startVel) {
    super(startPos, startVel);
    maxSpeed = 20;
    triLength = 15;
  }
  
  void drawDrone() {
    float x = position.x;
    float y = position.y;
    
    fill(100, 230, 15, 100);
    //tint(255, 200);
    circle(x - triLength/2, y, sight);
    
    fill(255, 255, 255);
    triangle(x, y, x - triLength, y + triLength/2, x - triLength, y - triLength/2);
  }
  
  void checkFireNear() {
    for (Fire f : fires) {
      PVector fpos = f.getPosition();
      float dist = sqrt(pow(fpos.x - position.x, 2) + pow(fpos.y - position.y, 2));
      if (dist < sight/2) {
        updateVelocity(0, 0);
      }
    }
  }
}

ArrayList<CameraDrone> cds = new ArrayList<CameraDrone>();

void createCameraDrones() {
  for (int i = 0; i < 4; i++) {
    int x = (int)random(-200, 0);
    int y = (int)((float)(i+1)/5 * img.height);
    cds.add(new CameraDrone(new PVector(x, y), new PVector(1, 0)));
  }
}

void updateCameraDrones() {
  for (CameraDrone cd : cds) {
    cd.checkFireNear();
    cd.updatePosition();
    cd.drawDrone();
  }
}
