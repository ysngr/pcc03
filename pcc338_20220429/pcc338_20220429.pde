/* 338_20220429 */

PVector[] ips, nps;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  init(6, 420);
  paint();
}

void init(int in, int nn) {
  // islands
  ips = new PVector[in];
  for ( int i = 0; i < ips.length; i++ ) {
    ips[i] = new PVector(random(width), random(height), random(40, 200));
  }
  // nets
  float x, y;
  nps = new PVector[nn];
  for ( int i = 0; i < nps.length; i++ ) {
    do {
      x = random(width);
      y = random(height);
    } while ( ! isFar(x, y) );
    nps[i] = new PVector(x, y);
  }
}

boolean isFar(float x, float y) {
  for ( int i = 0; i < ips.length; i++ ) {
    if ( dist(ips[i].x, ips[i].y, x, y) < ips[i].z ) {
      return false;
    }
  }
  return true;
}

void paint() {
  // island
  for ( int i = 0; i < ips.length; i++ ) {
    flower(ips[i]);
  }
  // net
  final float MAXDIST = 120;
  for ( int i = 0; i < nps.length; i++ ) {
    for ( int j = 0; j < i; j++ ) {
      if ( dist(nps[i].x, nps[i].y, nps[j].x, nps[j].y) < MAXDIST ) {
        strokeWeight(random(0.8, 1.5));
        stroke(random(160, 255), random(60, 120));
        line(nps[i].x, nps[i].y, nps[j].x, nps[j].y);
      }
    }
  }
}

void flower(PVector p) {
  final int ITIMES = 80;
  final color[] cs = {
    color(9, 158, 214),
    color(255, 99, 26)
  };
  color c = cs[int(random(cs.length))];
  noiseSeed(int(random(1024)));
  for ( int i = 0; i < ITIMES; i++ ) {
    stroke((( random(5) < 1 )? color(240) : c), 8);
    noFill();
    beginShape();
    for ( float t = 0; t < 4*TWO_PI; t += PI/32 ) {
      float r = p.z * noise((float)i/ITIMES, 2*t);
      vertex(p.x+r*cos(t), p.y+r*sin(t));
    }
    endShape();
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("338.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
