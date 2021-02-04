class Particle extends GameObject {
  int t;
  PVector dir;
  int speed;

  Particle() {
    //loc = Bullet.get.copy();
    
    //speed = Bullet.dir.copy();
    //speed.rotate(PI + random(-0.5, 0.5));
    //speed.setMag(5);
    //int hitx = int(loc.x+2000) / gridSize;
    //int hity = int(loc.z+2000) / gridSize;
    size = 10;
    //lives = 1;
    t = 255;
  }

  void show() {
    //world.strokeWeight(3);
    //world.stroke(random(0, 255), random(0, 100), 0, t);
    //world.fill(random(0, 255), random(0, 100), 0, t);
    //t = t - 10;
    
    //int x = int(loc.x+2000) / gridSize;
    //int hity = int(loc.z+2000) / gridSize;
    world.pushMatrix();
    world.alpha(10);
    //world.smooth(100);
    world.strokeWeight(3);
    world.stroke(255);
    world.fill(255);
    world.rect(10, 10,50, 50);
    world.popMatrix();
    
  }

  void act() {
    
    
    //world.rect(hitx, hity, 50, 50);
    //if (map.get(hitx,hity) == white) {
    //  loc.add(dir);
      //objects.add(new Particle());
    //}
  } 
  //  super.act();
  //  //dieoffScreen();
  //  int i = 0;
  //  while (i < objects.size()) {
  //    GameObject myObj = objects.get(i);
  //    if (myObj instanceof Bullet) {
  //      if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size) {
  //        //objects.lives = 0;
  //        lives = 0;
  //        //if (size > 30) {
  //          //objects.add(new Particle(size/2, loc.x, loc.y));
  //          //objects.add(new Particle(size/2, loc.x, loc.y));
  //        //}
  //      }
  //    }
  //    i++;
  //  }
  //}
}


//class Particle extends GameObject {

//  int t;
//  PVector dir;
//  float speed;

//  Particle() {
//    //location = myShip.location.copy();
//    //velocity = myShip.direction.copy();
//    //dir.rotate(PI + random(-0.5, 0.5));
//    dir.setMag(speed);
//    size = 1;
//    lives = 1;
//    t = 255;
//  }

//  void show() {
//    strokeWeight(3);
//    stroke(random(0, 255), random(0, 100), 0, t);
//    fill(random(0, 255), random(0, 100), 0, t);
//    t = t - 10;
//    rect(loc.x, loc.y, size, size);
//  }

//  void act() {
//    super.act();
//  }
//}

//class Particle extends GameObject {
 
//  PVector dir;
//  float speed;
 
//  Particle() {
//   super(eyex,eyey,eyez,10);
//   speed = 50;
//   float vx = cos(leftRightAngle);
//   float vy = tan(upDownAngle);
//   float vz = sin(leftRightAngle);
//   dir = new PVector(vx,vy,vz);
//   dir.setMag(speed);
//  }
 
//  void act() {
//    //int hitx = int(loc.x+2000) / gridSize;
//    //int hity = int(loc.z+2000) / gridSize;
//    //if (map.get(hitx,hity) == white) {
//    //  loc.add(dir);
//    //  objects.remove(new Particle());
//    //} else {
//    //  lives = 0;
//    //  for (int i = 0; i < 5; i++) {
//    //    objects.add(new Particle()); // (loc));
//    //  }
//    //}
//  }
//    void show() {
//    world.pushMatrix();
//    world.strokeWeight(3);
//    world.smooth(100);
//    world.stroke(255);
//    world.fill(255);
//    world.translate(loc.x, loc.y,loc.z);
//    world.rotate(dir.heading());
//    world.sphere(7);
//    world.popMatrix();
//  }
//}
