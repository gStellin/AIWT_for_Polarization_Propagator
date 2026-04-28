#!/bin/bash
#MSUB -q xlarge
#MSUB -c 1
#MSUB -n 1
#MSUB -m work
#MSUB -r GPU_Job
#MSUB -A gen13012
#MSUB -T 86400
#MSUB -o GPU_Disconnected_3_Int_V2U_%I.txt              
#MSUB -e GPU_Disconnected_3_Int_V2U_%I.e
####set -x
module load cuda
ccc_mprun ./Filter_PolProp_3_Disconnected_Int_V2U
