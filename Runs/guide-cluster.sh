#!/bin/bash

BASEDIR=`pwd`
MAXJOBS=8
SIGNATURE="GDE"

wait_for_free_job() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge $MAXJOBS ]
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

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=48:00:00,nodes=1:ppn=8 Cluster_ExecExp.sh
}


defaultrun() {
    echo Guide Default Run

    # Default values
    D_SAMPLESIZE=30
    D_STEPCEIL=40000000

    echo Launching: Guide-JTorX-RSML
    submitjob guide-jtorx-rsml.sh 1 10 $D_SAMPLESIZE $D_STEPCEIL
    submitjob guide-jtorx-rsml.sh 1 10 $D_SAMPLESIZE $D_STEPCEIL
    submitjob guide-jtorx-rsml.sh 1 10 $D_SAMPLESIZE $D_STEPCEIL
}

defaultrun

#wait_for_finish() {
#    QSTAT="foo"
#    while [ "$QSTAT" != "" ]
#    do
#	sleep 30;
#	QSTAT=`(qstat | grep farago)`
#    done
#}

# standard_multisubmit EXPSCRIPTRELPATH STEPCEILING
#standard_multisubmit() {
#    D_STEPCEIL=$2
#    submitjob $1 1 6 6 $D_STEPCEIL
#    submitjob $1 7 7 6 $D_STEPCEIL
#    submitjob $1 8 8 3 $D_STEPCEIL
#    submitjob $1 8 8 3 $D_STEPCEIL
#    submitjob $1 9 9 2 $D_STEPCEIL
#    submitjob $1 9 9 2 $D_STEPCEIL
#    submitjob $1 9 9 2 $D_STEPCEIL
#    submitjob $1 10 10 1 $D_STEPCEIL
#    submitjob $1 10 10 1 $D_STEPCEIL
#    submitjob $1 10 10 1 $D_STEPCEIL
#    submitjob $1 10 10 1 $D_STEPCEIL
#    submitjob $1 10 10 1 $D_STEPCEIL
#    submitjob $1 10 10 1 $D_STEPCEIL
#}
#
#granular_multisubmit() {
#    D_STEPCEIL=$2
#    submitjob $1 1 2 6 $D_STEPCEIL
#    submitjob $1 3 3 1 $D_STEPCEIL
#    submitjob $1 3 3 1 $D_STEPCEIL
#    submitjob $1 3 3 1 $D_STEPCEIL
#    submitjob $1 3 3 1 $D_STEPCEIL
#    submitjob $1 3 3 1 $D_STEPCEIL
#    submitjob $1 3 3 1 $D_STEPCEIL
#    submitjob $1 4 4 1 $D_STEPCEIL
#    submitjob $1 4 4 1 $D_STEPCEIL
#    submitjob $1 4 4 1 $D_STEPCEIL
#    submitjob $1 4 4 1 $D_STEPCEIL
#    submitjob $1 4 4 1 $D_STEPCEIL
#    submitjob $1 4 4 1 $D_STEPCEIL
#}
