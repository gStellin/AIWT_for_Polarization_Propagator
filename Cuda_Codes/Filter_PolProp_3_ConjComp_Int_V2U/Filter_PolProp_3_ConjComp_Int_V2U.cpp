#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <array>
#include <fstream> 

int main (){

	using namespace std;

//**********************************************************************************************
//	Definition of the constants

	#define S 48384 

	#define combfilepath "Out_Comb_3_ConjComp_V2U.m"
	#define multfilepath "Out_Mult_3_ConjComp_V2U.m"

//****************************************************************************
//	Initialization of the arrays

	int AcccVertices[7][2][S];
	int MultcccVertices[S];
	int AcccTemp[7][2][S];
	int MultcccTemp[S];
	int Temp[7][2][16];
	int Test[7][2];

	array<array<array<int,2>,7>,S> AconjComp;	

	long int s, t, u, v, i, j, k; 

	bool IfRepeat;
	long int aux_repeat[16];
	int IfTemp[16][7];

	long int nS;

	int i1, j1;
	int i2, j2;
	int i3, j3;
	int i4, j4;
	int i5, j5;
	int i6, j6;
	int i7, j7;
	int i8, j8;

	int t1, t2;

	#include "In_Comb_3_ConjComp_V2U.h"

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
	printf("      o f   f u l l y - c o n t r a c t e d   t e r m s		 \n");
	printf("								 \n");
	printf("     o f  C o n j o i n t   C o m p o s i t e   t y p e          \n");
	printf("								 \n");
	printf("*****************************************************************\n");
	printf("								 \n");

//**********************************************************************************************
//	Initialization of the multi dim. arrays for the original and filtered 
//	fully-contracted terms, together with their multiplicity

	for(t=0; t<= 1; t++){

		printf("         Permutation of vertices %ld: iterations started.         \n",t+1);
		printf("								 \n");
		
		if(t == 0){
			nS = S;
			for(u=0; u<=nS-1; u++){
				for(i=0; i<=6; i++){
					for(j=0; j<=1; j++){
						AcccTemp[i][j][u] = AconjComp[u][i][j];
					};
				};
				MultcccTemp[u] = 0;
				MultcccVertices[u] = 0;
			};
		}else{
			nS = s;
			for(u=0; u<=S-1; u++){
				for(i=0; i<=6; i++){
					for(j=0; j<=1; j++){
						AcccTemp[i][j][u] = AcccVertices[i][j][u];
					};
				};
				MultcccTemp[u] = MultcccVertices[u];
				MultcccVertices[u] = 0;
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
		MultcccVertices[0] = max(1,MultcccTemp[0]);

//**********************************************************************************************
//	Beginning of the main loop (fully-contracted term "u")

  		for(u = 1; u <= nS-1; u++){
   
   			for(i = 0; i <= 6; i++){
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
					Test[i][j] = AcccTemp[i][j][u];
 				};
			};

//**********************************************************************************************************
// 	Permutation of the vertices: 2 equivalent ways to perform the operation exist (external permutations)	

   			if(t == 0){ // Identity permutation [1][2]: no internal index exchange
    				Test[i1][j1] = 1;
    				Test[i2][j2] = 2;
    				Test[i3][j3] = 3;
    				Test[i4][j4] = 4;
    				Test[i5][j5] = 5;
    				Test[i6][j6] = 6;
    				Test[i7][j7] = 7;
    				Test[i8][j8] = 8;
			}else if(t == 1){ // Permutation [12]: no internal index exchange
    				Test[i1][j1] = 5;
    				Test[i2][j2] = 6;
    				Test[i3][j3] = 7;
    				Test[i4][j4] = 8;
    				Test[i5][j5] = 1;
    				Test[i6][j6] = 2;
    				Test[i7][j7] = 3;
    				Test[i8][j8] = 4;
			};

//***************************************************************************************************
//	Implementation of the 16 permutations of the indices within each vertex (internal permutations)
   
   			for(i = 0; i <= 6; i++){
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
     					if(Test[i][j] == 1){
						Temp[i][j][6] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][6] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][6] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][6] = 5;
     					}else if(Test[i][j] >= 7 || (Test[i][j] >= 3 && Test[i][j] <= 4)){
      						Temp[i][j][6] = Test[i][j]; // Permutation pq | tu 
					};
     					if(Test[i][j] == 1){
						Temp[i][j][7] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][7] = 1;
     					}else if(Test[i][j] == 5){
						Temp[i][j][7] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][7] = 5;
     					}else if(Test[i][j] == 8){ 
						Temp[i][j][7] = 7;
     					}else if(Test[i][j] == 7){ 
						Temp[i][j][7] = 8;
     					}else if(Test[i][j] >= 9 || (Test[i][j] >= 3 && Test[i][j] <= 4)){ 
      						Temp[i][j][7] = Test[i][j]; // Permutation pq | tu vw 
     					};
     					if(Test[i][j] == 1){
						Temp[i][j][8] = 2;
     					}else if(Test[i][j] == 2){
			 			Temp[i][j][8] = 1;
     			 		}else if(Test[i][j] == 8){
						Temp[i][j][8] = 7;
     					}else if(Test[i][j] == 7){ 
						Temp[i][j][8] = 8;
					}else if(Test[i][j] >= 9 || (Test[i][j] >= 3 && Test[i][j] <= 6)){
       						Temp[i][j][8] = Test[i][j];   // Permutation pq | vw 
					}; 
					if(Test[i][j] == 1){ 
						Temp[i][j][9] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][9] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][9] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][9] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][9] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][9] = 5;
     					}else if(Test[i][j] >= 7){
						Temp[i][j][9] = Test[i][j]; // Permutation pq rs | tu
					}; 
     					if(Test[i][j] == 1){
						Temp[i][j][10] = 2;
     					}else if(Test[i][j] == 2){ 
						Temp[i][j][10] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][10] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][10] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][10] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][10] = 5;
     					}else if(Test[i][j] == 7){
						Temp[i][j][10] = 8;
     					}else if(Test[i][j] == 8){
						Temp[i][j][10] = 7;
     					}else if(Test[i][j] >= 9){
						Temp[i][j][10] = Test[i][j];  // Permutation pq rs | tu vw 
     					};
					if(Test[i][j] == 1){
						Temp[i][j][11] = 2;
     					}else if(Test[i][j] == 2){
						Temp[i][j][11] = 1;
     					}else if(Test[i][j] == 3){
						Temp[i][j][11] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][11] = 3;
     					}else if(Test[i][j] == 8){
						Temp[i][j][11] = 7;
     					}else if(Test[i][j] == 7){
						Temp[i][j][11] = 8;
     					}else if(Test[i][j] >= 9 || (Test[i][j] >= 5 && Test[i][j] <= 6)){ 
      						Temp[i][j][11] = Test[i][j];  // Permutation pq rs | vw 
     					};
     					if(Test[i][j] == 3){
						Temp[i][j][12] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][12] = 3;
     					}else if(Test[i][j] == 5){
						Temp[i][j][12] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][12] = 5;
     					}else if(Test[i][j] >= 7 || Test[i][j] <= 2){ 
      						Temp[i][j][12] = Test[i][j];  // Permutation rs | tu
					};
     					if(Test[i][j] == 3){
						Temp[i][j][13] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][13] = 3;
     					}else if(Test[i][j] == 5){ 
						Temp[i][j][13] = 6;
     					}else if(Test[i][j] == 6){
						Temp[i][j][13] = 5;
     					}else if(Test[i][j] == 8){
						Temp[i][j][13] = 7;
     					}else if(Test[i][j] == 7){
						Temp[i][j][13] = 8;
     					}else if(Test[i][j] >= 9 || Test[i][j] <= 2){ 
      						Temp[i][j][13] = Test[i][j];   // Permutation rs | tu vw 
     					};
     					if(Test[i][j] == 3){
						Temp[i][j][14] = 4;
     					}else if(Test[i][j] == 4){
						Temp[i][j][14] = 3;
     					}else if(Test[i][j] == 8){
						Temp[i][j][14] = 7;
     					}else if(Test[i][j] == 7){
						Temp[i][j][14] = 8;
					}else if(Test[i][j] >= 9 || (Test[i][j] >= 5 && Test[i][j] <= 6) || Test[i][j] <= 2){
						Temp[i][j][14] = Test[i][j];  // Permutation rs | vw 
					};		
					Temp[i][j][15] = Test[i][j];  // no permutation 
				};
			};

