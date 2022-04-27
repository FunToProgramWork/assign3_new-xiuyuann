final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
PImage gh;
PImage soil0;
PImage soil1;
PImage soil2;
PImage soil3;
PImage soil4;
PImage soil5;
PImage lifeImg;
PImage stone1;int hx=80,hy=80,aa=10,bb=10;
// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;void setup() {
size(640, 480, P2D);
// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
bg = loadImage("img/bg.jpg");
title = loadImage("img/title.jpg");
gameover = loadImage("img/gameover.jpg");
startNormal = loadImage("img/startNormal.png");
startHovered = loadImage("img/startHovered.png");
restartNormal = loadImage("img/restartNormal.png");
restartHovered = loadImage("img/restartHovered.png");
soil8x24 = loadImage("img/soil8x24.png");
gh= loadImage("img/groundhogIdle.png");
soil0=loadImage("img/soil0.png");
soil1=loadImage("img/soil1.png");
soil2=loadImage("img/soil2.png");
soil3=loadImage("img/soil3.png");
soil4=loadImage("img/soil4.png");
soil5=loadImage("img/soil5.png");
lifeImg= loadImage("img/life.png");
stone1 =loadImage("img/stone1.png");
}void draw() {
/* ------ Debug Function ------ Please DO NOT edit the code here.
It's for reviewing other requirements when you fail to complete the camera moving requirement. */
if (debugMode) {
pushMatrix();
translate(0, cameraOffsetY);
}
/* ------ End of Debug Function ------ */
switch (gameState) { case GAME_START: // Start Screen
image(title, 0, 0); if(START_BUTTON_X + START_BUTTON_W > mouseX
&& START_BUTTON_X < mouseX
&& START_BUTTON_Y + START_BUTTON_H > mouseY
&& START_BUTTON_Y < mouseY) { image(startHovered, START_BUTTON_X, START_BUTTON_Y);
if(mousePressed){
gameState = GAME_RUN;
mousePressed = false;
} }else{ image(startNormal, START_BUTTON_X, START_BUTTON_Y); }
break; case GAME_RUN: // In-Game // Background
image(bg, 0, 0); // Sun
stroke(255,255,0);
strokeWeight(5);
fill(253,184,19);
ellipse(590,50,120,120); // Grass
fill(124, 204, 25);
noStroke();
rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT); // Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
for(int x=0;x<640;x+=80){
image(soil0,x,160);
image(soil0,x,240);
image(soil0,x,320);
image(soil0,x,400);
image(soil1,x,480);
image(soil1,x,560);
image(soil1,x,640);
image(soil1,x,720);
image(soil2,x,800);
image(soil2,x,880);
image(soil2,x,960);
image(soil2,x,1040);
image(soil3,x,1120);
image(soil3,x,1200);
image(soil3,x,1280);
image(soil3,x,1360);
image(soil4,x,1440);
image(soil4,x,1520);
image(soil4,x,1600);
image(soil4,x,1680);
image(soil5,x,1760);
image(soil5,x,1840);
image(soil5,x,1920);
image(soil5,x,2000);
image(stone1,240,160);
image(stone1,160,240);
image(stone1,480,320);
image(stone1,320,400);
image(stone1,80,480);
image(stone1,640,560);
image(stone1,480,640);
image(stone1,240,720);
image(stone1,80,320);
image(stone1,0,800);
image(stone1,160,800);
image(stone1,160,800);
image(stone1,480,800);
image(stone1,0,880);
image(stone1,240,240);
image(stone1,560,880);
image(stone1,480,160);
image(stone1,0,960);
image(stone1,480,960);
image(stone1,0,960);
image(stone1,80,1040);
image(stone1,160,1040);
image(stone1,480,1040);
image(stone1,80,1120);
image(stone1,160,1120);
image(stone1,0,1120);
image(stone1,240,1200);
image(stone1,320,1200);
image(stone1,0,1280);
image(stone1,240,1280);
image(stone1,320,1280);
image(stone1,80,1360);
image(stone1,160,1120);
image(stone1,0,1360);
image(stone1,480,1160);
image(stone1,80,1120);
image(stone1,160,1120);
image(stone1,400,1120);
image(stone1,480,1120);
} // Player
image(gh,hx,hy);
// Health UI
image( lifeImg,10,aa);
image( lifeImg,80,bb); break; case GAME_OVER:
image(gameover, 0, 0);
if(START_BUTTON_X + START_BUTTON_W > mouseX
&& START_BUTTON_X < mouseX
&& START_BUTTON_Y + START_BUTTON_H > mouseY
&& START_BUTTON_Y < mouseY) { image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
if(mousePressed){
gameState = GAME_RUN;
mousePressed = false;
// Remember to initialize the game here!
}
}else{ image(restartNormal, START_BUTTON_X, START_BUTTON_Y); }
break;
} // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
if (debugMode) {
popMatrix();
}
}void keyPressed(){
// Add your moving input code here // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
switch(key){
case 'w':
debugMode = true;
cameraOffsetY += 80;
break; case 's':
debugMode = true;
cameraOffsetY -= 80;
break; case 'a':
if(playerHealth > 0) playerHealth --;
break; case 'd':
if(playerHealth < 5) playerHealth ++;
break;
}
switch(keyCode){
case UP:
cameraOffsetY += 80;
debugMode = true;
hy -=80;
aa -=80;
bb -=80;
break;
case DOWN:
debugMode = true;
cameraOffsetY -= 80;
hy +=80;
aa +=80;
bb -=80;
break;
case LEFT:
hx -=80;
break;
case RIGHT:
hx +=80;
break;
default:
break;
}
}void keyReleased(){
}
