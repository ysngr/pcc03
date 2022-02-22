/* 327_20220207 reconstruction */

//-------------------------------------------//
// original: hanamuke by nejio               //
// https://openprocessing.org/sketch/1303531 //
//-------------------------------------------//

void setup() {
  size(1150, 800);
  noLoop();
  smooth();
}

void draw() {
  background(rcolor());
  for ( int i = 0; i < 15; i++ ) {
    dechole(random(width), random(height), random(60, 520));
  }
  mist(width*height/20);
  wave(0, height/2, 0.7*width);
  halo(0.7*width, height/2, 800);
}

color rcolor() {
  final color[] cs = {
    #f3f2f2, #cb333f, #979fb3, #d6b6ca, 
    //#FDFDFD, #CDE5E5, #EFD0E0, #FFF001, #00A9E4, #013C7E,
  };
  return cs[int(random(cs.length))];
}

void dechole(float cx, float cy, float d) {
  color c = rcolor();
  noFill();
  for ( int i = 0; i < 2*d; i++ ) {
    stroke(c, map(i, 0, 2*d, 127, 0));
    circle(cx, cy, d+i);
  }
}

void mist(int n) {
  for ( int i = 0; i < n; i++ ) {
    stroke(rcolor(), 200);
    point(random(width), random(height));
  }
}

void wave(float sx, float sy, float dur) {
  final float A = 250;
  float t, fs, fc, y, d;
  push();
  translate(sx, sy);
  curveTightness(4);
  beginShape();
  fs = random(5, 15);
  fc = random(5, 15);
  for ( int x = 0; x < dur; x++ ) {
    t = map(x, 0, dur, 0, TWO_PI);
    y = A * sin(fs*t) * cos(fc*t);
    curveVertex(x, y);
    if ( x % 10 == 0 ) {
      d = random(10, 20);
      stroke(rcolor());
      fill(rcolor());
      circle(x, random(1.0, 1.4)*y, d);
    }
  }
  strokeWeight(3);
  stroke(rcolor());
  noFill();
  endShape();
  pop();
}

void halo(float cx, float cy, float d) {
  blendMode(ADD);
  strokeWeight(0.8);
  fill(rcolor(), 4);
  for ( int i = 0; i < 30; i++ ) {
    stroke(rcolor(), random(20, 50));
    circle(cx+random(-0.1, 0.3)*d, cy+random(-0.05, 0.05)*d, random(0.9, 1.1)*d);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("327_recons.png");
    exit();
  } else if ( key == 'r' ) {
    blendMode(BLEND);
    strokeWeight(1);
    redraw();
  }
}
