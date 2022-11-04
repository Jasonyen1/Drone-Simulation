class CameraDrone extends Drone {
  CameraDrone(PVector startPos, PVector startVel) {
    super(startPos, startVel);
    maxSpeed = 20;
    mass = 3;
  }
  
  void drawDrone() {
    fill(100, 200, 100);
    circle(position.x, position.y, diameter);
  }
  
  void 
}
