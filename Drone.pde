class Drone {
  PVector position;
  PVector velocity;
  float maxSpeed;
  
  int triLength;
  //final int diameter = 30;
  
  Drone(PVector startPos, PVector startVel) {
    position = startPos;
    velocity = startVel;
  }
  
  void updatePosition() {
    //position.x += velocity.x * deltaT;
    //position.y += velocity.y * deltaT;
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void updateVelocity(float vx, float vy) {
    if (getSpeed() >= maxSpeed) {
      return;
    }
    velocity.x = vx;
    velocity.y = vy;
  }
  
  float getSpeed() {
    return sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));
  }
  
  void tick() {
    updatePosition();
  }
}
