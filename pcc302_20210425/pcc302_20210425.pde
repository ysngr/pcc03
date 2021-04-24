/* 302_20210425 */

final color bgc = color(0);


void setup() {
  size(1150, 800);
  noLoop();
  imageMode(CENTER);
  noiseSeed(0);
}


void draw() {
  background(bgc);
  image(loadImage("icon.png"), width/2, height/2, height, height);
  thunder();
}


void thunder() {

  color c;
  int n;
  float x, y, a, t;

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      if ( random(160) < 1 && (c = get((int)w, (int)h)) != bgc ) {
        n = (int)random(80, 240);
        x = w;
        y = h;
        a = 20 * noise(10*x/width, 10*h/height);
        stroke(c);
        for ( int i = 0; i < n; i++ ) {
          point(x, y);
          a += 0.001;
          t = a * noise(10*x/width, 10*y/height);
          x += cos(t);
          y += sin(t);
        }
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("302.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
