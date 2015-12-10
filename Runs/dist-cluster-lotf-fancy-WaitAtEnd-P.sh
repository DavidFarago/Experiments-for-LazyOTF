#!/bin/bash

BASEDIR=`pwd`
#MINP=$1
#MAXP=$2
#ITER=$3
INSTANCES=$1

MAXJOBS=1
SIGNATURE="P.sh"
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
    AINSTANCES=$6

    NAME=`basename $EXPERIMENT`

#todo: generate outputid here, so that all instances use same id!?
    qsub -N ${NAME}P$AINSTANCES -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "INSTANCES=$AINSTANCES,ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=200:00:00,nodes=$AINSTANCES:ppn=8 Cluster_ExecExp_pbsdsh.sh
#ppn=8 : one instance per node
#ppn=1 : one instance per processor
#,host=!cn20 : exclude cn20 <- does not work :(
}

testrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=1
    D_ARGMAX=1

    D_STEPCEIL=40000000
    submitjob me-lotf-rsml-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
}

defaultrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=40000000

#    submitjob me-lotf-rsml-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
    submitjob me-lotf-cov-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
#    submitjob me-lotf-rsml-cov-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
#    submitjob me-lotf-liccov-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
}

defaultrun1024() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=1024
    D_ARGMAX=1024

    D_STEPCEIL=40000000

#    submitjob me-lotf-rsml-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
    submitjob me-lotf-rsml-WaitAtEnd-WExpiredInd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
    submitjob me-lotf-cov-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
#    submitjob me-lotf-rsml-cov-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
    submitjob me-lotf-liccov-WaitAtEnd-P.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
}


THERUNS=100
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  # testrun
  echo starting $THECOUNT of $THERUNS for 1024 at `date +%H:%M:%S`
  defaultrun
#  defaultrun1024
  THECOUNT=`expr $THECOUNT + 1`
done
