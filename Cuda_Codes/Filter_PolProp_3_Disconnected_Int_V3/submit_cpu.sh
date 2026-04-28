#!/bin/bash
#MSUB -q xlarge
#MSUB -c 1
#MSUB -n 1
#MSUB -m work
#MSUB -r CPU_Job
#MSUB -A gen13012
#MSUB -T 86400
#MSUB -o CPU_Disconnected_3_Int_V3_%I.txt              
#MSUB -e CPU_Disconnected_3_Int_V3_%I.e
####set -x

ccc_mprun ./Filter_PolProp_3_Disconnected_Int_V3

