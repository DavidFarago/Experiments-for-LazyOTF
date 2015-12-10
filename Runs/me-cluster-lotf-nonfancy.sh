#!/bin/bash

BASEDIR=`pwd`
MAXJOBS=24
SIGNATURE="NON"

wait_for_free_job() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge $MAXJOBS ]
    do
	sleep 30
	USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    done
}

submitjob() {
    wait_for_free_job
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5

    NAME=`basename $EXPERIMENT`.$SIGNATURE$AARGMAX

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=200:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
}
# bis maxportion 10: walltime=96:00:00

defaultrun() {
shortruns
shortruns
shortruns
eightrun
eightrun
eightrun
longrun
longrun
longrun
#    submitjob me-lotf-nonfancyrsml.sh 1 3 5 4000000
#    submitjob me-lotf-nonfancyrsml.sh 4 4 5 4000000
#    submitjob me-lotf-nonfancyrsml.sh 5 5 5 4000000
#    submitjob me-lotf-nonfancyrsml.sh 6 6 5 4000000
#    sleep 1
#    submitjob me-lotf-nonfancyrsml.sh 7 7 3 4000000
#    submitjob me-lotf-nonfancyrsml.sh 7 7 2 4000000
#    sleep 1
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    sleep 1
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
#    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
}

defaultrun1024() {
    submitjob me-lotf-nonfancyrsml.sh 1024 1024 1 9999999
}

shortruns() {
    submitjob me-lotf-nonfancyrsml.sh 1 3 5 4000000
    submitjob me-lotf-nonfancyrsml.sh 4 4 5 4000000
    submitjob me-lotf-nonfancyrsml.sh 5 5 5 4000000
    submitjob me-lotf-nonfancyrsml.sh 6 6 5 4000000
    sleep 1
    submitjob me-lotf-nonfancyrsml.sh 7 7 3 4000000
    submitjob me-lotf-nonfancyrsml.sh 7 7 2 4000000
}

eightrun() {
    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 8 8 1 4000000
}

longrun() {
    submitjob me-lotf-nonfancyrsml.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml.sh 9 9 1 4000000
}

defaultrun



