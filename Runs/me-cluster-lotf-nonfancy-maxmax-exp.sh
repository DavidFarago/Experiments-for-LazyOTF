#!/bin/bash

BASEDIR=`pwd`
AWTC=MaxMaxTree2Weight

# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5

    NAME=`basename $EXPERIMENT $AWTC`

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=$AWTC" -l walltime=250:00:00,nodes=1:ppn=1 Cluster_ExecExp_16Gig.sh
}

testrun() {
    # Default values
    D_SAMPLESIZE=2
    D_ARGMIN=1
    D_ARGMAX=3

    D_STEPCEIL=40000000
    submitjob me-lotf-liccov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

defaultrun() {
    # Default values
    D_SAMPLESIZE=1 #10
    D_ARGMIN=10 #1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-liccov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-cov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-cov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL

#    submitjob me-lotf-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-cov-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

defaultrun1024() {
    D_SAMPLESIZE=1 
    D_ARGMIN=1024
    D_ARGMAX=1024

    D_STEPCEIL=2147483640

    submitjob me-lotf-liccov-exp.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-nonfancyrsml-exp.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL

}

decrun() {
    D_SAMPLESIZE=15
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-cov-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

THERUNS=1
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  defaultrun1024
  THECOUNT=`expr $THECOUNT + 1`
done
