#!/bin/bash

BASEDIR=`pwd`
MAXJOBS=2
SIGNATURE="cyc2"
TR=$1

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

    qsub -N $NAME$TR -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TR=$TR" -l walltime=96:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
}

defaultrunnfrsml() {
    submitjob me-lotf-nonfancyrsml-cyc2.sh 1 3 5 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 4 4 5 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 5 5 5 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 6 6 5 4000000
    sleep 1
    submitjob me-lotf-nonfancyrsml-cyc2.sh 7 7 3 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 7 7 2 4000000
    sleep 1
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    sleep 1
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
}

defaultrunliccov() {
    submitjob me-lotf-liccov-cyc2.sh 1 3 5 4000000
    submitjob me-lotf-liccov-cyc2.sh 4 4 5 4000000
    submitjob me-lotf-liccov-cyc2.sh 5 5 5 4000000
    submitjob me-lotf-liccov-cyc2.sh 6 6 5 4000000
    sleep 1
    submitjob me-lotf-liccov-cyc2.sh 7 7 3 4000000
    submitjob me-lotf-liccov-cyc2.sh 7 7 2 4000000
    sleep 1
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    sleep 1
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
}

shortrunsliccov() {
    submitjob me-lotf-liccov-cyc2.sh 1 3 5 4000000
    submitjob me-lotf-liccov-cyc2.sh 4 4 5 4000000
    submitjob me-lotf-liccov-cyc2.sh 5 5 5 4000000
    submitjob me-lotf-liccov-cyc2.sh 6 6 5 4000000
    sleep 1
    submitjob me-lotf-liccov-cyc2.sh 7 7 3 4000000
    submitjob me-lotf-liccov-cyc2.sh 7 7 2 4000000
}


shortrunsnfrsml() {
    submitjob me-lotf-nonfancyrsml-cyc2.sh 1 3 5 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 4 4 5 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 5 5 5 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 6 6 5 4000000
    sleep 1
    submitjob me-lotf-nonfancyrsml-cyc2.sh 7 7 3 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 7 7 2 4000000
}

eightrunnfrsml() {
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 8 8 1 4000000
}

eightrunliccov() {
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 8 8 1 4000000
}

longrunliccov() {
    submitjob me-lotf-liccov-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-liccov-cyc2.sh 10 10 1 4000000
}

longrunnfrsml() {
    submitjob me-lotf-nonfancyrsml-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 9 9 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 10 10 1 4000000
    submitjob me-lotf-nonfancyrsml-cyc2.sh 10 10 1 4000000
}

shortrunsnfrsml
shortrunsliccov
eightrunnfrsml
eightrunliccov
longrunnfrsml
longrunliccov
