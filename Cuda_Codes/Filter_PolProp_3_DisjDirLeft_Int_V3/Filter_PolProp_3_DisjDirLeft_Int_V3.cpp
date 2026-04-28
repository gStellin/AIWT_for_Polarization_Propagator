#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <array>
#include <fstream>

int main (){

	using namespace std;

//***************************************************************************

	#define S 114048

	#define combfilepath "Out_Comb_3_DisjDirLeft_V3.m"
	#define multfilepath "Out_Mult_3_DisjDirLeft_V3.m"

//****************************************************************************

	int AdcdlVertices[8][2][S];
	int MultdcdlVertices[S];
	int AdcdlTemp[8][2][S];
	int MultdcdlTemp[S];
	int Temp[8][2][64];
	int Test[8][2];

	long int nS;

	array<array<array<int,2>,8>,S> Adcombdirleft;

	long int s, t, u, v, i, j, k; 

	bool IfRepeat;
	long int aux_repeat[64];
	int IfTemp[64][8];

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

	#include "In_Comb_3_DisjDirLeft_V3.h"
	
//**********************************************************************************************
//	Opening titles 

	printf("*****************************************************************\n");
	printf("								 \n");
	printf("         A U T O M A T E D    I M P L E M E N T A T I O N        \n"); 
	printf("								 \n");
	printf("               O F   W I C K ' S   T H E O R E M                 \n");
	printf("								 \n");
	printf("   		    f o r   G o r k o v' s                       \n");
	printf("								 \n");
	printf("	 P o l a r i z a t i o n   P r o p a g a t o r		 \n");
	printf("								 \n");
	printf("             	  a t   t h i r d   O r d e r		         \n");
	printf("								 \n");
	printf("*****************************************************************\n");
	printf("								 \n");
	printf("	      F i l t e r i n g    P r o c e s s 		 \n");
	printf("								 \n");
	printf("       o f   f u l l y - c o n t r a c t e d   t e r m s	 \n");
	printf("								 \n");
	printf("         o f   D i s j o i n t   D i r e c t   t y p e           \n");
	printf("								 \n");
	printf("   w i t h   a   l e f t - d r e s s e d   p r o p a g a t o r   \n");
	printf("								 \n");
	printf("*****************************************************************\n");
	printf("								 \n");

//**********************************************************************************************
// 	Initialization of the multi dim. arrays for the original and filtered 
// 	fully-contracted terms, together with their multiplicity
	
	for(t = 0; t <= 5; t++){

		printf("         Permutation of vertices %ld: iterations started.         \n",t+1);
		printf("								 \n");

		if(t == 0){
			nS = S;
			for(u=0; u<=nS-1; u++){
				for(i=0; i<=7; i++){
					for(j=0; j<=1; j++){
						AdcdlTemp[i][j][u] = Adcombdirleft[u][i][j];
					};
				};
				MultdcdlTemp[u] = 0;
				MultdcdlVertices[u] = 0;
			};
		}else{
			nS = s;
			for(u=0; u<=nS-1; u++){
				for(i=0; i<=7; i++){
					for(j=0; j<=1; j++){
						AdcdlTemp[i][j][u] = AdcdlVertices[i][j][u];
					};
				};
				MultdcdlTemp[u] = MultdcdlVertices[u];
				MultdcdlVertices[u] = 0;
			};
		};

	
  		s = 1;
  		AdcdlVertices[0][0][0] = AdcdlTemp[0][0][0];
  		AdcdlVertices[0][1][0] = AdcdlTemp[0][1][0];
  		AdcdlVertices[1][0][0] = AdcdlTemp[1][0][0];
  		AdcdlVertices[1][1][0] = AdcdlTemp[1][1][0];
  		AdcdlVertices[2][0][0] = AdcdlTemp[2][0][0];
  		AdcdlVertices[2][1][0] = AdcdlTemp[2][1][0];
  		AdcdlVertices[3][0][0] = AdcdlTemp[3][0][0];
  		AdcdlVertices[3][1][0] = AdcdlTemp[3][1][0];
  		AdcdlVertices[4][0][0] = AdcdlTemp[4][0][0];
  		AdcdlVertices[4][1][0] = AdcdlTemp[4][1][0];
  		AdcdlVertices[5][0][0] = AdcdlTemp[5][0][0];
  		AdcdlVertices[5][1][0] = AdcdlTemp[5][1][0];
  		AdcdlVertices[6][0][0] = AdcdlTemp[6][0][0];
  		AdcdlVertices[6][1][0] = AdcdlTemp[6][1][0];
  		AdcdlVertices[7][0][0] = AdcdlTemp[7][0][0];
  		AdcdlVertices[7][1][0] = AdcdlTemp[7][1][0];
		MultdcdlVertices[0] = max(1,MultdcdlTemp[0]);

  		for(u = 1; u <= nS-1; u++){
   
   			for(i = 0; i <= 7; i++){
				for(j = 0; j <= 1; j++){
     					if(AdcdlTemp[i][j][u] == 1){
						i1 = i;
						j1 = j;
					};
     					if(AdcdlTemp[i][j][u] == 2){
						i2 = i;
						j2 = j;
					};
     					if(AdcdlTemp[i][j][u] == 3){
						i3 = i;
						j3 = j;
					};
     					if(AdcdlTemp[i][j][u] == 4){
						i4 = i;
						j4 = j;
					};
     					if(AdcdlTemp[i][j][u] == 5){
						i5 = i;
						j5 = j;
					};
     					if(AdcdlTemp[i][j][u] == 6){
						i6 = i;
						j6 = j;
					};
     					if(AdcdlTemp[i][j][u] == 7){
						i7 = i;
						j7 = j;
					};
     					if(AdcdlTemp[i][j][u] == 8){
						i8 = i;
						j8 = j;
					};
     					if(AdcdlTemp[i][j][u] == 9){
						i9 = i;
						j9 = j;
					};
     					if(AdcdlTemp[i][j][u] == 10){
						i10 = i;
						j10 = j;
					};
     					if(AdcdlTemp[i][j][u] == 11){
						i11 = i;
						j11 = j;
					};
     					if(AdcdlTemp[i][j][u] == 12){
						i12 = i;
						j12 = j;
					};
					Test[i][j] = AdcdlTemp[i][j][u];
 				};
			};

   				
			
   				
//************************************************************************************************************
//	Permutation of the vertices: 6 equivalent ways to perform the operation exist (external permutations)

   			if(t == 0){ // Identity permutation [1][2][3]: no internal index exchange
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
			}else if(t == 1){ // Permutation [12][3]: no internal index exchange
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
			}else if(t == 2){ // Permutation [13][2]: no internal index exchange
    				Test[i1][j1] = 9;
    				Test[i2][j2] = 10;
    				Test[i3][j3] = 11;
    				Test[i4][j4] = 12;
    				Test[i9][j9] = 1;
    				Test[i10][j10] = 2;
    				Test[i11][j11] = 3;
    				Test[i12][j12] = 4;
			}else if(t == 3){  // Permutation [23][1]: no internal index exchange
    				Test[i5][j5] = 9;
    				Test[i6][j6] = 10;
    				Test[i7][j7] = 11;
    				Test[i8][j8] = 12;
    				Test[i9][j9] = 5;
    				Test[i10][j10] = 6;
    				Test[i11][j11] = 7;
    				Test[i12][j12] = 8;
   			}else if(t == 4){  //  Permutation [123]: no internal index exchange
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
    			}else if(t == 5){ // Permutation [132]: no internal index exchange
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
    			};

//***************************************************************************************************
// 	Implementation of the 64 permutations of the indices within each vertex (internal permutations)

   			for(i = 0; i <= 7; i++){
    				for(j = 0; j <= 1; j++){
     					if(Test[i][j] == 1){
						Temp[i][j][0] = 2;
					}else if(Test[i][j] == 2){
						Temp[i][j][0] = 1;
					}else if(Test[i][j] >= 3){ 
						Temp[i][j][0] = Test[i][j];  // Permutation pq
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
						Temp[i][j][1] = Test[i][j]; // Permutation pq rs
					};
     					if(Test[i][j] == 3){
						Temp[i][j][2] = 4;
					}else if(Test[i][j] == 4){
						Temp[i][j][2] = 3;
					}else if(Test[i][j] >= 5 || Test[i][j] <=  2){ 
      						Temp[i][j][2] = Test[i][j];  // Permutation rs
					};
     					if(Test[i][j] == 5){
						Temp[i][j][3] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][3] = 5;
     					}else if(Test[i][j] >= 7 || Test[i][j] <=  4){ 
      						Temp[i][j][3] = Test[i][j]; // Permutation tu
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
      						Temp[i][j][4] = Test[i][j]; // Permutation tu vw
     					};
					if(Test[i][j] == 8){
						Temp[i][j][5] = 7;
     					}else if(Test[i][j] == 7){ 
						Temp[i][j][5] = 8;
					}else if(Test[i][j] >= 9 || Test[i][j] <=  6){ 
      						Temp[i][j][5] = Test[i][j];   // Permutation vw 
					};
     					if(Test[i][j] == 9){ 
						Temp[i][j][6] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][6] = 9;
     					}else if(Test[i][j] >= 11 || Test[i][j] <=  8){ 
      						Temp[i][j][6] = Test[i][j];   // Permutation kl 
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
      						Temp[i][j][7] = Test[i][j];   // Permutation kl mn 
     					}
					if(Test[i][j] == 11){
						Temp[i][j][8] = 12;
     					}else if(Test[i][j] == 12){ 
						Temp[i][j][8] = 11;
     					}else if(Test[i][j] >= 13 || Test[i][j] <=  10){ 
      						Temp[i][j][8] = Test[i][j];   // Permutation mn
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
      						Temp[i][j][9] = Test[i][j]; // Permutation pq | tu 
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
      						Temp[i][j][10] = Test[i][j]; // Permutation pq | tu vw 
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
       						Temp[i][j][11] = Test[i][j];   // Permutation pq | vw 
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
      						Temp[i][j][12] = Test[i][j]; // Permutation pq | kl 
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
      						Temp[i][j][13] = Test[i][j]; // Permutation pq | kl mn 
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
      						Temp[i][j][14] = Test[i][j]; // Permutation pq | mn 
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
						Temp[i][j][15] = Test[i][j]; // Permutation pq rs | tu
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
						Temp[i][j][16] = Test[i][j];  // Permutation pq rs | tu vw 
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
      						Temp[i][j][17] = Test[i][j];  // Permutation pq rs | vw 
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
      						Temp[i][j][18] = Test[i][j];  // Permutation pq rs | kl 
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
      						Temp[i][j][19] = Test[i][j];  // Permutation pq rs | kl mn 
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
      						Temp[i][j][20] = Test[i][j];  // Permutation pq rs | mn
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
      						Temp[i][j][21] = Test[i][j];  // Permutation rs | tu
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
      						Temp[i][j][22] = Test[i][j];   // Permutation rs | tu vw 
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
						Temp[i][j][23] = Test[i][j];  // Permutation rs | vw 
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
						Temp[i][j][24] = Test[i][j];  // Permutation rs | kl 
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
						Temp[i][j][25] = Test[i][j];  // Permutation rs | kl mn 
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
						Temp[i][j][26] = Test[i][j];  // Permutation rs | mn 
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
						Temp[i][j][27] = Test[i][j];  // Permutation pq | tu | kl 
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
						Temp[i][j][28] = Test[i][j];  // Permutation pq | tu | kl mn
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
						Temp[i][j][29] = Test[i][j];  // Permutation pq | tu | mn 
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
      						Temp[i][j][30] = Test[i][j];  // Permutation pq | tu vw | kl
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
      						Temp[i][j][31] = Test[i][j];  // Permutation pq | tu vw | kl mn 
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
						Temp[i][j][32] = Test[i][j];  // Permutation pq | tu vw | mn
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
						Temp[i][j][33] = Test[i][j];  // Permutation pq | vw | kl
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
						Temp[i][j][34] = Test[i][j];  // Permutation pq | vw | kl mn 
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
						Temp[i][j][35] = Test[i][j];  // Permutation pq | vw | mn
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
						Temp[i][j][36] = Test[i][j];  // Permutation pq rs | tu | kl 
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
      						Temp[i][j][37] = Test[i][j];  // Permutation pq rs | tu | kl mn
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
      						Temp[i][j][38] = Test[i][j];  // Permutation pq rs | tu | mn
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
						Temp[i][j][39] = Test[i][j];  // Permutation pq rs | tu vw | kl 
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
						Temp[i][j][40] = Test[i][j];  // Permutation pq rs | tu vw | kl mn
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
      						Temp[i][j][41] = Test[i][j];  // Permutation pq rs | tu vw | mn 
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
      						Temp[i][j][42] = Test[i][j];  // Permutation pq rs | vw | kl 
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
      						Temp[i][j][43] = Test[i][j];  // Permutation pq rs | vw | kl mn
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
						Temp[i][j][44] = Test[i][j];  // Permutation pq rs | vw | mn
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
						Temp[i][j][45] = Test[i][j];  //   Permutation rs | tu | kl 
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
						Temp[i][j][46] = Test[i][j];  // Permutation rs | tu | kl mn
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
						Temp[i][j][47] = Test[i][j];  // Permutation rs | tu | mn
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
      						Temp[i][j][48] = Test[i][j];  // Permutation rs | tu vw | kl
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
      						Temp[i][j][49] = Test[i][j];  // Permutation rs | tu vw | kl mn
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
						Temp[i][j][50] = Test[i][j];  // Permutation rs | tu vw | mn
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
						Temp[i][j][51] = Test[i][j];  // Permutation rs | vw | kl
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
						Temp[i][j][52] = Test[i][j];  // Permutation rs | vw | kl mn
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
						Temp[i][j][53] = Test[i][j];  // Permutation rs | vw | mn 
     					};
					Temp[i][j][54] = Test[i][j];  // nessuna Permutation
    					if(Test[i][j] == 5){
						Temp[i][j][55] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][55] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][55] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][55] = 9;
     					}else if(Test[i][j] >= 11 || (Test[i][j] >= 7 && Test[i][j] <= 8) || Test[i][j] <= 4){
						Temp[i][j][55] = Test[i][j];  // Permutation tu | kl
					};
    					if(Test[i][j] == 5){
						Temp[i][j][56] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][56] = 5;
     					}else if(Test[i][j] == 9){
						Temp[i][j][56] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][56] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][56] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][56] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 8) || Test[i][j] <= 4){
						Temp[i][j][56] = Test[i][j];  // Permutation tu | kl mn
					};
    					if(Test[i][j] == 5){
						Temp[i][j][57] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][57] = 5;
     					}else if(Test[i][j] == 11){
						Temp[i][j][57] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][57] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 7 && Test[i][j] <= 10) || Test[i][j] <= 4){
						Temp[i][j][57] = Test[i][j];  // Permutation tu | mn
					};
    					if(Test[i][j] == 5){
						Temp[i][j][58] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][58] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][58] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][58] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][58] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][58] = 9;
     					}else if(Test[i][j] >= 11 || Test[i][j] <= 4){
						Temp[i][j][58] = Test[i][j];  // Permutation tu uw | kl
					};
    					if(Test[i][j] == 5){
						Temp[i][j][59] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][59] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][59] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][59] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][59] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][59] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][59] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][59] = 11;
     					}else if(Test[i][j] >= 13 || Test[i][j] <= 4){
						Temp[i][j][59] = Test[i][j];  // Permutation tu uw | kl mn
					};
    					if(Test[i][j] == 5){
						Temp[i][j][60] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][60] = 5;
    					}else if(Test[i][j] == 7){
						Temp[i][j][60] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][60] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][60] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][60] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 9 && Test[i][j] <= 10) || Test[i][j] <= 4){
						Temp[i][j][60] = Test[i][j];  // Permutation tu uw | mn
					};
    					if(Test[i][j] == 7){
						Temp[i][j][61] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][61] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][61] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][61] = 9;
     					}else if(Test[i][j] >= 11 || Test[i][j] <= 6){
						Temp[i][j][61] = Test[i][j];  // Permutation uw | kl
					};
    					if(Test[i][j] == 7){
						Temp[i][j][62] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][62] = 7;
     					}else if(Test[i][j] == 9){
						Temp[i][j][62] = 10;
     					}else if(Test[i][j] == 10){
						Temp[i][j][62] = 9;
     					}else if(Test[i][j] == 11){
						Temp[i][j][62] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][62] = 11;
     					}else if(Test[i][j] >= 13 || Test[i][j] <= 6){
						Temp[i][j][62] = Test[i][j];  // Permutation uw | kl mn
					};
    					if(Test[i][j] == 7){
						Temp[i][j][63] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][63] = 7;
     					}else if(Test[i][j] == 11){
						Temp[i][j][63] = 12;
     					}else if(Test[i][j] == 12){
						Temp[i][j][63] = 11;
     					}else if(Test[i][j] >= 13 || (Test[i][j] >= 9 && Test[i][j] <= 10) || Test[i][j] <= 6){
						Temp[i][j][63] = Test[i][j];  // Permutation uw | mn
					};
				};
			};

