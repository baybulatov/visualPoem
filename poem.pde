import processing.svg.*;
color darkBlue = #000000;

String[] textLines;
void setup() {
  size(400, 800);
  smooth();
  textLines = loadStrings("pushkin.txt");
  noLoop();
  beginRecord(SVG, "output.svg");
}


float lineSpacing = 150; // distance between lines
float wordSpacing = 20; // distance between words

void draw() {
  background(255);
  translate(60, 60);
  noStroke();
  for (int i = 0; i < textLines.length; i++) {
    String[] words = split(textLines[i], ' ');
    float x = 0; // initial x-coordinate
    for (int j = 0; j < words.length; j++) {
      float d = words[j].length()*4;
      float r = d / 2; // calculate the radius of the ellipse
      fill(0);
      ellipse(x + r, i * 50, d, d);
      x = x + r + wordSpacing + r; // update the x-coordinate for the next ellipse
      println(j + ". " + words[j]);
    }
  }
  endRecord();
}


void keyPressed() {
  if (key == 's') {
    save("output.png"); // save the image with the default size
  }
  if (key == 'a') {
    scale(6); // scale up the image by a factor of 6
    save("output_large.svg"); // save the large image
  }
}
