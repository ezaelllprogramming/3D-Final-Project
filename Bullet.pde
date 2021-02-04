class Bullet extends GameObject {
 
  PVector dir;
  float speed;
 
  Bullet() {
   super(eyex,eyey,eyez,10);
   speed = 50;
   float vx = cos(leftRightAngle);
   float vy = tan(upDownAngle);
   float vz = sin(leftRightAngle);
   dir = new PVector(vx,vy,vz);
   dir.setMag(speed);
  }
 
  void act() {
    int hitx = int(loc.x+2000) / gridSize;
    int hity = int(loc.z+2000) / gridSize;
    if (map.get(hitx,hity) == white) {
      loc.add(dir);
      objects.remove(new Bullet());
      objects.add(new Particle());
    } else {
      lives = 0;
      //for (int i = 0; i < 5; i++) {
      //  objects.add(new Particle()); // (loc));
      //}
    }
  }
    void show() {
    world.pushMatrix();
    world.alpha(10);
    //world.smooth(100);
    world.strokeWeight(3);
    world.stroke(255);
    world.fill(255);
    world.translate(loc.x, loc.y,loc.z);
    world.rotate(dir.heading());
    world.sphere(4);
    world.popMatrix();
  }
}
