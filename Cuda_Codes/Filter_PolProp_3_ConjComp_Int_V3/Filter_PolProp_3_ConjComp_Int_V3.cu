#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <sstream>
#include <array>
#include <fstream>
//#include<bits/stdc++.h>

#include "input.h"

__global__ void srccomb(long int *nvert, int *Avert1, int *Avert2, int *Avert3, int *Avert4, 
int *Avert5, int *Avert6, int *Avert7, int *Avert8, int *Avert9, int *Avert10, int *Avert11, 
int *Avert12, int *Avert13, int *Avert14, int *Avert15, int *Avert16, int *Temp1, int *Temp2,
int *Temp3, int *Temp4, int *Temp5, int *Temp6, int *Temp7, int *Temp8, int *Temp9, int *Temp10,
int *Temp11, int *Temp12, int *Temp13, int *Temp14, int *Temp15, int *Temp16, long int *Repeat);  

__host__ __device__ long int mod(long aa, int bb) {
	long int cc;
	cc = aa - floor(aa*1.0/bb)*bb;
	
	return cc;
};

__host__ __device__ long power(long aa, int bb){
	long cc = aa;
	int nn;
	if (bb != 0 ){
      		for (nn = bb; nn >1; nn--) cc*=aa;
   	} else {
      		cc = 1;
   	}
   	return cc;
}

__host__ __device__ int factorial(int nn) {

	int fact = 1;
	int i;

	for(i = 1; i <= nn; i++) {
		fact *= i;
	}

	return fact;

};

__host__ int exists(const char *fname)
{
    FILE *file;
    if ((file = fopen(fname, "r")))
    {
        fclose(file);
        return 1;
    }
    return 0;
}

// define other functions here, if necessary

