class Fleet {
  ArrayList<Drone> active;
  ArrayList<Drone> inactive;
  
  Fleet(int numCamera, int numSurvival, int numWater) {
    for (int i = 0; i < numCamera; i++) {
      CameraDrone drone = new CameraDrone(new PVector(0, height), new PVector(0, 0));
      active.add(drone);
    }
    for (int i = 0; i < numSurvival; i++) {
      SurvivalDrone drone = new SurvivalDrone(new PVector(0, height), new PVector(0, 0));
      inactive.add(drone);
    }
    for (int i = 0; i < numWater; i++) {
      WaterDrone drone = new WaterDrone(new PVector(0, height), new PVector(0, 0));
      inactive.add(drone);
    }
  }
  
  
  
  void addDrone(Drone drone) {
    inactive.add(drone);
  }
  
  int numDrones() {
    return active.size() + inactive.size();
  }
}
