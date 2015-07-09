int size = 20;
int barWidth = 40, barPadding = 10, partPadding = 40;
int maxElm = 100;
float heightFactor = 4;
float[] elmts = new float[100];
float maxY = maxElm * heightFactor + barPadding;
int i = -1, j=0;
float min,temp;
void setup() {
  size(
    barWidth * size + barPadding * (size + 1) + partPadding,
    int(maxElm * heightFactor) + barPadding * 2);
  noStroke();
  background(255);
  fill(144, 192, 255);
  for (int k = 0; k < size; ++k) {
    rect(
      barWidth * k + barPadding * (k + 1) + partPadding, maxY - elmts[k] * heightFactor,
      barWidth, elmts[k] * heightFactor);
  }
  for (int i = 0; i < size; i++)
      elmts[i] = random(0,100);
}

void draw() {
    if ((j == size) && (i < size - 1)) {
      i++;
      j=i+1;
      min = elmts[i];
    }
 
    if (j < size) {
        if (elmts[j] < min){
          min = elmts[j];
          temp = elmts[i];
          elmts[i] = elmts[j];
          elmts[j] = temp;
        }
        j++;
      }
   fill(#EA5353);
   for (int k = 0; k < size; ++k) {
       rect(barWidth * k + barPadding * (k + 1) + partPadding, maxY - elmts[k] * heightFactor, barWidth, elmts[k] * heightFactor);
   }
}