int main (){

	using namespace std;

	int AcccVertices[8][2][S];
	int AcccTemp[8][2][S];
	int Temp[8][2][54];
	int Test[8][2];

	long int nS;

	
	array<array<array<int,2>,8>,S> Accombcomp;

	// max_grid unequal to 1, for the parallelization of the calculus
	int max_grid = max_block;

	// setting for the reduction kernel
	unsigned max_share = max_thread * sizeof(int);	

	long int s, t, u, v, i, j, k; 

	ostringstream auxstrIn;
	ostringstream auxstrOut;

	ostringstream auxpathIn;
	ostringstream auxpathOut;
	
	string strIn;
	string strOut;

	string pathIn;
	string pathOut;

	auxpathIn << "In_Comb_ConjComp_Vertices_" << T+45 << ".h";
	pathIn = auxpathIn.str();
	auxpathOut << "Out_Comb_ConjComp_Vertices_" << T+45 << ".m";
	pathOut = auxpathOut.str();	

	const char *filepathIn;
	const char *filepathOut;

	filepathIn = pathIn.c_str();
	filepathOut = pathOut.c_str();

	bool IfRepeat;
	long int Repeat[max_grid];
	long int *dev_Repeat;
	long int Nrepeat;

	int i1, j1;
	int i2, j2;
	int i3, j3;
	int i4, j4;
	int i5, j5;
	int i6, j6;
	int i7, j7;
	int i8, j8;
	int i9, j9;
	int i10, j10;
	int i11, j11;
	int i12, j12;

	int t1, t2;

	long int aux_repeat[54];
	long int nvert[1];
	int IfTemp[54][8];
	long int *dev_nvert;

	int Temp1[54];
	int Temp2[54];
	int Temp3[54];
	int Temp4[54];
	int Temp5[54];
	int Temp6[54];
	int Temp7[54];
	int Temp8[54];
	int Temp9[54];
	int Temp10[54];
	int Temp11[54];
	int Temp12[54];
	int Temp13[54];
	int Temp14[54];
	int Temp15[54];
	int Temp16[54];

	int Avert1[S];
	int Avert2[S];
	int Avert3[S];
	int Avert4[S];
	int Avert5[S];
	int Avert6[S];
	int Avert7[S];
	int Avert8[S];
	int Avert9[S];
	int Avert10[S];
	int Avert11[S];
	int Avert12[S];
	int Avert13[S];
	int Avert14[S];
	int Avert15[S];
	int Avert16[S];

	int *dev_Avert1;
	int *dev_Avert2;
	int *dev_Avert3;
	int *dev_Avert4;
	int *dev_Avert5;
	int *dev_Avert6;
	int *dev_Avert7;
	int *dev_Avert8;
	int *dev_Avert9;
	int *dev_Avert10;
	int *dev_Avert11;
	int *dev_Avert12;
	int *dev_Avert13;
	int *dev_Avert14;
	int *dev_Avert15;
	int *dev_Avert16;

	int *dev_Temp1;
	int *dev_Temp2;
	int *dev_Temp3;
	int *dev_Temp4;
	int *dev_Temp5;
	int *dev_Temp6;
	int *dev_Temp7;
	int *dev_Temp8;
	int *dev_Temp9;
	int *dev_Temp10;
	int *dev_Temp11;
	int *dev_Temp12;
	int *dev_Temp13;
	int *dev_Temp14;
	int *dev_Temp15;
	int *dev_Temp16;

	//#include "In_Comb_ConjComp_Vertices_0.h"
	#include "In_Comb_ConjComp_Vertices_p1_0.h"
	//#include "In_Comb_ConjComp_Vertices_p2_0.h"
	//#include "In_Comb_ConjComp_Vertices_p3_0.h"


	for(t=0; t<=44; t++){

		printf("Iteration %d started.\n",t+1);

		if(t == 0){
			nS = S;
			for(u=0; u<=nS-1; u++){
				for(i=0; i<=7; i++){
					for(j=0; j<=1; j++){
						AcccTemp[i][j][u] = Accombcomp[u][i][j];
					};
				};
			};
		}else{
			nS = s;
			for(u=0; u<=nS-1; u++){
				for(i=0; i<=7; i++){
					for(j=0; j<=1; j++){
						AcccTemp[i][j][u] = AcccVertices[i][j][u];
					};
				};
			};
		};

	
  		s = 1;
  		AcccVertices[0][0][0] = AcccTemp[0][0][0];
  		AcccVertices[0][1][0] = AcccTemp[0][1][0];
  		AcccVertices[1][0][0] = AcccTemp[1][0][0];
  		AcccVertices[1][1][0] = AcccTemp[1][1][0];
  		AcccVertices[2][0][0] = AcccTemp[2][0][0];
  		AcccVertices[2][1][0] = AcccTemp[2][1][0];
  		AcccVertices[3][0][0] = AcccTemp[3][0][0];
  		AcccVertices[3][1][0] = AcccTemp[3][1][0];
  		AcccVertices[4][0][0] = AcccTemp[4][0][0];
  		AcccVertices[4][1][0] = AcccTemp[4][1][0];
  		AcccVertices[5][0][0] = AcccTemp[5][0][0];
  		AcccVertices[5][1][0] = AcccTemp[5][1][0];
  		AcccVertices[6][0][0] = AcccTemp[6][0][0];
  		AcccVertices[6][1][0] = AcccTemp[6][1][0];
  		AcccVertices[7][0][0] = AcccTemp[7][0][0];
  		AcccVertices[7][1][0] = AcccTemp[7][1][0];

  		for(u = 1; u <= nS-1; u++){
   
   			for(i = 0; i <= 7; i++){
				for(j = 0; j <= 1; j++){
     					if(AcccTemp[i][j][u] == 1){
						i1 = i;
						j1 = j;
					};
     					if(AcccTemp[i][j][u] == 2){
						i2 = i;
						j2 = j;
					};
     					if(AcccTemp[i][j][u] == 3){
						i3 = i;
						j3 = j;
					};
     					if(AcccTemp[i][j][u] == 4){
						i4 = i;
						j4 = j;
					};
     					if(AcccTemp[i][j][u] == 5){
						i5 = i;
						j5 = j;
					};
     					if(AcccTemp[i][j][u] == 6){
						i6 = i;
						j6 = j;
					};
     					if(AcccTemp[i][j][u] == 7){
						i7 = i;
						j7 = j;
					};
     					if(AcccTemp[i][j][u] == 8){
						i8 = i;
						j8 = j;
					};
     					if(AcccTemp[i][j][u] == 9){
						i9 = i;
						j9 = j;
					};
     					if(AcccTemp[i][j][u] == 10){
						i10 = i;
						j10 = j;
					};
     					if(AcccTemp[i][j][u] == 11){
						i11 = i;
						j11 = j;
					};
     					if(AcccTemp[i][j][u] == 12){
						i12 = i;
						j12 = j;
					};
					Test[i][j] = AcccTemp[i][j][u];
 				};
			};
				
			// la permutazione con scambio di tutti gli indici è proibita
   			if(t == 0){ 
    				Test[i1][j1] = 1;
    				Test[i2][j2] = 2;
    				Test[i3][j3] = 3;
    				Test[i4][j4] = 4;
    				Test[i5][j5] = 5;
    				Test[i6][j6] = 6;
    				Test[i7][j7] = 7;
    				Test[i8][j8] = 8;
    				Test[i9][j9] = 9;
    				Test[i10][j10] = 10;
    				Test[i11][j11] = 11;
    				Test[i12][j12] = 12;
			}else if(t == 1){
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
			}else if(t == 2){
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
			}else if(t == 3){
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 8;
   				Test[i4][j4] = 7;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
			}else if(t == 4){
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
			}else if(t == 5){
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
			}else if(t == 6){
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
			}else if(t == 7){
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
			}else if(t == 8){
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
			}else if(t == 9){
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
   			}else if(t == 10){
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
   			}else if(t == 11){
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
   			}else if(t == 12){
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
   			}else if(t == 13){     //  Permutazione 123: nessuno scambio fra indici
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 14){  // Permutazione 123: scambi fra vertici 12
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 15){   // Permutazione 123: scambi fra vertici 12
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 16){ // Permutazione 123: scambi fra vertici 12
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 17){ // Permutazione 123: scambi fra vertici 13 
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 18){ // Permutazione 123: scambi fra vertici 13
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
   				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 19){ // Permutazione 123: scambi fra vertici 13 
    				Test[i1][j1] = 5;
   				Test[i2][j2] = 6;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 20){ // Permutazione 123: scambi fra vertici 23
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 21){ // Permutazione 123: scambi fra vertici 23 
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 22){ // Permutazione 123: scambi fra vertici 23
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 23){ // Permutazione 123: scambio (65)(12) e (1112)(34)
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 24){ // Permutazione 123: scambio (65)(12) e (78)(1112)
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 25){ // Permutazione 123: scambio (78)(1112) e (910)(12)
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
    			}else if(t == 26){ // Permutazione 123: scambio (78)(34) e (910)(12)
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 8;
    				Test[i4][j4] = 7;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 27){ // Permutazione 123: scambio (56)(910) e (1112)(34)
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 10;
    				Test[i6][j6] = 9;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 28){ // Permutazione 123: scambi fra vertici 123 con 3 fisso
    				Test[i1][j1] = 6;
    				Test[i2][j2] = 5;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 12;
    				Test[i8][j8] = 11;
    				Test[i9][j9] = 2;
    				Test[i10][j10] = 1;
    				Test[i11][j11] = 4;
    				Test[i12][j12] = 3;
    			}else if(t == 29){ // Permutazione 132: nessuno scambio
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 30){ // Permutazione 132: scambio fra vertici 12
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 31){ // Permutazione 132: scambio fra vertici 12
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 32){  // Permutazione 132: scambio fra vertici 12 
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 33){  // Permutazione 132: scambio fra vertici 13
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 34){ // Permutazione 132: scambio fra vertici 13
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
    			}else if(t == 35){ // Permutazione 132: scambio fra vertici 13
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
    			}else if(t == 36){ // Permutazione 132: scambio fra vertici 23
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 37){ // Permutazione 132: scambio fra vertici 23
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
    			}else if(t == 38){ // Permutazione 132: scambio fra vertici 23
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
   				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
    			}else if(t == 39){ // Permutazione 132: scambio (910)(56) e (34)(78)
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
    			}else if(t == 40){ // Permutazione 132: scambio (910)(56) e (1112)(34)
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 41){ // Permutazione 132: scambio (1112)(34) e (12)(56)
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 42){ // Permutazione 132: scambio (1112)(78) e (12)(65)
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 6;
    				Test[i10][j10] = 5;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
    			}else if(t == 43){ // Permutazione 132: scambio (910)(12) e (1112)(78)
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 12;
    				Test[i4][j4] = 11;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
			}else if(t == 44){ // Permutazione 132: scambio (910)(12) e (34)(78)
    				Test[i1][j1] = 10;
    				Test[i2][j2] = 9;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i5][j5] = 2;
    				Test[i6][j6] = 1;
    				Test[i7][j7] = 4;
    				Test[i8][j8] = 3;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 8;
    				Test[i12][j12] = 7;
    			};


   
   			for(i = 0; i <= 7; i++){
    				for(j = 0; j <= 1; j++){
     					if(Test[i][j] == 1){
						Temp[i][j][0] = 2;
					}else if(Test[i][j] == 2){
						Temp[i][j][0] = 1;
					}else if(Test[i][j] >= 3){ 
						Temp[i][j][0] = Test[i][j];  // permutazione pq
     					};
					if(Test[i][j] == 1){
						Temp[i][j][1] = 2;
					}else if(Test[i][j] == 2){ 
						Temp[i][j][1] = 1;
					}else if(Test[i][j] == 3){
						Temp[i][j][1] = 4;
					}else if(Test[i][j] == 4){
						Temp[i][j][1] = 3;
					}else if(Test[i][j] >= 5){
						Temp[i][j][1] = Test[i][j]; // permutazione pq rs
					};
     					if(Test[i][j] == 3){
						Temp[i][j][2] = 4;
					}else if(Test[i][j] == 4){
						Temp[i][j][2] = 3;
					}else if(Test[i][j] >= 5 || Test[i][j] <=  2){ 
      						Temp[i][j][2] = Test[i][j];  // permutazione rs
					};
     					if(Test[i][j] == 5){
						Temp[i][j][3] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][3] = 5;
     					}else if(Test[i][j] >= 7 || Test[i][j] <=  4){ 
      						Temp[i][j][3] = Test[i][j]; // permutazione tu
     					};
					if(Test[i][j] == 5){
						Temp[i][j][4] = 6;
					}else if(Test[i][j] == 6){
						Temp[i][j][4] = 5;
					}else if(Test[i][j] == 8){
						Temp[i][j][4] = 7;
					}else if(Test[i][j] == 7){ 
						Temp[i][j][4] = 8;
					}else if(Test[i][j] >= 9 || Test[i][j] <= 4){ 
      						Temp[i][j][4] = Test[i][j]; // permutazione tu vw
     					};
					if(Test[i][j] == 8){
						Temp[i][j][5] = 7;
     					}else if(Test[i][j] == 7){ 
						Temp[i][j][5] = 8;
					}else if(Test[i][j] >= 9 || Test[i][j] <=  6){ 
      						Temp[i][j][5] = Test[i][j];   // permutazione vw 
					};
     					if(Test[i][j] == 9){ 
						Temp[i][j][6] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][6] = 9;
     					}else if(Test[i][j] >= 11 || Test[i][j] <=  8){ 
      						Temp[i][j][6] = Test[i][j];   // permutazione kl 
    					};
					if(Test[i][j] == 9){
						Temp[i][j][7] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][7] = 9;
     					}else if(Test[i][j] == 11){ 
						Temp[i][j][7] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][7] = 11;
     					}else if(Test[i][j] >= 13 || Test[i][j] <=  8){ 
      						Temp[i][j][7] = Test[i][j];   // permutazione kl mn 
     					}
					if(Test[i][j] == 11){
						Temp[i][j][8] = 12;
     					}else if(Test[i][j] == 12){ 
						Temp[i][j][8] = 11;
     					}else if(Test[i][j] >= 13 || Test[i][j] <=  10){ 
      						Temp[i][j][8] = Test[i][j];   // permutazione mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][9] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][9] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][9] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][9] = 5;
     					}else if(Test[i][j] >= 7 || (Test[i][j] >= 3 && Test[i][j] <= 4)){
      						Temp[i][j][9] = Test[i][j]; // permutazione pq | tu 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][10] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][10] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][10] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][10] = 5;
     					}else if(Test[i][j] == 8){ 
						Temp[i][j][10] = 7;
     					}else if(Test[i][j] == 7){ 
						Temp[i][j][10] = 8;
     					}else if(Test[i][j] >= 9 || (Test[i][j] >= 3 && Test[i][j] <= 4)){ 
      						Temp[i][j][10] = Test[i][j]; // permutazione pq | tu vw 
     					};
     					if(Test[i][j] == 1){
						Temp[i][j][11] = 2;
     					}else if(Test[i][j] == 2){
			 			Temp[i][j][11] = 1;
     			 		}else if(Test[i][j] == 8){
						Temp[i][j][11] = 7;
     					}else if(Test[i][j] == 7){ 
						Temp[i][j][11] = 8;
					}else if(Test[i][j] >= 9 || (Test[i][j] >= 3 && Test[i][j] <= 6)){
       						Temp[i][j][11] = Test[i][j];   // permutazione pq | vw 
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][12] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][12] = 1;
     					}else if(Test[i][j] == 9){
						Temp[i][j][12] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][12] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 3 && Test[i][j] <= 8)){ 
      						Temp[i][j][12] = Test[i][j]; // permutazione pq | kl 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][13] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][13] = 1;
     					}else if(Test[i][j] == 9){
						Temp[i][j][13] = 10;
     					}else if(Test[i][j] == 10){ 
						Temp[i][j][13] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][13] = 12;
     					}else if(Test[i][j] == 12){ 
						Temp[i][j][13] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 3 && Test[i][j] <= 8)){ 
      						Temp[i][j][13] = Test[i][j]; // permutazione pq | kl mn 
     					};
     					if(Test[i][j] == 1){
						Temp[i][j][14] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][14] = 1;
     					}else if(Test[i][j] == 11){
						Temp[i][j][14] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][14] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 3 && Test[i][j] <= 10)){ 
      						Temp[i][j][14] = Test[i][j]; // permutazione pq | mn 
     					};
					if(Test[i][j] == 1){ 
						Temp[i][j][15] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][15] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][15] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][15] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][15] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][15] = 5;
     					}else if(Test[i][j] >= 7){
						Temp[i][j][15] = Test[i][j]; // permutazione pq rs | tu
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][16] = 2;
     					}else if(Test[i][j] == 2){ 
						Temp[i][j][16] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][16] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][16] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][16] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][16] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][16] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][16] = 7;
     					}else if(Test[i][j] >= 9){
						Temp[i][j][16] = Test[i][j];  // permutazione pq rs | tu vw 
     					};
					if(Test[i][j] == 1){
						Temp[i][j][17] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][17] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][17] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][17] = 3;
     					}else if(Test[i][j] == 8){
						Temp[i][j][17] = 7;
     					}else if(Test[i][j] == 7){
						Temp[i][j][17] = 8;
     					}else if(Test[i][j] >= 9 || (Test[i][j] >= 5 && Test[i][j] <= 6)){ 
      						Temp[i][j][17] = Test[i][j];  // permutazione pq rs | vw 
     					};
     					if(Test[i][j] == 1){
						Temp[i][j][18] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][18] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][18] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][18] = 3;
     					}else if(Test[i][j] == 9){
						Temp[i][j][18] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][18] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 5 && Test[i][j] <= 8)){
      						Temp[i][j][18] = Test[i][j];  // permutazione pq rs | kl 
     					};
     					if(Test[i][j] == 1){
						Temp[i][j][19] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][19] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][19] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][19] = 3;
     					}else if(Test[i][j] == 9){
						Temp[i][j][19] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][19] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][19] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][19] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 8)){ 
      						Temp[i][j][19] = Test[i][j];  // permutazione pq rs | kl mn 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][20] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][20] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][20] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][20] = 3;
     					}else if(Test[i][j] == 11){
						Temp[i][j][20] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][20] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 10)){ 
      						Temp[i][j][20] = Test[i][j];  // permutazione pq rs | mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][21] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][21] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][21] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][21] = 5;
     					}else if(Test[i][j] >= 7 || Test[i][j] <= 2){ 
      						Temp[i][j][21] = Test[i][j];  // permutazione rs | tu
					};
     					if(Test[i][j] == 3){
						Temp[i][j][22] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][22] = 3;
     					}else if(Test[i][j] == 5){ 
						Temp[i][j][22] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][22] = 5;
     					}else if(Test[i][j] == 8){
						Temp[i][j][22] = 7;
     					}else if(Test[i][j] == 7){
						Temp[i][j][22] = 8;
     					}else if(Test[i][j] >= 9 || Test[i][j] <= 2){ 
      						Temp[i][j][22] = Test[i][j];   // permutazione rs | tu vw 
     					};
     					if(Test[i][j] == 3){
						Temp[i][j][23] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][23] = 3;
     					}else if(Test[i][j] == 8){
						Temp[i][j][23] = 7;
     					}else if(Test[i][j] == 7){
						Temp[i][j][23] = 8;
					}else if(Test[i][j] >= 9 || (Test[i][j] >= 5 && Test[i][j] <= 6) || Test[i][j] <= 2){
						Temp[i][j][23] = Test[i][j];  // permutazione rs | vw 
					};
     					if(Test[i][j] == 3){
						Temp[i][j][24] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][24] = 3;
     					}else if(Test[i][j] == 9){
						Temp[i][j][24] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][24] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 5 && Test[i][j] <= 8) || Test[i][j] <= 2){
						Temp[i][j][24] = Test[i][j];  // permutazione rs | kl 
						};
     					if(Test[i][j] == 3){
						Temp[i][j][25] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][25] = 3;
     					}else if(Test[i][j] == 9){
						Temp[i][j][25] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][25] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][25] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][25] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 8) || Test[i][j] <= 2){
						Temp[i][j][25] = Test[i][j];  // permutazione rs | kl mn 
					};
     					if(Test[i][j] == 3){
						Temp[i][j][26] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][26] = 3;
     					}else if(Test[i][j] == 11){
						Temp[i][j][26] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][26] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 10) || Test[i][j] <= 2){
						Temp[i][j][26] = Test[i][j];  // permutazione rs | mn 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][27] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][27] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][27] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][27] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][27] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][27] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 7 && Test[i][j] <= 8) || (Test[i][j] >= 3 && Test[i][j] <= 4)){
						Temp[i][j][27] = Test[i][j];  // permutazione pq | tu | kl 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][28] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][28] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][28] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][28] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][28] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][28] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][28] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][28] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 8) || (Test[i][j] >= 3 && Test[i][j] <= 4)){
						Temp[i][j][28] = Test[i][j];  // permutazione pq | tu | kl mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][29] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][29] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][29] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][29] = 5;
     					}else if(Test[i][j] == 11){
						Temp[i][j][29] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][29] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 10) || (Test[i][j] >= 3 && Test[i][j] <= 4)){
						Temp[i][j][29] = Test[i][j];  // permutazione pq | tu | mn 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][30] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][30] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][30] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][30] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][30] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][30] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][30] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][30] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 3 && Test[i][j] <= 4)){ 
      						Temp[i][j][30] = Test[i][j];  // permutazione pq | tu vw | kl
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][31] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][31] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][31] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][31] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][31] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][31] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][31] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][31] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][31] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][31] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 3 && Test[i][j] <= 4)){ 
      						Temp[i][j][31] = Test[i][j];  // permutazione pq | tu vw | kl mn 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][32] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][32] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][32] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][32] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][32] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][32] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][32] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][32] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 3 && Test[i][j] <= 4) || (Test[i][j] >= 9 && Test[i][j] <= 10)){
						Temp[i][j][32] = Test[i][j];  // permutazione pq | tu vw | mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][33] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][33] = 1;
     					}else if(Test[i][j] == 7){
						Temp[i][j][33] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][33] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][33] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][33] = 9;
					}else if(Test[i][j] >= 11 || (Test[i][j] >= 3 && Test[i][j] <= 6)){
						Temp[i][j][33] = Test[i][j];  // permutazione pq | vw | kl
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][34] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][34] = 1;
     					}else if(Test[i][j] == 7){
						Temp[i][j][34] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][34] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][34] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][34] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][34] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][34] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 3 && Test[i][j] <= 6)){ 
						Temp[i][j][34] = Test[i][j];  // permutazione pq | vw | kl mn 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][35] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][35] = 1;
     					}else if(Test[i][j] == 7){
						Temp[i][j][35] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][35] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][35] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][35] = 11;
					}else if(Test[i][j] >= 13 || (Test[i][j] >= 3 && Test[i][j] <= 6) || (Test[i][j] >= 9 && Test[i][j] <= 10)){
						Temp[i][j][35] = Test[i][j];  // permutazione pq | vw | mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][36] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][36] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][36] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][36] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][36] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][36] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][36] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][36] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 7 && Test[i][j] <= 8)){ 
						Temp[i][j][36] = Test[i][j];  // permutazione pq rs | tu | kl 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][37] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][37] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][37] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][37] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][37] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][37] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][37] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][37] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][37] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][37] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 8)){ 
      						Temp[i][j][37] = Test[i][j];  // permutazione pq rs | tu | kl mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][38] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][38] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][38] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][38] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][38] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][38] = 5;
     					}else if(Test[i][j] == 11){
						Temp[i][j][38] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][38] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 10)){ 
      						Temp[i][j][38] = Test[i][j];  // permutazione pq rs | tu | mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][39] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][39] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][39] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][39] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][39] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][39] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][39] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][39] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][39] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][39] = 9;
     					}else if(Test[i][j] >= 11){
						Temp[i][j][39] = Test[i][j];  // permutazione pq rs | tu vw | kl 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][40] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][40] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][40] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][40] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][40] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][40] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][40] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][40] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][40] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][40] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][40] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][40] = 11;
     					}else if(Test[i][j] >= 13){
						Temp[i][j][40] = Test[i][j];  // permutazione pq rs | tu vw | kl mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][41] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][41] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][41] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][41] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][41] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][41] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][41] = 8;
					}else if(Test[i][j] == 8){
						Temp[i][j][41] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][41] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][41] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 9 && Test[i][j] <= 10)){ 
      						Temp[i][j][41] = Test[i][j];  // permutazione pq rs | tu vw | mn 
					};
    					if(Test[i][j] == 1){
						Temp[i][j][42] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][42] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][42] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][42] = 3;
     					}else if(Test[i][j] == 7){
						Temp[i][j][42] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][42] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][42] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][42] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 5 && Test[i][j] <= 6)){ 
      						Temp[i][j][42] = Test[i][j];  // permutazione pq rs | vw | kl 
     					};
					if(Test[i][j] == 1){
						Temp[i][j][43] = 2;
					}else if(Test[i][j] == 2){
						Temp[i][j][43] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][43] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][43] = 3;
     					}else if(Test[i][j] == 7){
						Temp[i][j][43] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][43] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][43] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][43] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][43] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][43] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 6)){ 
      						Temp[i][j][43] = Test[i][j];  // permutazione pq rs | vw | kl mn
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][44] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][44] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][44] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][44] = 3;
     					}else if(Test[i][j] == 7){
						Temp[i][j][44] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][44] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][44] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][44] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 9 && Test[i][j] <= 10) || (Test[i][j] >= 5 && Test[i][j] <= 6)){
						Temp[i][j][44] = Test[i][j];  // permutazione pq rs | vw | mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][45] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][45] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][45] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][45] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][45] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][45] = 9;
     					}else if(Test[i][j] >=  11 || (Test[i][j] >= 7 && Test[i][j] <= 8) || (Test[i][j] >= 1 && Test[i][j] <= 2)){
						Temp[i][j][45] = Test[i][j];  //   permutazione rs | tu | kl 
     					};
					if(Test[i][j] == 3){
						Temp[i][j][46] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][46] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][46] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][46] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][46] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][46] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][46] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][46] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 8) || (Test[i][j] >= 1 && Test[i][j] <= 2)){
						Temp[i][j][46] = Test[i][j];  // permutazione rs | tu | kl mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][47] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][47] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][47] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][47] = 5;
     					}else if(Test[i][j] == 11){
						Temp[i][j][47] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][47] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 10) || (Test[i][j] >= 1 && Test[i][j] <= 2)){
						Temp[i][j][47] = Test[i][j];  // permutazione rs | tu | mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][48] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][48] = 3;
					}else if(Test[i][j] == 5){
						Temp[i][j][48] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][48] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][48] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][48] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][48] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][48] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 1 && Test[i][j] <= 2)){ 
      						Temp[i][j][48] = Test[i][j];  // permutazione rs | tu vw | kl
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][49] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][49] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][49] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][49] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][49] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][49] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][49] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][49] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][49] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][49] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 1 && Test[i][j] <= 2)){ 
      						Temp[i][j][49] = Test[i][j];  // permutazione rs | tu vw | kl mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][50] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][50] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][50] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][50] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][50] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][50] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][50] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][50] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 9 && Test[i][j] <= 10) || (Test[i][j] >= 1 && Test[i][j] <= 2)){
						Temp[i][j][50] = Test[i][j];  // permutazione rs | tu vw | mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][51] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][51] = 3;
     					}else if(Test[i][j] == 7){
						Temp[i][j][51] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][51] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][51] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][51] = 9;
					}else if(Test[i][j] >=  11 || (Test[i][j] >= 5 && Test[i][j] <= 6) || (Test[i][j] >= 1 && Test[i][j] <= 2)){
						Temp[i][j][51] = Test[i][j];  // permutazione rs | vw | kl
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][52] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][52] = 3;
     					}else if(Test[i][j] == 7){
						Temp[i][j][52] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][52] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][52] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][52] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][52] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][52] = 11;
					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 6) || (Test[i][j] >= 1 && Test[i][j] <= 2)){
						Temp[i][j][52] = Test[i][j];  // permutazione rs | vw | kl mn
					}; 
     					if(Test[i][j] == 3){
						Temp[i][j][53] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][53] = 3;
     					}else if(Test[i][j] == 7){
						Temp[i][j][53] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][53] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][53] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][53] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 5 && Test[i][j] <= 6) || (Test[i][j] >= 1 && Test[i][j] <= 2) 
					|| (Test[i][j] >= 9 && Test[i][j] <= 10)){
						Temp[i][j][53] = Test[i][j];  // permutazione rs | vw | mn 
     					};
				};
			};


   			for(i = 0; i <= 53; i++){
    				if(Temp[0][0][i] > Temp[0][1][i]){
					t2 = Temp[0][1][i];
					t1 = Temp[0][0][i]; 
					Temp[0][0][i] = t2; 
					Temp[0][1][i] = t1;
				};
    				if(Temp[1][0][i] > Temp[1][1][i]){
					t2 = Temp[1][1][i];
					t1 = Temp[1][0][i]; 
					Temp[1][0][i] = t2; 
					Temp[1][1][i] = t1;
				};
    				if(Temp[2][0][i] > Temp[2][1][i]){
					t2 = Temp[2][1][i]; 
     					t1 = Temp[2][0][i]; 
					Temp[2][0][i] = t2; 
					Temp[2][1][i] = t1;
				};
    				if(Temp[3][0][i] > Temp[3][1][i]){
					t2 = Temp[3][1][i]; 
     					t1 = Temp[3][0][i]; 
					Temp[3][0][i] = t2; 
					Temp[3][1][i] = t1;
				};
    				if(Temp[4][0][i] > Temp[4][1][i]){
					t2 = Temp[4][1][i]; 
     					t1 = Temp[4][0][i]; 
					Temp[4][0][i] = t2; 
					Temp[4][1][i] = t1;
				};
    				if(Temp[5][0][i] > Temp[5][1][i]){
					t2 = Temp[5][1][i]; 
     					t1 = Temp[5][0][i]; 
					Temp[5][0][i] = t2; 
					Temp[5][1][i] = t1;
				};
    				if(Temp[6][0][i] > Temp[6][1][i]){
					t2 = Temp[6][1][i]; 
     					t1 = Temp[6][0][i]; 
					Temp[6][0][i] = t2; 
					Temp[6][1][i] = t1;
				};
    				if(Temp[7][0][i] > Temp[7][1][i]){
					t2 = Temp[7][1][i]; 
     					t1 = Temp[7][0][i]; 
					Temp[7][0][i] = t2; 
					Temp[7][1][i] = t1;
				};
    			};



   
			for(k=0; k<=53; k++){
				Temp1[k] = Temp[0][0][k];
				Temp2[k] = Temp[0][1][k];
				Temp3[k] = Temp[1][0][k];
				Temp4[k] = Temp[1][1][k];
				Temp5[k] = Temp[2][0][k];
				Temp6[k] = Temp[2][1][k];
				Temp7[k] = Temp[3][0][k];
				Temp8[k] = Temp[3][1][k];
				Temp9[k] = Temp[4][0][k];
				Temp10[k] = Temp[4][1][k];
				Temp11[k] = Temp[5][0][k];
				Temp12[k] = Temp[5][1][k];
				Temp13[k] = Temp[6][0][k];
				Temp14[k] = Temp[6][1][k];
				Temp15[k] = Temp[7][0][k];
				Temp16[k] = Temp[7][1][k];
			};


			for(v=0; v<=s-1; v++){
				if(v <= s-1){
					Avert1[v] = AcccVertices[0][0][v];
					Avert2[v] = AcccVertices[0][1][v];
					Avert3[v] = AcccVertices[1][0][v];
					Avert4[v] = AcccVertices[1][1][v];
					Avert5[v] = AcccVertices[2][0][v];
					Avert6[v] = AcccVertices[2][1][v];
					Avert7[v] = AcccVertices[3][0][v];
					Avert8[v] = AcccVertices[3][1][v];
					Avert9[v] = AcccVertices[4][0][v];
					Avert10[v] = AcccVertices[4][1][v];
					Avert11[v] = AcccVertices[5][0][v];
					Avert12[v] = AcccVertices[5][1][v];
					Avert13[v] = AcccVertices[6][0][v];
					Avert14[v] = AcccVertices[6][1][v];
					Avert15[v] = AcccVertices[7][0][v];
					Avert16[v] = AcccVertices[7][1][v];
				}
			};
		
			IfRepeat = false;

			if(s < 20000){

				for(v = 0; v<=s-1; v++){

     					for(i = 0; i <= 53; i++){
       						for(j = 0; j <= 7; j++){
        						IfTemp[i][j] = 0;
						};
						aux_repeat[i] = 0;						
					};

      		
       					for(j = 0; j <= 53; j++){
           					if(Avert1[v] == Temp1[j] && Avert2[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert1[v] == Temp3[j] && Avert2[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert1[v] == Temp5[j] && Avert2[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert1[v] == Temp7[j] && Avert2[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert1[v] == Temp9[j] && Avert2[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert1[v] == Temp11[j] && Avert2[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert1[v] == Temp13[j] && Avert2[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert1[v] == Temp15[j] && Avert2[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert3[v] == Temp1[j] && Avert4[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert3[v] == Temp3[j] && Avert4[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert3[v] == Temp5[j] && Avert4[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert3[v] == Temp7[j] && Avert4[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert3[v] == Temp9[j] && Avert4[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert3[v] == Temp11[j] && Avert4[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert3[v] == Temp13[j] && Avert4[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert3[v] == Temp15[j] && Avert4[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert5[v] == Temp1[j] && Avert6[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert5[v] == Temp3[j] && Avert6[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert5[v] == Temp5[j] && Avert6[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert5[v] == Temp7[j] && Avert6[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert5[v] == Temp9[j] && Avert6[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert5[v] == Temp11[j] && Avert6[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert5[v] == Temp13[j] && Avert6[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert5[v] == Temp15[j] && Avert6[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert7[v] == Temp1[j] && Avert8[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert7[v] == Temp3[j] && Avert8[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert7[v] == Temp5[j] && Avert8[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert7[v] == Temp7[j] && Avert8[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert7[v] == Temp9[j] && Avert8[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert7[v] == Temp11[j] && Avert8[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert7[v] == Temp13[j] && Avert8[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert7[v] == Temp15[j] && Avert8[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert9[v] == Temp1[j] && Avert10[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert9[v] == Temp3[j] && Avert10[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert9[v] == Temp5[j] && Avert10[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert9[v] == Temp7[j] && Avert10[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert9[v] == Temp9[j] && Avert10[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert9[v] == Temp11[j] && Avert10[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert9[v] == Temp13[j] && Avert10[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert9[v] == Temp15[j] && Avert10[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert11[v] == Temp1[j] && Avert12[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert11[v] == Temp3[j] && Avert12[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert11[v] == Temp5[j] && Avert12[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert11[v] == Temp7[j] && Avert12[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert11[v] == Temp9[j] && Avert12[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert11[v] == Temp11[j] && Avert12[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert11[v] == Temp13[j] && Avert12[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert11[v] == Temp15[j] && Avert12[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert13[v] == Temp1[j] && Avert14[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert13[v] == Temp3[j] && Avert14[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert13[v] == Temp5[j] && Avert14[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert13[v] == Temp7[j] && Avert14[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert13[v] == Temp9[j] && Avert14[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert13[v] == Temp11[j] && Avert14[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert13[v] == Temp13[j] && Avert14[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert13[v] == Temp15[j] && Avert14[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};

           					if(Avert15[v] == Temp1[j] && Avert16[v] == Temp2[j]){
							IfTemp[j][0] = 1;
						}else if(Avert15[v] == Temp3[j] && Avert16[v] == Temp4[j]){
							IfTemp[j][1] = 1;
						}else if(Avert15[v] == Temp5[j] && Avert16[v] == Temp6[j]){
							IfTemp[j][2] = 1;
	 					}else if(Avert15[v] == Temp7[j] && Avert16[v] == Temp8[j]){
							IfTemp[j][3] = 1;
						}else if(Avert15[v] == Temp9[j] && Avert16[v] == Temp10[j]){ 
             						IfTemp[j][4] = 1;
						}else if(Avert15[v] == Temp11[j] && Avert16[v] == Temp12[j]){ 
             						IfTemp[j][5] = 1;
						}else if(Avert15[v] == Temp13[j] && Avert16[v] == Temp14[j]){ 
             						IfTemp[j][6] = 1;
						}else if(Avert15[v] == Temp15[j] && Avert16[v] == Temp16[j]){ 
             						IfTemp[j][7] = 1;
						};
    		
						if(IfTemp[j][0] + IfTemp[j][1] + IfTemp[j][2] + IfTemp[j][3] 
			 			+ IfTemp[j][4] + IfTemp[j][5] + IfTemp[j][6] + IfTemp[j][7] == 8){
							aux_repeat[j] += 1; 
						};


						if(aux_repeat[j] > 0){
							IfRepeat = true;
							break;
						}
					};

					if(IfRepeat == true){
				
						break;

					};


				};

			}else{

				nvert[0] = s-1;
				cudaMalloc((void**)&dev_nvert, 1 * sizeof(long int));
				cudaMemcpy(dev_nvert, nvert, 1 * sizeof(long int), cudaMemcpyHostToDevice);
				//cudaMemset(dev_nvert, s-1, 1 * sizeof(long));

				for(j = 0; j <= max_grid-1; j++){
					Repeat[j] = 0;
				};
				cudaMalloc((void**)&dev_Repeat, max_grid * sizeof(long int));
				cudaMemcpy(dev_Repeat, Repeat, max_grid * sizeof(long int), cudaMemcpyHostToDevice);
				//cudaMemset(dev_Repeat, 0, max_grid * sizeof(int));

				cudaMalloc((void**)&dev_Avert1, S * sizeof(int));
				cudaMemcpy(dev_Avert1, Avert1, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert2, S * sizeof(int));
				cudaMemcpy(dev_Avert2, Avert2, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert3, S * sizeof(int));
				cudaMemcpy(dev_Avert3, Avert3, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert4, S * sizeof(int));
				cudaMemcpy(dev_Avert4, Avert4, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert5, S * sizeof(int));
				cudaMemcpy(dev_Avert5, Avert5, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert6, S * sizeof(int));
				cudaMemcpy(dev_Avert6, Avert6, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert7, S * sizeof(int));
				cudaMemcpy(dev_Avert7, Avert7, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert8, S * sizeof(int));
				cudaMemcpy(dev_Avert8, Avert8, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert9, S * sizeof(int));
				cudaMemcpy(dev_Avert9, Avert9, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert10, S * sizeof(int));
				cudaMemcpy(dev_Avert10, Avert10, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert11, S * sizeof(int));
				cudaMemcpy(dev_Avert11, Avert11, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert12, S * sizeof(int));
				cudaMemcpy(dev_Avert12, Avert12, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert13, S * sizeof(int));
				cudaMemcpy(dev_Avert13, Avert13, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert14, S * sizeof(int));
				cudaMemcpy(dev_Avert14, Avert14, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert15, S * sizeof(int));
				cudaMemcpy(dev_Avert15, Avert15, S * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Avert16, S * sizeof(int));
				cudaMemcpy(dev_Avert16, Avert16, S * sizeof(int), cudaMemcpyHostToDevice);

				cudaMalloc((void**)&dev_Temp1, 54 * sizeof(int));
				cudaMemcpy(dev_Temp1, Temp1, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp2, 54 * sizeof(int));
				cudaMemcpy(dev_Temp2, Temp2, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp3, 54 * sizeof(int));
				cudaMemcpy(dev_Temp3, Temp3, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp4, 54 * sizeof(int));
				cudaMemcpy(dev_Temp4, Temp4, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp5, 54 * sizeof(int));
				cudaMemcpy(dev_Temp5, Temp5, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp6, 54 * sizeof(int));
				cudaMemcpy(dev_Temp6, Temp6, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp7, 54 * sizeof(int));
				cudaMemcpy(dev_Temp7, Temp7, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp8, 54 * sizeof(int));
				cudaMemcpy(dev_Temp8, Temp8, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp9, 54 * sizeof(int));
				cudaMemcpy(dev_Temp9, Temp9, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp10, 54 * sizeof(int));
				cudaMemcpy(dev_Temp10, Temp10, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp11, 54 * sizeof(int));
				cudaMemcpy(dev_Temp11, Temp11, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp12, 54 * sizeof(int));
				cudaMemcpy(dev_Temp12, Temp12, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp13, 54 * sizeof(int));
				cudaMemcpy(dev_Temp13, Temp13, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp14, 54 * sizeof(int));
				cudaMemcpy(dev_Temp14, Temp14, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp15, 54 * sizeof(int));
				cudaMemcpy(dev_Temp15, Temp15, 54 * sizeof(int), cudaMemcpyHostToDevice);
				cudaMalloc((void**)&dev_Temp16, 54 * sizeof(int));
				cudaMemcpy(dev_Temp16, Temp16, 54 * sizeof(int), cudaMemcpyHostToDevice);

				srccomb<<<max_block,max_thread,max_share>>>(dev_nvert,dev_Avert1,dev_Avert2,dev_Avert3,dev_Avert4,
					dev_Avert5,dev_Avert6,dev_Avert7,dev_Avert8,dev_Avert9,dev_Avert10,dev_Avert11,
					dev_Avert12,dev_Avert13,dev_Avert14,dev_Avert15,dev_Avert16,dev_Temp1,dev_Temp2,
					dev_Temp3,dev_Temp4,dev_Temp5,dev_Temp6,dev_Temp7,dev_Temp8,dev_Temp9,dev_Temp10,
					dev_Temp11,dev_Temp12,dev_Temp13,dev_Temp14,dev_Temp15,dev_Temp16,dev_Repeat);
		
				cudaMemcpy(Repeat, dev_Repeat, max_grid * sizeof(long int), cudaMemcpyDeviceToHost);

				Nrepeat = 0;
				for(j = 0; j <= max_grid-1; j++){
					Nrepeat += Repeat[j];
				};

				if(Nrepeat == 0){
					IfRepeat = false;
				}else if(Nrepeat > 0){
					IfRepeat = true;
				};

				cudaFree(dev_nvert);
				cudaFree(dev_Repeat);

				cudaFree(dev_Avert1);
				cudaFree(dev_Avert2);
				cudaFree(dev_Avert3);
				cudaFree(dev_Avert4);
				cudaFree(dev_Avert5);
				cudaFree(dev_Avert6);
				cudaFree(dev_Avert7);
				cudaFree(dev_Avert8);
				cudaFree(dev_Avert9);
				cudaFree(dev_Avert10);
				cudaFree(dev_Avert11);
				cudaFree(dev_Avert12);
				cudaFree(dev_Avert13);
				cudaFree(dev_Avert14);
				cudaFree(dev_Avert15);
				cudaFree(dev_Avert16);
				cudaFree(dev_Temp1);
				cudaFree(dev_Temp2);
				cudaFree(dev_Temp3);
				cudaFree(dev_Temp4);
				cudaFree(dev_Temp5);
				cudaFree(dev_Temp6);
				cudaFree(dev_Temp7);
				cudaFree(dev_Temp8);
				cudaFree(dev_Temp9);
				cudaFree(dev_Temp10);
				cudaFree(dev_Temp11);
				cudaFree(dev_Temp12);
				cudaFree(dev_Temp13);
				cudaFree(dev_Temp14);
				cudaFree(dev_Temp15);
				cudaFree(dev_Temp16);
		
			};

	
			if(IfRepeat == false){
				s++; 
				for(i=0; i<=7; i++){
					for(j=0; j<=1; j++){
    						AcccVertices[i][j][s-1] = AcccTemp[i][j][u];
					};
				};
			};

			if(u%500 == 0){
				printf("Loop %d completed and %d inequivalent elements found.\n",u,s-1);
			};
		};

		printf("Iteration %d completed.\n",t+1);

	};

//**********************************************************************************************


	FILE * inFile;

	inFile = fopen(filepathIn,"w+");

	for(u = 0; u <= s-1; u++){

		fprintf(inFile,"Accombcomp[%ld] = {{{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d}}};\n",
		u,AcccVertices[0][0][u],AcccVertices[0][1][u],AcccVertices[1][0][u],AcccVertices[1][1][u],AcccVertices[2][0][u],
		AcccVertices[2][1][u],AcccVertices[3][0][u],AcccVertices[3][1][u],AcccVertices[4][0][u],AcccVertices[4][1][u],
		AcccVertices[5][0][u],AcccVertices[5][1][u],AcccVertices[6][0][u],AcccVertices[6][1][u],AcccVertices[7][0][u],
 		AcccVertices[7][1][u]);

	};
		

	fclose(inFile);

	FILE * outFile;

	outFile = fopen(filepathOut,"w+");

	for(u = 0; u <= s-1; u++){

		fprintf(outFile,"CombComp[[%ld]] = {{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d}};\n",
		u,AcccVertices[0][0][u],AcccVertices[0][1][u],AcccVertices[1][0][u],AcccVertices[1][1][u],AcccVertices[2][0][u],
		AcccVertices[2][1][u],AcccVertices[3][0][u],AcccVertices[3][1][u],AcccVertices[4][0][u],AcccVertices[4][1][u],
		AcccVertices[5][0][u],AcccVertices[5][1][u],AcccVertices[6][0][u],AcccVertices[6][1][u],AcccVertices[7][0][u],
 		AcccVertices[7][1][u]);

	};
	
	
	
	return 0;


};
			

//**************************************************

//__global__ void redvecs_sumsq(long nlocal_r, double *xnew, double *rxnew) {

	//extern __shared__ double xsq[];

	// each thread loads one element from global to shared memory 
	//unsigned long int tid = threadIdx.x;
	//unsigned long int idx = blockIdx.x*(nlocal_r) + threadIdx.x;

	//xsq[tid] = 0.0;
	//__syncthreads();

    	//while(idx < nlocal_r){

		//xsq[tid] += xnew[idx]*xnew[idx];

           //idx  = idx + blockDim.x;
        //};
	//__syncthreads();

	//for(unsigned long int s = blockDim.x/2; s > 0; s >>= 1) {
		//if(tid < s) {
			//xsq[tid] += xsq[tid+s];
		//};
		//__syncthreads();
	//};
      
	//	write the result for this block to global memory

	//if(tid == 0) {
		//rxnew[blockIdx.x] = xsq[0];
	//};

//};

//**********************************************************************************************
// definire kernel " scrcmb ": 136 Bytes of argument (1 int = 4 Bytes = 32 bit)

__global__ void srccomb(long int *nvert, int *Avert1, int *Avert2, int *Avert3, int *Avert4, 
int *Avert5, int *Avert6, int *Avert7, int *Avert8, int *Avert9, int *Avert10, int *Avert11, 
int *Avert12, int *Avert13, int *Avert14, int *Avert15, int *Avert16, int *Temp1, int *Temp2,
int *Temp3, int *Temp4, int *Temp5, int *Temp6, int *Temp7, int *Temp8, int *Temp9, int *Temp10,
int *Temp11, int *Temp12, int *Temp13, int *Temp14, int *Temp15, int *Temp16, long int *Repeat){

	extern __shared__ long int aux_repeat[];

	long int i, j, k;

	long int sid; 
	
	unsigned long int v;

	int IfTemp[54][8];

	sid = nvert[0]+1;

	// each thread loads one element from global to shared memory 
	unsigned long int tid = threadIdx.x;
	unsigned long int idx = blockIdx.x*(sid) + threadIdx.x;

	aux_repeat[tid] = 0;

	__syncthreads();
	
	while(idx < sid){

		v = idx;

      		for(i = 0; i <= 53; i++){
       			for(j = 0; j <= 7; j++){
        			IfTemp[i][j] = 0;
			};						
		};

      		
       		for(j = 0; j <= 53; j++){
           		if(Avert1[v] == Temp1[j] && Avert2[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert1[v] == Temp3[j] && Avert2[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert1[v] == Temp5[j] && Avert2[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert1[v] == Temp7[j] && Avert2[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert1[v] == Temp9[j] && Avert2[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert1[v] == Temp11[j] && Avert2[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert1[v] == Temp13[j] && Avert2[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert1[v] == Temp15[j] && Avert2[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert3[v] == Temp1[j] && Avert4[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert3[v] == Temp3[j] && Avert4[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert3[v] == Temp5[j] && Avert4[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert3[v] == Temp7[j] && Avert4[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert3[v] == Temp9[j] && Avert4[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert3[v] == Temp11[j] && Avert4[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert3[v] == Temp13[j] && Avert4[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert3[v] == Temp15[j] && Avert4[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert5[v] == Temp1[j] && Avert6[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert5[v] == Temp3[j] && Avert6[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert5[v] == Temp5[j] && Avert6[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert5[v] == Temp7[j] && Avert6[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert5[v] == Temp9[j] && Avert6[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert5[v] == Temp11[j] && Avert6[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert5[v] == Temp13[j] && Avert6[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert5[v] == Temp15[j] && Avert6[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert7[v] == Temp1[j] && Avert8[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert7[v] == Temp3[j] && Avert8[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert7[v] == Temp5[j] && Avert8[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert7[v] == Temp7[j] && Avert8[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert7[v] == Temp9[j] && Avert8[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert7[v] == Temp11[j] && Avert8[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert7[v] == Temp13[j] && Avert8[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert7[v] == Temp15[j] && Avert8[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert9[v] == Temp1[j] && Avert10[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert9[v] == Temp3[j] && Avert10[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert9[v] == Temp5[j] && Avert10[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert9[v] == Temp7[j] && Avert10[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert9[v] == Temp9[j] && Avert10[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert9[v] == Temp11[j] && Avert10[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert9[v] == Temp13[j] && Avert10[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert9[v] == Temp15[j] && Avert10[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert11[v] == Temp1[j] && Avert12[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert11[v] == Temp3[j] && Avert12[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert11[v] == Temp5[j] && Avert12[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert11[v] == Temp7[j] && Avert12[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert11[v] == Temp9[j] && Avert12[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert11[v] == Temp11[j] && Avert12[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert11[v] == Temp13[j] && Avert12[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert11[v] == Temp15[j] && Avert12[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert13[v] == Temp1[j] && Avert14[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert13[v] == Temp3[j] && Avert14[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert13[v] == Temp5[j] && Avert14[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert13[v] == Temp7[j] && Avert14[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert13[v] == Temp9[j] && Avert14[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert13[v] == Temp11[j] && Avert14[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert13[v] == Temp13[j] && Avert14[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert13[v] == Temp15[j] && Avert14[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};

           		if(Avert15[v] == Temp1[j] && Avert16[v] == Temp2[j]){
				IfTemp[j][0] = 1;
			}else if(Avert15[v] == Temp3[j] && Avert16[v] == Temp4[j]){
				IfTemp[j][1] = 1;
			}else if(Avert15[v] == Temp5[j] && Avert16[v] == Temp6[j]){
				IfTemp[j][2] = 1;
	 		}else if(Avert15[v] == Temp7[j] && Avert16[v] == Temp8[j]){
				IfTemp[j][3] = 1;
			}else if(Avert15[v] == Temp9[j] && Avert16[v] == Temp10[j]){ 
             			IfTemp[j][4] = 1;
			}else if(Avert15[v] == Temp11[j] && Avert16[v] == Temp12[j]){ 
             			IfTemp[j][5] = 1;
			}else if(Avert15[v] == Temp13[j] && Avert16[v] == Temp14[j]){ 
             			IfTemp[j][6] = 1;
			}else if(Avert15[v] == Temp15[j] && Avert16[v] == Temp16[j]){ 
             			IfTemp[j][7] = 1;
			};
    		
			if(IfTemp[j][0] + IfTemp[j][1] + IfTemp[j][2] + IfTemp[j][3] 
			 + IfTemp[j][4] + IfTemp[j][5] + IfTemp[j][6] + IfTemp[j][7] == 8){
				aux_repeat[tid] += 1; 
			};
		};

		idx  = idx + blockDim.x;

	};

	__syncthreads();

	for(unsigned long int s = blockDim.x/2; s > 0; s >>= 1) {
		if(tid < s) {
			aux_repeat[tid] += aux_repeat[tid+s];
		};
		__syncthreads();
	};
      
	//	write the result for this block to global memory

	if(tid == 0) {
		Repeat[blockIdx.x] = aux_repeat[0];
	};

};

//**********************************************************************************************

