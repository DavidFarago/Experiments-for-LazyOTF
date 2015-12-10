#!/bin/bash
qsub -N jtorx-rsml-part10 -o /home/farago/jtorx-rsml-part1 -e /home/farago/jtorx-rsml-lowerpart-err -V -v "ARGMIN=10,ARGMAX=10,SIZE=7,STEPCEIL=15000000,EXPERIMENT=/raid/farago/Experiments/Runs/JTorX_RSML.sh" -l walltime=24:00:00,nodes=1:ppn=2 Cluster_ExecExp.sh

