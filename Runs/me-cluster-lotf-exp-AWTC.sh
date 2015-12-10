#!/bin/bash

BASEDIR=`pwd`
AWTC=$1Tree2Weight

# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5

    NAME=`basename $EXPERIMENT`

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=$AWTC" -l walltime=300:00:00,nodes=1:ppn=1,mem=5gb Cluster_ExecExp.sh
}

defaultrun() {
    # Default values
    D_SAMPLESIZE=1 #10
    D_ARGMIN=1
    D_ARGMAX=9

    D_STEPCEIL=40000000

    submitjob me-lotf-rsml-exponential-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

largerun() {
    D_SAMPLESIZE=1 #10
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-rsml-exponential-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

decrun() {
    D_SAMPLESIZE=10
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-cov-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

THERUNS=10
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  defaultrun
  largerun
  THECOUNT=`expr $THECOUNT + 1`
done


#submitjob me-lotf-rsml.sh 1 2 10 10000
