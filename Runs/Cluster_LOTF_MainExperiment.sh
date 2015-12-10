#!/bin/bash
#qsub -N lotf_rsml -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=10,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_LazyOTF.sh" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-dec -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=10,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_Dec_LazyOTF.sh" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-rsml-dec -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=10,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_Dec_LazyOTF.sh" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-rsml-cov -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=10,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_Cov_LazyOTF.sh" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-rsml-cov-dec -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=10,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_Cov_Dec_LazyOTF.sh" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

qsub -N lotf_cov -o /home/farago/lotf-cov -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=1,SIZE=5,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_Cov_LazyOTF.sh" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh

