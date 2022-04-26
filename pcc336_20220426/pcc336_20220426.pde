/* 336_20220426 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  kakutsunagiPlane(120);
}

void kakutsunagiPlane(float l) {
  ajust(l);
  for ( int r = 0; r < height/l+1; r++ ) {
    for ( int c = 0; c < width/l+1; c++ ) {
      kakutsunagiBlock(c*l, r*l, l);
    }
  }
}

void ajust(float l) {
  float widthGutter = (l * (floor(width/l) + 1) - width) / 2;
  float heightGutter = (l * (floor(height/l) + 1) - height) / 2;
  translate(-widthGutter, -heightGutter);
}

void kakutsunagiBlock(float x, float y, float l, color lc, color bc) {
  final float GUTTER = l / 16;
  final float LINEWIDTH = l / 8;
  final float e = 1;

  pushMatrix();
  translate(x, y);

  noStroke();
  fill(lc);
  rect(GUTTER, GUTTER, LINEWIDTH, 7*LINEWIDTH);  // left
  rect(GUTTER, GUTTER, 7*LINEWIDTH, LINEWIDTH);  // upper
  rect(l-GUTTER-LINEWIDTH, GUTTER, LINEWIDTH, 7*LINEWIDTH);  // right
  rect(GUTTER, l-GUTTER-LINEWIDTH, 7*LINEWIDTH, LINEWIDTH);  // bottom

  rect(0, GUTTER+2*LINEWIDTH, GUTTER+3*LINEWIDTH, LINEWIDTH);  // left upper horizontal
  rect(GUTTER+2*LINEWIDTH, 0, LINEWIDTH, GUTTER+3*LINEWIDTH);  // left upper vertical
  rect(GUTTER+4*LINEWIDTH, GUTTER+2*LINEWIDTH, GUTTER+3*LINEWIDTH, LINEWIDTH);  // right upper horizontal
  rect(GUTTER+4*LINEWIDTH, 0, LINEWIDTH, GUTTER+3*LINEWIDTH);  // right upper vertical
  rect(GUTTER+4*LINEWIDTH, GUTTER+4*LINEWIDTH, GUTTER+3*LINEWIDTH, LINEWIDTH);  // right bottom horizontal
  rect(GUTTER+4*LINEWIDTH, GUTTER+4*LINEWIDTH, LINEWIDTH, GUTTER+3*LINEWIDTH);  // right bottom vertical
  rect(0, GUTTER+4*LINEWIDTH, GUTTER+3*LINEWIDTH, LINEWIDTH);  // left bottom horizontal
  rect(GUTTER+2*LINEWIDTH, GUTTER+4*LINEWIDTH, LINEWIDTH, GUTTER+3*LINEWIDTH);  // left upper vertical

  stroke(bc);
  line(GUTTER-e, GUTTER+2*LINEWIDTH, GUTTER-e, GUTTER+3*LINEWIDTH);  // left upper outer
  line(GUTTER+LINEWIDTH+e, GUTTER+2*LINEWIDTH, GUTTER+LINEWIDTH+e, GUTTER+3*LINEWIDTH);  // left upper inner
  line(GUTTER+2*LINEWIDTH-e, GUTTER, GUTTER+2*LINEWIDTH-e, GUTTER+LINEWIDTH);  // upper left left
  line(GUTTER+3*LINEWIDTH+e, GUTTER, GUTTER+3*LINEWIDTH+e, GUTTER+LINEWIDTH);  // upper left right
  line(GUTTER+4*LINEWIDTH, GUTTER-e, GUTTER+5*LINEWIDTH, GUTTER-e);  // upper right outer
  line(GUTTER+4*LINEWIDTH, GUTTER+LINEWIDTH+e, GUTTER+5*LINEWIDTH, GUTTER+LINEWIDTH+e);  // upper right inner
  line(GUTTER+6*LINEWIDTH, GUTTER+2*LINEWIDTH-e, GUTTER+7*LINEWIDTH, GUTTER+2*LINEWIDTH-e);  // right upper upper
  line(GUTTER+6*LINEWIDTH, GUTTER+3*LINEWIDTH+e, GUTTER+7*LINEWIDTH, GUTTER+3*LINEWIDTH+e);  // right upper bottom
  line(GUTTER+6*LINEWIDTH-e, GUTTER+4*LINEWIDTH, GUTTER+6*LINEWIDTH-e, GUTTER+5*LINEWIDTH);  // right bottom inner
  line(GUTTER+7*LINEWIDTH+e, GUTTER+4*LINEWIDTH, GUTTER+7*LINEWIDTH+e, GUTTER+5*LINEWIDTH);  // right bottom outer
  line(GUTTER+4*LINEWIDTH-e, GUTTER+6*LINEWIDTH, GUTTER+4*LINEWIDTH-e, GUTTER+7*LINEWIDTH);  // bottom right left
  line(GUTTER+5*LINEWIDTH+e, GUTTER+6*LINEWIDTH, GUTTER+5*LINEWIDTH+e, GUTTER+7*LINEWIDTH);  // bottom right left
  line(GUTTER+2*LINEWIDTH, GUTTER+6*LINEWIDTH-e, GUTTER+3*LINEWIDTH, GUTTER+6*LINEWIDTH-e);  // bottom left inner
  line(GUTTER+2*LINEWIDTH, GUTTER+7*LINEWIDTH+e, GUTTER+3*LINEWIDTH, GUTTER+7*LINEWIDTH+e);  // bottom left outer
  line(GUTTER, GUTTER+4*LINEWIDTH-e, GUTTER+LINEWIDTH, GUTTER+4*LINEWIDTH-e);  // left bottom upper
  line(GUTTER, GUTTER+5*LINEWIDTH+e, GUTTER+LINEWIDTH, GUTTER+5*LINEWIDTH+e);  // left bottom bottom
  popMatrix();
}
void kakutsunagiBlock(float x, float y, float l) {
  kakutsunagiBlock(x, y, l, color(30), color(240));
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("336.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
