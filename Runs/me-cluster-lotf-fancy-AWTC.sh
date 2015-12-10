#!/bin/bash

BASEDIR=`pwd`
AWTC=$1Tree2Weight

MAXJOBS=17
SIGNATURE="AWTC.sh"
wait_for_last_job() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge $MAXJOBS ]
    do
	sleep 60
	USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    done
}

# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    wait_for_last_job
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5

    NAME=`basename $EXPERIMENT $AWTC`

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=$AWTC" -l walltime=550:00:00,nodes=1:ppn=8 Cluster_ExecExp_16Gig.sh
}

testrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=1
    D_ARGMAX=3

    D_STEPCEIL=40000000
    submitjob me-lotf-liccov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
}

defaultrun() {
    # Default values
    D_SAMPLESIZE=1 #10
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=2147483640 #40000000

    submitjob me-lotf-liccov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-cov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-cov-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL

#    submitjob me-lotf-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
#    submitjob me-lotf-rsml-cov-dec-AWTC.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL
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

THERUNS=100
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  defaultrun
  THECOUNT=`expr $THECOUNT + 1`
done
