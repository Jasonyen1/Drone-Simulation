class Fleet {
  ArrayList<Drone> drones;
  
  void addDrone(Drone drone) {
    drones.add(drone);
  }
  
  int numDrones() {
    return drones.size();
  }
}
