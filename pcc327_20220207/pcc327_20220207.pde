/* 327_20220207 */

//-------------------------------------------//
// original: hanamuke by nejio               //
// https://openprocessing.org/sketch/1303531 //
//-------------------------------------------//

float pointCount;
float freq;
float modfreq;
float phi;

void setup() {
  size(1150, 800);
  noLoop();
  smooth();
  pointCount = width * 0.7;
}

void draw() {
  background(getRandColor());
  for ( int i = 0; i < 15; i++ ) {
    showNCircle(random(width), random(height), random(width*0.05, width*0.45));
  }
  for ( int i = 0; i < width*height/20; i++ ) {
    stroke(getRandColor(), 200);
    point(random(width), random(height));
  }
  showWave(0, height/2);
  showHalo(height/2, 800);
}

color getRandColor() {
  final color[] cs = {
    #f3f2f2, #cb333f, #979fb3, #d6b6ca, 
    //#FDFDFD, #CDE5E5, #EFD0E0, #FFF001, #00A9E4, #013C7E,
  };
  return cs[int(random(cs.length))];
}

void showNCircle(float cx, float cy, float radius) {
  float count = radius * 2;
  color c = getRandColor();
  for ( int i = 0; i < count; i++ ) {
    float alpha = map(i, 0, count, 127, 0);
    noFill();
    stroke(c, alpha);
    ellipse(cx, cy, radius+i, radius+i);
  }
}

void showWave(float _x, float _y) {
  push();
  translate(_x, _y);

  freq = random(5, 15);
  modfreq = random(5, 15);
  phi = random(0, 360);

  curveTightness(4.0);
  beginShape();
  for ( int i = 0; i < pointCount; i += 1 ) {
    float angle = map(i, 0, pointCount, 0, 360);
    float info = _sin(angle * freq + phi);
    float carrier = _cos(angle * modfreq);
    float r = random(10, 20);
    float y = info * carrier;
    y = y * 250;

    if ( i % 10 == 0 ) {
      stroke(getRandColor());
      fill(getRandColor());
      ellipse(i, random(1.0, 1.4)*y, r, r);
    }
    curveVertex(i, y);
  }
  strokeWeight(3);
  stroke(getRandColor());
  noFill();
  endShape();

  pop();
}

float _sin(float angle) {
  return sin(radians(angle));
}

float _cos(float angle) {
  return cos(radians(angle));
}

void showHalo(float _y, float d) {
  blendMode(ADD);
  strokeWeight(0.8);
  fill(getRandColor(), 4);
  for ( int i = 0; i < 30; i++ ) {
    stroke(getRandColor(), random(20, 50));
    circle(pointCount+random(-0.1, 0.3)*d, _y+random(-0.05, 0.05)*d, random(0.9, 1.1)*d);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("327.png");
    exit();
  } else if ( key == 'r' ) {
    blendMode(BLEND);
    strokeWeight(1);
    redraw();
  }
}