//**********************************************************************************************
//	Sorting of the indices in ascending order from left to right within the pairs

   			for(i = 0; i <= 15; i++){
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
    			};

			int Temp1[16];
			int Temp2[16];
			int Temp3[16];
			int Temp4[16];
			int Temp5[16];
			int Temp6[16];
			int Temp7[16];
			int Temp8[16];
			int Temp9[16];
			int Temp10[16];
			int Temp11[16];
			int Temp12[16];
			int Temp13[16];
			int Temp14[16];
   
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

			for(k=0; k<=16; k++){
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
			};

			for(v=0; v<=s-1; v++){
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
			};
		
			IfRepeat = false;

//**********************************************************************************************
// 	Test of equivalence: the fully-contracted term "u" undergoes 64 index permutations, each of them is 
// 	compared with the "s" inequivalent fully-contracted terms, already stored. 

			for(v = 0; v<=s-1; v++){

     				for(i = 0; i <= 15; i++){
       					for(j = 0; j <= 6; j++){
        					IfTemp[i][j] = 0;
					};
					aux_repeat[i] = 0;						
				};

      		
       				for(j = 0; j <= 15; j++){
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
					};

    		
					if(IfTemp[j][0] + IfTemp[j][1] + IfTemp[j][2] + IfTemp[j][3] 
			 			+ IfTemp[j][4] + IfTemp[j][5] + IfTemp[j][6] == 7){
						aux_repeat[j] += 1; 
					};


					if(aux_repeat[j] > 0){
						IfRepeat = true;
						break;
					}
				};

				if(IfRepeat == true){
					MultcccVertices[v] = MultcccVertices[v] + max(1,MultcccTemp[u]);
					break;
				};


			};

