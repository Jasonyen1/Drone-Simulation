class Drone {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Drone(PVector startPos, PVector startVel) {
    position = startPos;
    velocity = startVel;
  }
  
  void updatePosition() {
    position.x += velocity.x * deltaT;
    position.y += velocity.y * deltaT;
  }
  
  void updateVelocity() {
    velocity.x += acceleration.x * deltaT;
    velocity.y += acceleration.y * deltaT;
  }
  
  eraseDrone() {
    
  }
}
