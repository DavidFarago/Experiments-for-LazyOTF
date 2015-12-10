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

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=MaxTree2Weight" -l walltime=24:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
}

testrun() {
    # Default values
    D_SAMPLESIZE=2
    D_ARGMIN=1
    D_ARGMAX=3

    D_STEPCEIL=40000000
    submitjob me-lotf-rsml.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

defaultrun() {
    # Default values
    D_SAMPLESIZE=90
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-rsml.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-cov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-cov.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-cov-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

decrun() {
    D_SAMPLESIZE=15
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

#    submitjob me-lotf-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
    submitjob me-lotf-rsml-cov-dec.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

#testrun
#defaultrun
decrun