//**********************************************************************************************
// 	Sorting of the indices in ascending order from left to right within the pairs

   			for(i = 0; i <= 63; i++){
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

			int Temp1[64];
			int Temp2[64];
			int Temp3[64];
			int Temp4[64];
			int Temp5[64];
			int Temp6[64];
			int Temp7[64];
			int Temp8[64];
			int Temp9[64];
			int Temp10[64];
			int Temp11[64];
			int Temp12[64];
			int Temp13[64];
			int Temp14[64];
			int Temp15[64];
			int Temp16[64];
   
			int Avert1[s];
			int Avert2[s];
			int Avert3[s];
			int Avert4[s];
			int Avert5[s];
			int Avert6[s];
			int Avert7[s];
			int Avert8[s];
			int Avert9[s];
			int Avert10[s];
			int Avert11[s];
			int Avert12[s];
			int Avert13[s];
			int Avert14[s];
			int Avert15[s];
			int Avert16[s];

			for(k=0; k<=63; k++){
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
				Avert1[v] = AdcdlVertices[0][0][v];
				Avert2[v] = AdcdlVertices[0][1][v];
				Avert3[v] = AdcdlVertices[1][0][v];
				Avert4[v] = AdcdlVertices[1][1][v];
				Avert5[v] = AdcdlVertices[2][0][v];
				Avert6[v] = AdcdlVertices[2][1][v];
				Avert7[v] = AdcdlVertices[3][0][v];
				Avert8[v] = AdcdlVertices[3][1][v];
				Avert9[v] = AdcdlVertices[4][0][v];
				Avert10[v] = AdcdlVertices[4][1][v];
				Avert11[v] = AdcdlVertices[5][0][v];
				Avert12[v] = AdcdlVertices[5][1][v];
				Avert13[v] = AdcdlVertices[6][0][v];
				Avert14[v] = AdcdlVertices[6][1][v];
				Avert15[v] = AdcdlVertices[7][0][v];
				Avert16[v] = AdcdlVertices[7][1][v];
			};
		
			IfRepeat = false;

//**********************************************************************************************
// 	Test of equivalence: the fully-contracted term "Test[][]" undergoes 64 index permutations, each of them is 
// 	compared with the "s" inequivalent contractions, already stored. 

			for(v = 0; v<=s-1; v++){

     				for(i = 0; i <= 63; i++){
       					for(j = 0; j <= 7; j++){
        					IfTemp[i][j] = 0;
					};
						aux_repeat[i] = 0;						
				};

      		
      				for(j = 0; j <= 63; j++){
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
					};
				};

				if(IfRepeat == true){
					MultdcdlVertices[v] = MultdcdlVertices[v] + max(1,MultdcdlTemp[u]);				
					break;
				};


			};

	
			if(IfRepeat == false){
				s++; 
				for(i=0; i<=7; i++){
					for(j=0; j<=1; j++){
    						AdcdlVertices[i][j][s-1] = AdcdlTemp[i][j][u];
					};
				};
				MultdcdlVertices[s-1] = max(1,MultdcdlTemp[u]);
			};

			if(u%500 == 0){
				printf("     Loop %ld completed and %ld inequivalent elements found.    \n",u,s-1);
			};

		};
	
		printf("								 \n");
		printf("        Permutation of vertices %ld: iterations completed.        \n",t+1);
		printf("								 \n");
		printf("*****************************************************************\n");
		printf("								 \n");

	};

