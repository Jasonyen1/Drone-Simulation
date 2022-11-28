// Distance Squared
float dSq(PVector lhs, PVector rhs) {
  return PVector.sub(lhs, rhs).magSq();
}

class Human {
  boolean fireNear = false;
  boolean hasSurvivalGear = false;
  PVector position;
  PVector movement;
  public Human(PVector position) {
    this.position = position;
    this.movement = new PVector();
  }
  public Human(PVector position, PVector movement) {
    this.position = position;
    this.movement = movement;
  }
  
  boolean scared() {
    return fireNear && !hasSurvivalGear;
  }
  
  void receiveKit() {hasSurvivalGear = true;}
  
  Fire nearestFire() {
    if (fires.size() == 0) return null;
    Fire nearestFire = fires.get(0);
    float nearestFireDistanceSq = dSq(position, nearestFire.position);
    for (Fire fire : fires) {
      float newDistSq = dSq(position, fire.position);
      if (newDistSq < nearestFireDistanceSq) {
        nearestFireDistanceSq = newDistSq;
        nearestFire = fire;
      }
    }
    return nearestFire;
  }
  
  PVector directionToNearestFire() {
    return PVector.sub(nearestFire().position, position).normalize();
  }
  
  void drawHuman() {
    stroke(#ffffff);
    if (movement.x != 0 || movement.y != 0) {
      float rot = movement.heading();
      rotate(rot);
      position.rotate(-rot);
    }
    fill(#2222dd);
    ellipse(position.x, position.y, 20, 60);
    fill(#333333);
    ellipse(position.x, position.y, 20, 20);
    if (movement.x != 0 || movement.y != 0) {
      float rot = movement.heading();
      rotate(-rot);
      position.rotate(rot);
    }

  }
  
  void ai() {
    if (dSq(nearestFire().position, position) < 50000) fireNear = true;
    else fireNear = false;
    
    if (scared()) movement = directionToNearestFire().mult(-5); 
    else movement = new PVector();
  }
  
  void tick() {
    ai();
    
    position.add(movement);
  }
}
