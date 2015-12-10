#!/bin/bash

BASEDIR=`pwd`

# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5

    NAME=`basename $EXPERIMENT`

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=50:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
}

testrun() {
    # Default values
    D_SAMPLESIZE=2
    D_ARGMIN=1
    D_ARGMAX=3

    D_STEPCEIL=40000000
#    submitjob sut-lotf-rsml.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-liccov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL     
   submitjob sut-lotf-cov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}


defaultrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob sut-lotf-rsml.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL

#    submitjob sut-lotf-liccov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL    
#    submitjob sut-lotf-cov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-rsml-cov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-rsml-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-rsml-cov-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

decrun() {
    D_SAMPLESIZE=1
    D_ARGMIN=1
    D_ARGMAX=1

    D_STEPCEIL=40000000

    submitjob sut-lotf-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-rsml-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob sut-lotf-rsml-cov-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}


THERUNS=20
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  defaultrun
  #decrun
  THECOUNT=`expr $THECOUNT + 1`
done
