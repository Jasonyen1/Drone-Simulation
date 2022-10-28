class Drone {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float mass; // kilograms
  
  Drone(PVector startPos, PVector startVel) {
    position = startPos;
    velocity = startVel;
    acceleration = new PVector(0, 0);
  }
  
  void updatePosition() {
    position.x += velocity.x * deltaT;
    position.y += velocity.y * deltaT;
  }
  
  void updateVelocity() {
    if (getSpeed() >= maxSpeed) {
      return;
    }
    velocity.x += acceleration.x * deltaT;
    velocity.y += acceleration.y * deltaT;
  }
  
  float getSpeed() {
    return sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));
  }
  
  void applyForce(PVector force) {
    acceleration.x = force.x / mass;
    acceleration.y = force.y / mass;
  }
}
