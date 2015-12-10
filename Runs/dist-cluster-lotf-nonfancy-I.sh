#!/bin/bash

BASEDIR=`pwd`
#MINP=$1
#MAXP=$2
#ITER=$3
INSTANCES=$1

# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5
    AINSTANCES=$6

    NAME=`basename $EXPERIMENT`

    qsub -N ${NAME}I$AINSTANCES -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "INSTANCES=$AINSTANCES,ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=200:00:00,nodes=$AINSTANCES:ppn=1 Cluster_ExecExp_pbsdsh.sh
#ppn=8 : one instance per node name: P$AINSTANCES
#ppn=1 : one instance per processor: I$AINSTANCES
}

testrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=1
    D_ARGMAX=3

    D_STEPCEIL=40000000
    submitjob me-lotf-nonfancyrsml-I.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
}


defaultrun() {
    # Default values
    D_SAMPLESIZE=1 #10
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-nonfancyrsml-I.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
}

#testrun
defaultrun
