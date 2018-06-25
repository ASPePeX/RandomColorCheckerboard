int xSplits;
int ySplits;
int borderThickness;
int shots;
color[] colors;
int shotCounter;
float squareWidth;
float squareHeight;
String randomBatchName;

void setup() {

  size(1024, 1024);

  xSplits = 12;
  ySplits = 12;

  borderThickness = 10;

  shots = 5;

  colors = new color[] {
    color(0, 0, 0), 
    color(255, 0, 0), 
    color(0, 255, 0), 
    color(0, 0, 255), 
    color(255, 255, 0), 
    color(0, 255, 255), 
    color(255, 0, 255), 
    color(255, 255, 255)
  };

  //Only madness and despair past his line ...

  shotCounter = 0;
  
  randomBatchName = str((int)random(10000000,99999999));
  
  squareWidth = width / xSplits;
  squareHeight = height / ySplits;

  strokeJoin(MITER);
}

void draw() {
  if (shotCounter < shots)
  {
    DrawSquares();
    SaveAndClear();
    shotCounter++;
  } else
  {
    exit();
  }
}

void DrawSquares() {
  for (int i = 0; i < ySplits; i++)
  {
    for (int j = 0; j < xSplits; j++)
    {
      strokeWeight(borderThickness);
      fill(colors[int(random(colors.length))]);
      rect(j * squareWidth, i * squareHeight, squareWidth, squareHeight);
    }
  }
}

void SaveAndClear() {
  String filename = "marker-"+ randomBatchName + "-" + nf(shotCounter, 3) + ".png";

  PImage img = get();
  clear();
  img.save(savePath(filename));
}
