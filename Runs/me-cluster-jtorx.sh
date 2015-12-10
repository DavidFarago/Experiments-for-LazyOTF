#!/bin/bash

BASEDIR=`pwd`
MAXJOBS=50
SIGNATURE="JTJ"

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

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=48:00:00,nodes=1:ppn=1 Cluster_ExecExp.sh
}

#wait_for_finish() {
#    QSTAT="foo"
#    while [ "$QSTAT" != "" ]
#    do
#	sleep 30;
#	QSTAT=`(qstat | grep farago)`
#    done
#}

# standard_multisubmit EXPSCRIPTRELPATH STEPCEILING
standard_multisubmit() {
    D_STEPCEIL=$2
    submitjob $1 1 6 6 $D_STEPCEIL
    submitjob $1 7 7 6 $D_STEPCEIL
    submitjob $1 8 8 3 $D_STEPCEIL
    submitjob $1 8 8 3 $D_STEPCEIL
    submitjob $1 9 9 2 $D_STEPCEIL
    submitjob $1 9 9 2 $D_STEPCEIL
    submitjob $1 9 9 2 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
}

granular_multisubmit() {
    D_STEPCEIL=$2
    submitjob $1 1 2 6 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
}

standard_multisubmit4() {
    D_STEPCEIL=$2
    submitjob $1 1 6 4 $D_STEPCEIL
    submitjob $1 7 7 4 $D_STEPCEIL
    submitjob $1 8 8 2 $D_STEPCEIL
    submitjob $1 8 8 2 $D_STEPCEIL
    submitjob $1 9 9 1 $D_STEPCEIL
    submitjob $1 9 9 1 $D_STEPCEIL
    submitjob $1 9 9 1 $D_STEPCEIL
    submitjob $1 9 9 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
    submitjob $1 10 10 1 $D_STEPCEIL
}

granular_multisubmit4() {
    D_STEPCEIL=$2
    submitjob $1 1 2 4 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 3 3 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
    submitjob $1 4 4 1 $D_STEPCEIL
}


defaultrun() {
    echo JTorX Default Run

    # Default values
    D_SAMPLESIZE=4
    D_STEPCEIL=40000000

    echo Launching: COV
    standard_multisubmit4 me-jtorx-cov.sh $D_STEPCEIL
    sleep 5
    echo Launching: RSML
    standard_multisubmit4 me-jtorx-rsml.sh $D_STEPCEIL
    sleep 5
    echo Launching: RSML-COV
    standard_multisubmit4 me-jtorx-rsml-cov.sh $D_STEPCEIL
    sleep 5
    echo Launching: DEC
    granular_multisubmit4 me-jtorx-dec.sh $D_STEPCEIL
    sleep 5
    echo Launching: RSML-DEC
    granular_multisubmit4 me-jtorx-rsml-dec.sh $D_STEPCEIL
    sleep 5
    echo Launching: RSML-COV-DEC
    granular_multisubmit4 me-jtorx-rsml-cov-dec.sh $D_STEPCEIL
}

liccovrun() {
    submitjob me-jtorx-liccov.sh 3 5 1 10000000 #100000
#    submitjob me-jtorx-liccov.sh 6 7 1  5000000
#    submitjob me-jtorx-liccov.sh 8 8 1 10000000 
#    submitjob me-jtorx-liccov.sh 9 9 1 10000000 
#    submitjob me-jtorx-liccov.sh 10 10 1 10000000 
}

THERUNS=10
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  #defaultrun
  liccovrun
  THECOUNT=`expr $THECOUNT + 1`
done
