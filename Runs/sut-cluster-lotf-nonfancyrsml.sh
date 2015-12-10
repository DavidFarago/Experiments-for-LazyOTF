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

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=200:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
}

testrun() {
    # Default values
    D_SAMPLESIZE=2
    D_ARGMIN=1
    D_ARGMAX=3

    D_STEPCEIL=40000000
   submitjob sut-lotf-nonfancyrsml.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}


defaultrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob sut-lotf-nonfancyrsml.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

THERUNS=1
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  #testrun
  defaultrun
  THECOUNT=`expr $THECOUNT + 1`
done
