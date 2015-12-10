#!/bin/bash

BASEDIR=`pwd`
MAXJOBS=16
SIGNATURE="EXP"

wait_for_free_job() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge $MAXJOBS ]
    do
	sleep 30
	USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    done
}

wait_for_finish() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge "1" ]
    do
	sleep 30
	USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    done
}


# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    wait_for_free_job

    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5

    NAME=`basename $EXPERIMENT`.$SIGNATURE$AARGMAX

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=24:00:00,nodes=1:ppn=1,mem=5gb Cluster_ExecExp.sh
}

defaultrun() {
    # Default values
    D_SAMPLESIZE=10
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-rsml-exponential.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

bonustrack() {
    D_SAMPLESIZE=5
    D_ARGMIN=11
    D_ARGMAX=11

    D_STEPCEIL=40000000

    count="1"
    while [ $count -le "18" ]
    do
	submitjob me-lotf-rsml-exponential.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
	sleep 1
	count=`expr $count + 1`
    done
}

bonustrack

wait_for_finish
date





#submitjob me-lotf-rsml.sh 1 2 10 10000
