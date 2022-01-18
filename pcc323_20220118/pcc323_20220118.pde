/* 323_20220118 */

Boolean[][] blocks;  // true = wall, false = path
float blockWidth, blockHeight;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  initialize(99, 149);
  generate();
  drawBlocks();
}

void initialize(int row, int column) {
  final int MIN_BLOCK_NUM_ROW = 5, MIN_BLOCK_NUM_COLUMN = 5;
  final float MIN_BLOCK_LEN = 5;

  assert row % 2 == 1 && column % 2 == 1;
  assert row >= MIN_BLOCK_NUM_ROW && column >= MIN_BLOCK_NUM_COLUMN;
  blocks = new Boolean[row][column];
  blockWidth = width / float(column);
  blockHeight = height / float(row);
  assert blockWidth >= MIN_BLOCK_LEN && blockHeight >= MIN_BLOCK_LEN;

  // initialize 
  for ( int r = 0; r < blocks.length; r++ ) {
    for ( int c = 0; c < blocks[r].length; c++ ) {
      blocks[r][c] = false;  // path
    }
  }
  // vertical wall
  for ( int r = 0; r < blocks.length; r++ ) {
    blocks[r][0] = blocks[r][blocks[r].length-1] = true;
  }
  // horizontal wall
  for ( int c = 0; c < blocks[0].length; c++ ) {
    blocks[0][c] = blocks[blocks.length-1][c] = true;
  }
  // inner wall
  for ( int r = 0; r < blocks.length; r+=2 ) {
    for ( int c = 0; c < blocks[r].length; c+=2 ) {
      blocks[r][c] = true;
    }
  }
}

void generate() {
  final int[][] i2d = {{-1, 0}, {0, -1}, {0, 1}, {1, 0}};
  int m, i, dr, dc;
  for ( int r = 2; r < blocks.length-2; r+= 2 ) {
    for ( int c = 2; c < blocks[r].length-2; c+=2 ) {
      do {
        m = ( r == 2 )? 0 : 1;
        i = int(random(m, 4));
        dr = i2d[i][0];
        dc = i2d[i][1];
      } while ( blocks[r+dr][c+dc] );
      blocks[r+dr][c+dc] = true;
    }
  }
}

void drawBlocks() {
  noiseSeed(int(random(2048)));
  noStroke();
  for ( int r = 0; r < blocks.length; r++ ) {
    for ( int c = 0; c < blocks[r].length; c++ ) {
      if ( blocks[r][c] ) {
        fill(
          255 * noise(10*float(c)/width, 30*float(r)/height), 
          255 * noise(20*float(r)/height, 20*float(c)/width), 
          255 * noise(30*float(c)/width, 10*float(r)/height)
        );
        rect(c*blockWidth, r*blockHeight, blockWidth, blockHeight);
      }
    }
  }
}


void keyPressed() {
  if ( key == 'r' ) {
    redraw();
  } else if ( key == 's' ) {
    saveFrame("323.png");
    exit();
  }
}