//**********************************************************************************************

			if(IfRepeat == false){
				s++; 
				for(i=0; i<=6; i++){
					for(j=0; j<=1; j++){
    						AcccVertices[i][j][s-1] = AcccTemp[i][j][u];
					};
				};
				MultcccVertices[s-1] = max(1,MultcccTemp[u]);
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
	// Multiplicity check for the filtered fully-contracted terms

	long int Multiplicity;

	Multiplicity = 0;
	for(u = 0; u <= s-1; u++){
		Multiplicity = Multiplicity + MultcccVertices[u];
	};

	if(Multiplicity == S){
		printf("                  Filtering process successful:                  \n");
		printf("								 \n");
	}else{
		printf("                   Filtering process failed:                     \n");
		printf("                      Multiplicity = %ld                      \n",Multiplicity);
		printf("             Initial fully-contracted terms = %d.                \n",S);
	};
		printf("               %ld inequivalent elements found.               \n",s);
		printf("								 \n");
		printf("*****************************************************************\n");
		

//**********************************************************************************************
//	Generation of the output files 

	FILE * MultFile;

	MultFile = fopen(multfilepath,"w+");

	for(u = 0; u <= s-1; u++){

		fprintf(MultFile,"GGFMult[[%ld]] = %d;\n",u+1,MultcccVertices[u]);

	};

	fclose(MultFile);

	FILE * CombFile;

	CombFile = fopen(combfilepath,"w+");

	for(u = 0; u <= s-1; u++){

		fprintf(CombFile,"CombComp[[%ld]] = {{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d},{%d,%d}};\n",
		u+1,AcccVertices[0][0][u],AcccVertices[0][1][u],AcccVertices[1][0][u],AcccVertices[1][1][u],AcccVertices[2][0][u],
		AcccVertices[2][1][u],AcccVertices[3][0][u],AcccVertices[3][1][u],AcccVertices[4][0][u],AcccVertices[4][1][u],
		AcccVertices[5][0][u],AcccVertices[5][1][u],AcccVertices[6][0][u],AcccVertices[6][1][u]);

	};
	
	fclose(CombFile);
	
	return 0;


};


//**********************************************************************************************
