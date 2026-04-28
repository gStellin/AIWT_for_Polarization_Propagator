#!/bin/bash
#MSUB -q xlarge
#MSUB -c 1
#MSUB -n 1
#MSUB -m work
#MSUB -r GPU_Job
#MSUB -A gen13012
#MSUB -T 86400
#MSUB -o GPU_ConjComp_3_Int_V3_%I.txt              
#MSUB -e GPU_ConjComp_3_Int_V3_%I.e
####set -x
module load cuda
ccc_mprun ./Filter_PolProp_3_ConjComp_Compl_Int_V3
