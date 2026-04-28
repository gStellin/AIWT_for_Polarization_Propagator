#!/bin/bash
#MSUB -q xlarge
#MSUB -c 1
#MSUB -m work
#MSUB -n 1
#MSUB -r GPU_Job
#MSUB -A gen13012
#MSUB -T 86400
#MSUB -o GPU_DisjDirRight_Int_V3_%I.txt              
#MSUB -e GPU_DisjDirRight_Int_V3_%I.e
####set -x
module load cuda
ccc_mprun ./Filter_PolProp_3_DisjDirRight_Int_V3
