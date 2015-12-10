#!/bin/bash
qsub -N jtorx-rsml-cov-part1t8 -o /home/farago/jtorx-rsml-cov-part1t8 -e /home/farago/jtorx-rsml-cov-part1t8-err -V -v "ARGMIN=1,ARGMAX=8,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_RSML_Cov.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

qsub -N jtorx-rsml-cov-part9 -o /home/farago/jtorx-rsml-cov-part9 -e /home/farago/jtorx-rsml-cov-part9-err -V -v "ARGMIN=9,ARGMAX=9,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_RSML_Cov.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

qsub -N jtorx-rsml-cov-part10 -o /home/farago/jtorx-rsml-cov-part10 -e /home/farago/jtorx-rsml-cov-part10-err -V -v "ARGMIN=10,ARGMAX=10,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_RSML_Cov.sh" -l walltime=30:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

