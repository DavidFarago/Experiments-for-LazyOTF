#!/home/farago/bin/dash

# $1 = paralleleINSTANCES
# $2 = experimentiterationanzahl
pInst=$1 
maxCount=$2

count=1

while [ $count -le $maxCount ]
do

  x=`qstat | grep farago`
  while [ "$x" != "" ]
  do
    sleep 10
    x=`qstat | grep farago`
  done

  echo qsubing experIter $count 
  qsub -N dist_lotf_cov -o /home/farago/experimentsTMP -e /home/farago/experimentsTMP-err -V -v "INSTANCES=$pInst,ARGMIN=3,ARGMAX=3,SIZE=1,STEPCEIL=100000,EXECSCRIPT=/raid/farago/Experiments/Runs/innerExec.sh,TOS=Gen3_CovWithoutRSML.jtorx" -l walltime=12:00:00,nodes=$pInst:ppn=1 Cluster_ExecExp_pbsdsh.sh

  count=`expr $count + 1`
done

#PBS -l walltime=12:00:00,nodes=1:ppn=4
#PBS -N MUDP_Cov
#PBS -o /home/farago/lotf-rsml 
#PBS -e /home/farago/lotf-rsml-err 
#PBS -V 

#./Gen3_Cov_LazyOTF_JTorxPathHack.sh 4 4 1000 10 &
#./Gen3_Cov_LazyOTF_JTorxPathHack.sh 4 4 1000 10 &
#./Gen3_Cov_LazyOTF_JTorxPathHack.sh 4 4 1000 10 &
#./Gen3_Cov_LazyOTF_JTorxPathHack.sh 4 4 1000 10 &

#param 1 = INSTANCES
#param 2 = SIZE = #experiments

#qsub -N lotf-rsml -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=30,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_Dec_LazyOTF.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-rsml -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=30,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_Dec_LazyOTF.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-rsml -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=30,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_Cov_LazyOTF.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
#qsub -N lotf-rsml -o /home/farago/lotf-rsml -e /home/farago/lotf-rsml-err -V -v "ARGMIN=1,ARGMAX=10,SIZE=30,STEPCEIL=100000,EXPERIMENT=/raid/farago/Experiments/Runs/Gen3_RSML_Cov_Dec_LazyOTF.sh" -l walltime=12:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
