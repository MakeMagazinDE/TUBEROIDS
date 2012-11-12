#include <stdlib.h>
#include <stdio.h>
#include <math.h>

void MakeScale(char *name, float r, float len1, float len2, float len3);
void MakeSimplePtr(char *name, float r1);
void MakeTriangPtr(char *name, float r1, float r2);
void MakeNum(char *name, int x, int y, int height, int width, int val, int term);

int main(void) {
  int i;
  char str_buf[256];

  printf("\n");
  printf(";               **********************************************\n");
  printf(";               *** Daten für Anzeige\n");
  printf(";               **********************************************\n");
  printf("\n");

  MakeNum("ScaleData:",128- 9,    35,3,3, 1,0);
  MakeNum(NULL        ,128+ 9,    35,3,3, 2,0);
  MakeNum(NULL        ,128   ,256-35,3,3, 6,0);
  MakeNum(NULL        ,255-35,128   ,3,3, 3,0);
  MakeNum(NULL        ,    35,128   ,3,3, 9,0);
  printf("\n");
  MakeNum(NULL,128-18,180,2,2,10,0);
  MakeNum(NULL,128+18,180,2,2,10,0);
  printf("\n");
  MakeScale(NULL,126,5,10,20);

  MakeSimplePtr("SecPtrData:",102);
  MakeTriangPtr("MinPtrData:",102,10);
  MakeTriangPtr("HrPtrData:",60,10);

  printf("NumSecOnes:     .dw NumSecOnes0,NumSecOnes1,NumSecOnes2,NumSecOnes3,NumSecOnes4\n");
  printf("                .dw NumSecOnes5,NumSecOnes6,NumSecOnes7,NumSecOnes8,NumSecOnes9\n");
  for (i=0; i<=9; i++) {
    snprintf(str_buf,sizeof(str_buf),"NumSecOnes%d:",i);
    MakeNum(str_buf,128+42,180,2,2,i,255);
  }
  printf("\n");
  printf("NumSecTens:     .dw NumSecTens0,NumSecTens1,NumSecTens2,NumSecTens3,NumSecTens4,NumSecTens5\n");
  for (i=0; i<=5; i++) {
    snprintf(str_buf,sizeof(str_buf),"NumSecTens%d:",i);
    MakeNum(str_buf,128+30,180,2,2,i,255);
  }
  printf("\n");
  printf("NumMinOnes:     .dw NumMinOnes0,NumMinOnes1,NumMinOnes2,NumMinOnes3,NumMinOnes4\n");
  printf("                .dw NumMinOnes5,NumMinOnes6,NumMinOnes7,NumMinOnes8,NumMinOnes9\n");
  for (i=0; i<=9; i++) {
    snprintf(str_buf,sizeof(str_buf),"NumMinOnes%d:",i);
    MakeNum(str_buf,128+ 6,180,2,2,i,255);
  }
  printf("\n");
  printf("NumMinTens:     .dw NumMinTens0,NumMinTens1,NumMinTens2,NumMinTens3,NumMinTens4,NumMinTens5\n");
  for (i=0; i<=5; i++) {
    snprintf(str_buf,sizeof(str_buf),"NumMinTens%d:",i);
    MakeNum(str_buf,128- 6,180,2,2,i,255);
  }
  printf("\n");
  printf("NumHrOnes:      .dw NumHrOnes0,NumHrOnes1,NumHrOnes2,NumHrOnes3,NumHrOnes4\n");
  printf("                .dw NumHrOnes5,NumHrOnes6,NumHrOnes7,NumHrOnes8,NumHrOnes9\n");
  for (i=0; i<=9; i++) {
    snprintf(str_buf,sizeof(str_buf),"NumHrOnes%d:",i);
    MakeNum(str_buf,128-30,180,2,2,i,255);
  }
  printf("\n");
  printf("NumHrTens:      .dw NumHrTens0,NumHrTens1,NumHrTens2\n");
  for (i=0; i<=2; i++) {
      snprintf(str_buf,sizeof(str_buf),"NumHrTens%d:",i);
      MakeNum(str_buf,128-42,180,2,2,i,255);
  }
  printf("\n");
  printf("DCFStats:      .dw DCFStat0,DCFStat1,DCFStat2\n");
  for (i=0; i<=2; i++) {
      snprintf(str_buf,sizeof(str_buf),"DCFStat%d:",i);
      MakeNum(str_buf,128,76,3,3,i+11,255);
  }
  printf("\n");

  return 0;
}

void MakeScale(char *name, float r, float len1, float len2, float len3) {
  int min;
  float r2;
  float a;
  int x1;
  int y1;
  int x2;
  int y2;
  int i;

  i=0;
  for(min=0; min<60; min=min+1) {

    a=((float)(min*6))/180*M_PI;

    r2=r;
    if ((min % 15) == 0) {
      r2=r2-len3;
    } else if ((min % 5) == 0) {
      r2=r2-len2;
    } else {
      r2=r2-len1;
    }

    x1=(int)(128+sin(a)*r);
    y1=(int)(128-cos(a)*r);
    x2=(int)(128+sin(a)*r2);
    y2=(int)(128-cos(a)*r2);

    if (i == 0) {
      if ((min == 0) && (name != NULL)) {
        printf("%-15s .db ",name);
      } else {
        printf("                .db ");
      }
    } else {
      printf(",");
    }

    printf("%3.3d,%3.3d,%3.3d,%3.3d",x1,y1,x2,y2);

    if (min == 59) {
      printf(",255");
    } else {
      printf(",000");
    }

    if ((i++) == 3) {
      printf("\n");
      i=0;
    }
  }
  printf("\n");
}

void MakeSimplePtr(char *name, float r1) {
  int min;
  int len;
  float a;
  int x;
  int y;
  int i;

  i=0;
  for(min=0; min<60; min=min+1) {


    a=((float)(min*6))/180*M_PI;

    x=(int)(128+sin(a)*r1);
    y=(int)(128-cos(a)*r1);

    if (i == 0) {
      if ((min == 0) && (name != NULL)) {
        printf("%-15s .db ",name);
      } else {
        printf("                .db ");
      }
    } else {
      printf(",");
    }

    printf("%3.3d,%3.3d,128,128,255",x,y);

    if ((i++) == 3) {
      printf("\n");
      i=0;
    }
  }
  printf("\n");
}

void MakeTriangPtr(char *name, float r1, float r2) {
  int min;
  int len;
  float a;
  int x1;
  int y1;
  int x2;
  int y2;
  int x3;
  int y3;
  int i;

  i=0;
  for(min=0; min<60; min=min+1) {

    a=((float)(min*6))/180*M_PI;

    x1=(int)(128+sin(a+(M_PI/2))*r2);
    y1=(int)(128-cos(a+(M_PI/2))*r2);
    x2=(int)(128+sin(a)*r1);
    y2=(int)(128-cos(a)*r1);
    x3=(int)(128+sin(a-(M_PI/2))*r2);
    y3=(int)(128-cos(a-(M_PI/2))*r2);

    if (i == 0) {
      if ((min == 0) && (name != NULL)) {
        printf("%-15s .db ",name);
      } else {
        printf("                .db ");
      }
    } else {
      printf(",");
    }

    printf("%3.3d,%3.3d,%3.3d,%3.3d,%3.3d,%3.3d,%3.3d,%3.3d,255",x1,y1,x2,y2,x3,y3,x1,y1);

    if ((i++) == 1) {
      printf("\n");
      i=0;
    }
  }
  printf("\n");
}

void MakeNum(char *name, int x, int y, int height, int width, int val, int term) {
  int i;
  int n;
  int c1[]={-1,-1,1,-3,1,3,255};
  int c2[]={-2,-2,-1,-3,1,-3,2,-2,2,-1,-2,3,2,3,255};
  int c3[]={-2,-2,-1,-3,1,-3,2,-2,2,-1,1,0,2,1,2,2,1,3,-1,3,-2,2,-255,-1,0,1,0,255};
  int c4[]={2,0,-2,0,1,-3,1,3,255};
  int c5[]={2,-3,-2,-3,-2,1,-1,0,1,0,2,1,2,2,1,3,-1,3,-2,2,255};
  int c6[]={2,-2,1,-3,-1,-3,-2,-2,-2,2,-1,3,1,3,2,2,2,1,1,0,-1,0,-2,1,255};
  int c7[]={-2,-3,2,-3,2,-2,0,0,0,3,255};
  int c8[]={-1,0,-2,-1,-2,-2,-1,-3,1,-3,2,-2,2,-1,1,0,-1,0,-2,1,-2,2,-1,3,1,3,2,2,2,1,1,0,255};
  int c9[]={-2,2,-1,3,1,3,2,2,2,-2,1,-3,-1,-3,-2,-2,-2,-1,-1,0,1,0,2,-1,255};
  int c0[]={-2,-2,-1,-3,1,-3,2,-2,2,2,1,3,-1,3,-2,2,-2,-2,255};
  int cDP[]={-1,-1,-1,-2,1,-2,1,-1,-1,-1,-255,-1,1,-1,2,1,2,1,1,-1,1,255};
  int cSW[]={-2,0,-1,-1,1,1,2,0,255};
  int cDF[]={-1,2,0,-2,1,2,-1,2,255};
  int cDO[]={-1,2,0,-2,1,2,-1,2,-255,-1,0,-2,-1,-2,-2,-1,-3,1,-3,2,-2,2,-1,1,0,255};
  int *c[]={c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,cDP,cSW,cDF,cDO};
  int cx;
  int cy;

  if (val>13) return;

  if (name != NULL) {
    printf("%-15s .db ",name);
  } else {
    printf("                .db ");
  }

  i=0;
  n=0;
  while ((cx = c[val][i]) != 255) {
    i++;
    if (cx == -255) {
      printf("000");
      n=n+1;
    } else {
      cy=c[val][i];
      i++;

      cx=(cx*width)+x;
      if (cx<1)   cx=1;
      if (cx>254) cx=254;
      cy=(cy*height)+y;
      if (cy<1)   cy=1;
      if (cy>254) cy=254;

      printf("%3.3d,%3.3d",cx,cy);
      n=n+2;
    }

    if (n >= 18) {
      n=0;
      printf("\n                .db ");
    } else {
      printf(",");
    }
  }
  printf("%3.3d\n",term);

}
