class Fleet {
  ArrayList<Drone> active;
  ArrayList<Drone> inactive;
  
  Fleet(int numCamera, int numSurvival, int numWater) {
    active = new ArrayList<Drone>();
    inactive = new ArrayList<Drone>();
    for (int i = 0; i < numCamera; i++) {
      active.add(new CameraDrone(new PVector(0, height), new PVector(0, 0)));
    }
    for (int i = 0; i < numSurvival; i++) {
      inactive.add(new SurvivalDrone(new PVector(0, height), new PVector(0, 0)));
    }
    for (int i = 0; i < numWater; i++) {
      inactive.add(new WaterDrone(new PVector(0, height), new PVector(0, 0)));
    }
  }
  
  
  
  void addDrone(Drone drone) {
    inactive.add(drone);
  }
  
  
  void tick() {
    for (Drone drone : active) {drone.tick()}
  }
  
  
  int numCamera() {
    int count = 0;
    for (int i = 0; i < inactive.size(); i++) {
      if (inactive.get(i) instanceof CameraDrone) {count++;}
    }
    for (int i = 0; i < active.size(); i++) {
      if (active.get(i) instanceof CameraDrone) {count++;}
    }
    return count;
  }
  
  int numSurvival() {
    int count = 0;
    for (int i = 0; i < inactive.size(); i++) {
      if (inactive.get(i) instanceof SurvivalDrone) {count++;}
    }
    for (int i = 0; i < active.size(); i++) {
      if (active.get(i) instanceof SurvivalDrone) {count++;}
    }
    return count;
  }
  
  int numWater() {
    int count = 0;
    for (int i = 0; i < inactive.size(); i++) {
      if (inactive.get(i) instanceof WaterDrone) {count++;}
    }
    for (int i = 0; i < active.size(); i++) {
      if (active.get(i) instanceof WaterDrone) {count++;}
    }
    return count;
  }
  
  
  
  
  
  int numCamera(boolean active) {
    int count = 0;
    if (!active) {
    for (int i = 0; i < inactive.size(); i++) {
      if (inactive.get(i) instanceof CameraDrone) {count++;}
    } } else {
    for (int i = 0; i < active.size(); i++) {
      if (active.get(i) instanceof CameraDrone) {count++;}
    } }
    return count;
  }
  
  int numSurvival(boolean active) {
    int count = 0;
    if (!active) {
    for (int i = 0; i < inactive.size(); i++) {
      if (inactive.get(i) instanceof SurvivalDrone) {count++;}
    } } else {
    for (int i = 0; i < active.size(); i++) {
      if (active.get(i) instanceof SurvivalDrone) {count++;}
    } }
    return count;
  }
  
  int numWater(boolean active) {
    int count = 0;
    if (!active) {
    for (int i = 0; i < inactive.size(); i++) {
      if (inactive.get(i) instanceof WaterDrone) {count++;}
    } } else {
    for (int i = 0; i < active.size(); i++) {
      if (active.get(i) instanceof WaterDrone) {count++;}
    } }
    return count;
}
