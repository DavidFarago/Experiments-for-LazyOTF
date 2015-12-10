#!/bin/bash
qsub -N jtorx-dec-part3t5 -o /home/farago/jtorx-dec-part1t6 -e /home/farago/jtorx-dec-part1t8-err -V -v "ARGMIN=3,ARGMAX=6,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_Dec.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

#qsub -N jtorx-dec-part6 -o /home/farago/jtorx-dec-part6 -e /home/farago/jtorx-dec-part9-err -V -v "ARGMIN=7,ARGMAX=7,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_Dec.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

#qsub -N jtorx-dec-part7 -o /home/farago/jtorx-dec-part10 -e /home/farago/jtorx-dec-part-err -V -v "ARGMIN=8,ARGMAX=8,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_Dec.sh" -l walltime=30:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

#qsub -N jtorx-dec-part9 -o /home/farago/jtorx-dec-part9 -e /home/farago/jtorx-dec-part9-err -V -v "ARGMIN=9,ARGMAX=9,SIZE=10,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_Dec.sh" -l walltime=30:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