//**********************************************************************************************
// Multiplicity check

	long int Multiplicity;

	Multiplicity = 0;
	for(u = 0; u <= s-1; u++){
		Multiplicity = Multiplicity + MultdcdlVertices[u];
	};

	if(Multiplicity == S){
		printf("                  Filtering process successful:                  \n");
		printf("								 \n");
	}else{
		printf("                   Filtering process failed:                     \n");
		printf("                      Multiplicity = %ld                      \n",Multiplicity);
		printf("              Initial fully-contracted terms = %d.                \n",S);
	};
		printf("               %ld inequivalent elements found.               \n",s);
		printf("								 \n");
		printf("*****************************************************************\n");

//**********************************************************************************************

	FILE * MultFile;

	MultFile = fopen(multfilepath,"w+");

	for(u = 0; u <= s-1; u++){

		fprintf(MultFile,"GGFMult[[%ld]] = %d;\n",u+1,MultdcdlVertices[u]);

	};

	fclose(MultFile);

	FILE * CombFile;

	CombFile = fopen(combfilepath,"w+");

	for(u = 0; u <= s-1; u++){

		fprintf(CombFile,"CombDirLeft[[%ld]] = {{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d}};\n",
		u+1,AdcdlVertices[0][0][u],AdcdlVertices[0][1][u],AdcdlVertices[1][0][u],AdcdlVertices[1][1][u],AdcdlVertices[2][0][u],
		AdcdlVertices[2][1][u],AdcdlVertices[3][0][u],AdcdlVertices[3][1][u],AdcdlVertices[4][0][u],AdcdlVertices[4][1][u],
		AdcdlVertices[5][0][u],AdcdlVertices[5][1][u],AdcdlVertices[6][0][u],AdcdlVertices[6][1][u],AdcdlVertices[7][0][u],
 		AdcdlVertices[7][1][u]);

	};
	
	fclose(CombFile);
	
	return 0;


};
			

//**************************************************

