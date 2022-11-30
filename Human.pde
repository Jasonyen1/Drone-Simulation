ArrayList<Human> humans = new ArrayList();

// Distance Squared
float dSq(PVector lhs, PVector rhs) {
  return PVector.sub(lhs, rhs).magSq();
}

class Human {
  boolean fireNear = false;
  boolean hasSurvivalGear = false;
  boolean dead = false;
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
    if (dead) {
      fill(#000000);
    } else if (hasSurvivalGear) {
      fill(#0000bb);
    } else {
      fill(#88ccee);
    }
    square(position.x, position.y, 15);
  }
  
  void ai() {
    if (dSq(nearestFire().position, position) < 50000) fireNear = true;
    else fireNear = false;
    
    if (scared()) movement = PVector.mult(directionToNearestFire(), -1); 
    else movement = new PVector();
  }
  
  void tick() {
    if (!dead){
      ai();
      this.position.add(PVector.mult(movement, 0.05));
      for (Fire fire : fires) {
        if (dSq(position, fire.position) < fire.radius * fire.radius && !hasSurvivalGear) {
          dead = true;
        }
      }

    }
    
    
  }
}
