import java.awt.Robot;

color black = #000000;
color white = #FFFFFF;
color dullBlue = #7092BE;

PImage mossyStone;
PImage oakPlanks;

int gridSize;
PImage map;

Robot Geraldo;

float eyex,eyey,eyez,focusx,focusy,focusz,upx,upy,upz; //camera position, facing point, tilt axis
boolean wkey, akey, skey, dkey, spacekey;

float leftRightAngle, upDownAngle;

ArrayList<GameObject> objects;

PGraphics world;
PGraphics HUD;

void setup() {
 
  shotTimer = 0;
  threshold = 20;
 
  world = createGraphics(width,height,P3D);
  HUD = createGraphics(width,height,P2D);
 
  objects = new ArrayList<GameObject>();
 
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
 
  try {
    Geraldo = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
 
  size(displayWidth,displayHeight,P2D);
 
  eyex = width/2;
  eyey = 6*height/7;
  eyez = height/2;
 
  focusx = width/2;
  focusy = height/2;
  focusz = height/2-100;
 
  upx = 0;
  upy = 1;
  upz = 0;
 
  map = loadImage("map.png");
  gridSize = 100;
}

void draw() {
 
  world.beginDraw();
 
  noCursor();
 
  world.textureMode(NORMAL);
  world.background(222);
  world.pointLight(100,100,100,eyex,eyey,eyez);
  world.camera(eyex,eyey,eyez,focusx,focusy,focusz,upx,upy,upz);
 
  move();
  drawAxis();
  drawFloor(-2000,2000,height,gridSize);
  drawFloor(-2000,2000,height-gridSize*4,gridSize);
  drawMap();
 
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  world.endDraw();
 
  image(world,0,0);
 
  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();
 
  HUD.endDraw();
  image(HUD,0,0);
 
}
