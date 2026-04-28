#!/bin/bash
#MSUB -q xlarge
#MSUB -c 1
#MSUB -n 1
#MSUB -A gen13012
#MSUB -T 28800
#MSUB -o CPU_ConjComp_3_Int_V2U_%I.o
#MSUB -e CPU_ConjComp_3_Int_V2U_%I.e
####set -x
ccc_mprun ./Filter_PolProp_3_ConjComp_Int_V2U
