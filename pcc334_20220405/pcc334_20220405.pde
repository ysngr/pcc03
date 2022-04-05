/* 334_20210405 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}

void draw() {
  background(33, 22, 10);
  plate(width/2, height/2, 740);
}

void plate(float cx, float cy, float d) {
  final color[] cs = {
    color(218,  65,  72),
    color(208,  15,  49),
    color(165,  26,  41),
    color( 79,  53,  39),
    color( 68,  81,  54),
    color(255, 240, 193),
    color(231, 168,  73)
  };
  float st, et, dt, x, y, a;
  ArrayList<PVector> ps;
  PVector p, q;
  color c;
  pushMatrix();
  translate(cx, cy);
  for ( int i = 0; i < 8; i++ ) {
    // init
    noiseSeed(int(random(1024)));
    rotate(random(-PI, PI));
    ps = new ArrayList<PVector>();
    st = random(-PI, PI) / 3;
    et = random(-PI, PI) / 3;
    if ( et < st ) {
      float tmp = st;
      st = et;
      et = tmp;
    }
    for ( float r = random(0.5)*d/2; r < random(0.8, 2.0)*d/2; r += random(0.01, 0.05)*d/2 ) {
      x = r * cos(st);
      y = r * sin(st);
      dt = PI/3 * (noise(x, y) - 0.5);
      ps.add(new PVector(r*cos(st+dt), r*sin(st+dt)));
    }
    // draw
    strokeWeight(random(1, 2));
    c = cs[int(random(cs.length))];
    a = random(120, 160);
    while ( (a -= random(1)) > 0 ) {
      rotate(PI/800);
      stroke(c, a);
      for ( int j = 1; j < ps.size(); j++ ) {
        p = ps.get(j-1);
        q = ps.get(j);
        line(p.x, p.y, q.x, q.y);
      }
    }
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("_233.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
