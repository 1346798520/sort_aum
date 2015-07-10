int size = 10, bw = 40, bhmax = 300;
float[] bh = new float[100];//{10,42,4,34,51,24,14,56,39,45};
int i = 0, j = 0, temp = 0, dly=30;
float min;

void setup() { 
    size((bw + 5)* size + 60, bhmax + 30);
    background(0);
    noStroke();
    for(int i = 0; i < size; i++) {
        bh[i]=random(1,bhmax);
        fill(144,196,255); //Blue---origin
        rect((bw + 7) * i + 50, bhmax - bh[i]+ 30, bw, bh[i]*2);
    }
    min = bh[0];
    fill(255,0,0);
    rect((bw + 7) * j + 50, bhmax - bh[j]+ 30, bw, bh[j]*2);
}

void draw() {
    if(i < size - 1) {
        if(j < size - 1) {
            if(j != temp && j != i - 1) {
                fill(144,196,255);
                rect((bw + 7) * j + 50, bhmax - bh[j]+ 30, bw, bh[j]*2);
            }
            if(j == i-1) {
                fill(144,196,255);
                rect((bw + 7) * (size - 1) + 50, bhmax - bh[size - 1]+ 30, bw, bh[size - 1]*2);
            }                        
            j++;
            fill(255,192,192);//pink---now
            rect((bw + 7) * j + 50, bhmax - bh[j]+ 30, bw, bh[j]*2);
            delay(dly);
            print(i,j,"\n");
            if(bh[j] < min) {
                fill(144,196,255);
                rect((bw + 7) * temp + 50, bhmax - bh[temp]+ 30, bw, bh[temp]*2);
                temp = j;
                min = bh[j];
                fill(255,0,0);//red--min
                rect((bw + 7) * j + 50, bhmax - bh[j]+ 30, bw, bh[j]*2);
                delay(dly);
            }   
        }
        else {
            if(temp != i) {             
                bh[temp] = bh[i];
                bh[i] = min;
                background(0);
                for(int k = 0; k < size; k++) {
                    if( k <= i) fill(255,0,255);
                    else fill(144,196,255);
                    rect((bw + 7) * k + 50, bhmax - bh[k]+ 30, bw, bh[k]*2);
                }
                fill(255,0,255);//purple---ok
                rect((bw + 7) * i + 50, bhmax - bh[i]+ 30, bw, bh[i]*2);
                delay(dly);
                i++;
                temp = i;
                min = bh[i];   
                j = i-1;             
            }
            else {
               fill(255,0,255);
                rect((bw + 7) * i + 50, bhmax - bh[i]+ 30, bw, bh[i]*2);
                delay(dly);
                  i++;
                  j = i-1;
                  min = bh[i];
                  temp = i;
            }
        }
    }
    else {
        fill(255,0,255);
        rect((bw + 7) * i + 50, bhmax - bh[i]+ 30, bw, bh[i]*2);
    }
}
