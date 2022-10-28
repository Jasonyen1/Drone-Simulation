class CameraDrone extends Drone {
  CameraDrone(PVector startPos, PVector startVel) {
    super(startPos, startVel);
    maxSpeed = 20;
    mass = 3;
  }
  
}
