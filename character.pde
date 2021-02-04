
int shotTimer, threshold;

void move() {
  pushMatrix();
 
  translate(focusx,focusy,focusz);
  fill(200);
  noStroke();
  //sphere(10);
  popMatrix();
 
  if (akey && canMoveLeft()) {
    eyex -= cos(leftRightAngle + radians(90))*20;
    eyez -= sin(leftRightAngle + radians(90))*20;
  }
  if (dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + radians(90))*20;
    eyez += sin(leftRightAngle + radians(90))*20;
  }
  if (wkey && canMoveForward()) {
    eyex += cos(leftRightAngle)*20;
    eyez += sin(leftRightAngle)*20;
  }
  if (skey && canMoveBackwards()) {
    eyex -= cos(leftRightAngle)*20;
    eyez -= sin(leftRightAngle)*20;
  }
 
  if (mousePressed && shotTimer >= threshold) {
    objects.add(new Bullet());
    shotTimer = 0;
  }
 
  shotTimer++;
 
  if (frameCount < 2) {
    Geraldo.mouseMove(width/2, height/2);
    mouseX = width/2;
    mouseY = height/2;
  }
  if (mouseX < 1) {
    Geraldo.mouseMove(width-2, mouseY);
  } else if (mouseX > width-2) {
    Geraldo.mouseMove(1, mouseY);
  }
 
  leftRightAngle += (mouseX - pmouseX)*0.01;
  upDownAngle    += (mouseY - pmouseY)*0.005;
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
 
 
 
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;
 
  //leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  //upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
 
  //if(upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  //if(upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
 
  //if (mouseX > width-2) Geraldo.mouseMove(3,mouseY);
  //if (mouseX < 2) Geraldo.mouseMove(width-3, mouseY);
}

boolean canMoveForward() {
 float fwdx, fwdy, fwdz;
 float leftx, lefty, leftz;
 float rightx,righty,rightz;
 int mapx, mapy;
 
 fwdx = eyex + cos(leftRightAngle)*200;
 fwdy = eyey;
 fwdz = eyez + sin(leftRightAngle)*200;
 
 mapx = int(fwdx+2000) / gridSize;
 mapy = int(fwdz+2000) / gridSize;
 
 if (map.get(mapx,mapy) == white) {
  return true;
 }else{
   return false;
 }
}

boolean canMoveLeft() {
  float lx, ly, lz;
 int mapx, mapy;
 
 lx = eyex + sin(leftRightAngle)*200;
 ly = eyey;
 lz = eyez;
 
 mapx = int(lx+2000) / gridSize;
 mapy = int(lz+2000) / gridSize;
 
 if (map.get(mapx,mapy) == white) {
  return true;
 }else{
   return false;
 }
}

boolean canMoveRight() {
  float rx, ry, rz;
 int mapx, mapy;
 
 rx = eyex - sin(leftRightAngle)*200;
 ry = eyey;
 rz = eyez;
 
 mapx = int(rx+2000) / gridSize;
 mapy = int(rz+2000) / gridSize;
 
 if (map.get(mapx,mapy) == white) {
  return true;
 }else{
   return false;
 }
}

boolean canMoveBackwards() {
  float bwdx, bwdy, bwdz;
 int mapx, mapy;
 
 bwdx = eyex - cos(leftRightAngle)*200;
 bwdy = eyey;
 bwdz = eyez - sin(leftRightAngle)*200;
 
 mapx = int(bwdx+2000) / gridSize;
 mapy = int(bwdz+2000) / gridSize;
 
 if (map.get(mapx,mapy) == white) {
  return true;
 }else{
   return false;
 }
}








//class Spaceship extends GameObject {
//  PVector direction;
//  int shotTimer, threshold;
//  int livesTimer;

//  Spaceship() {
//    location = new PVector(width/2, height/2);
//    direction = new PVector(0.1, 0);
//    velocity = new PVector(0, 0);
//    size = 50;
//    lives = 3;
//    shotTimer = 0;
//    threshold = 20;
//    livesTimer = 0;
//  }

//  void show() {
//    pushMatrix();
//    fill(255);
//    strokeWeight(3);
//    stroke(255);
//    translate(location.x, location.y);
//    rotate(direction.heading());
//    rect(-10, 18, 40, 10);
//    rect(-10, -18, 40, 10);
//    line(-30, -50, 0, 50);
//    line(-30, 50, 0, -50);
//    line(-30, 50, -10, 50);
//    line(0, 50, 20, 50);
//    line(-30, -50, -10, -50);
//    line(0, -50, 20, -50);
//    triangle(-25, -12.5, -25, 12.5, 40, 0);
//    stroke(70);
//    fill(70);
//    ellipse(-5, 0, -30, -10);
//    popMatrix();
//  }

//  void act() {
//    livesTimer++;
//    super.act();
//    int i = 0;
//    while (i < myObjects.size() && livesTimer >= 60) {
//      GameObject myObj = myObjects.get(i);
//      if (myObj instanceof Asteroid) {
//        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= myObj.size) {

//          lives--;
//          livesTimer = 0;
//        }
//      }
//      i++;
//    }

//    if (lives == 3) {
//      heart1();
//      heart2();
//      heart3();
//    }

//    if (lives == 2) {
//      heart1();
//      heart2();
//    }

//    if (lives == 1) {
//      heart1();
//    }

//    if (lives == 0) {
//      mode = GAMEOVER;
//      location = new PVector(width/2, height/2);
//      direction = new PVector(0.1, 0);
//      velocity = new PVector(0, 0);
//      size = 50;
//      lives = 3;
//      shotTimer = 0;
//      threshold = 20;
//    }

//    shotTimer++;

//    if (wkey) {
//      velocity.add(direction);
//      myObjects.add(new Fire());
//      myObjects.add(new Fire());
//      myObjects.add(new Fire());
//      myObjects.add(new Fire());
//    }
//    if (skey) velocity.sub(direction);
//    if (dkey) direction.rotate(radians(5));
//    if (akey) direction.rotate(-radians(5));
//    if (spacekey && shotTimer >= threshold) {
//      myObjects.add(new Bullet());
//      shotTimer = 0;
//    }
//  }
//}
