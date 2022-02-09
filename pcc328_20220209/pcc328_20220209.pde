/* 328_20220209 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  noiseground();
  smoke();
  bricks();
  flower();
}

void noiseground() {
  background(255);
  loadPixels();
  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      pixels[w+h*width] = color(
        80 * noise(5*float(w)/width, 5*float(h)/height), 
        240 * noise(float(w)/width, float(h)/height), 
        235
      );
    }
  }
  updatePixels();
}

void smoke() {
  strokeWeight(1);
  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( random(4) < 1 ) {
        stroke(
          234, 
          100 * noise(float(w)/width, float(h)/height), 
          30 * noise(3*float(w)/width, 3*float(h)/height), 
          random(80, 200)
        );
        point(w, h);
      }
    }
  }
}

void bricks() {
  final color[] cs = {
    color(218, 205, 139), 
    color(174, 154, 107), 
    color( 92, 118, 100), 
    color(  0, 126, 118), 
    color(248, 246, 222), 
    color(230, 224, 196), 
    color( 85, 125,  62), 
    color( 73,  49,  60), 
    color(235,  92,  50)
  };
  float dw = 0, dh = 0;
  strokeWeight(1);
  for ( float h = 0; h < height; h += dh ) {
    dh = random(0.005, 0.010) * height;
    for ( float w = 0; w < width; w += dw ) {
      stroke(cs[int(random(cs.length))], random(60, 120));
      fill(cs[int(random(cs.length))], random(10, 30));
      dw = random(0.01, 0.05) * width;
      rect(w, h, dw, dh);
    }
  }
}

void flower() {
  float x, y, r = 80;
  for ( float t = 0; t < 16*TWO_PI; t += PI/20 ) {
    x = 120 + r * cos(t);
    y = 120 + r * sin(t);
    noisebezier(x, y, x+random(-180, 180), y+random(-180, 180));
    r += random(0.8, 1.2);
  }
}

void noisebezier(float sx, float sy, float ex, float ey) {
  final color[] cs = {
    color(  0, 165, 213), 
    color( 89, 195, 225), 
    color(161, 216, 225), 
    color(161, 216, 225), 
    color( 76, 187, 180), 
    color(134, 202, 182), 
    color(230, 229, 215), 
    color( 91, 164, 105), 
    color(250, 238, 222), 
    color(247, 242, 244), 
    color(242,  79,  20)
  };
  float cx, cy, dx, dy;
  noiseSeed(int(random(1024)));
  stroke(cs[int(random(cs.length))], random(120, 240));
  noFill();
  cx = (sx + ex) / 3;
  cy = (sy + ey) / 3;
  dx = 2 * (sx + ex) / 3;
  dy = 2 * (sy + ey) / 3;
  for ( int i = 0; i < 80; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    cx += 40 * (noise(cx) - 0.5);
    cy += 40 * (noise(cy) - 0.5);
    dx += 40 * (noise(dx) - 0.5);
    dy += 40 * (noise(dy) - 0.5);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("328.png"); 
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
