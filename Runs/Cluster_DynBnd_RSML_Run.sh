#!/bin/bash
#qsub -N jtorx-dynb-r2t6 -o /home/farago/jtorx-rsml-part1 -e /home/farago/jtorx-rsml-lowerpart-err -V -v "ARGMIN=2,ARGMAX=6,SIZE=30,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_DynamicBound_RSML.sh" -l walltime=10:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
qsub -N jtorx-dynb-r7 -o /home/farago/jtorx-rsml-part1 -e /home/farago/jtorx-rsml-lowerpart-err -V -v "ARGMIN=7,ARGMAX=7,SIZE=30,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_DynamicBound_RSML.sh" -l walltime=10:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
qsub -N jtorx-dynb-r8 -o /home/farago/jtorx-rsml-part1 -e /home/farago/jtorx-rsml-lowerpart-err -V -v "ARGMIN=8,ARGMAX=8,SIZE=30,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_DynamicBound_RSML.sh" -l walltime=10:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
qsub -N jtorx-dynb-r9 -o /home/farago/jtorx-rsml-part1 -e /home/farago/jtorx-rsml-lowerpart-err -V -v "ARGMIN=9,ARGMAX=9,SIZE=30,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_DynamicBound_RSML.sh" -l walltime=10:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
qsub -N jtorx-dynb-r10 -o /home/farago/jtorx-rsml-part1 -e /home/farago/jtorx-rsml-lowerpart-err -V -v "ARGMIN=10,ARGMAX=10,SIZE=30,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_DynamicBound_RSML.sh" -l walltime=10:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

