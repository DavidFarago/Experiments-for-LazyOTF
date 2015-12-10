#!/bin/bash

# 1 Parameter: no of parallel instances

# DO NOT USE SKRIPT IN PARALLEL UNTIL evaluate has parameter for Multicast-GROUP

THERUNS=2

BASEDIR=`pwd`
#MINP=$1
#MAXP=$2
#ITER=$3
INSTANCES=$1

MAXJOBS=1
SIGNATURE="Mlp"
wait_for_last_job() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge $MAXJOBS ]
    do
	sleep 30
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

    qsub -N ${NAME}Mlp$AINSTANCES -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "INSTANCES=$AINSTANCES,ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT" -l walltime=200:00:00,nodes=$AINSTANCES:ppn=1 Cluster_ExecExp_pbsdsh.sh
#ppn=8 : one instance per node
#ppn=1 : one instance per processor
}

testrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARG=1 #D_ARGMIN=D_ARGMAX

    D_STEPCEIL=40000000
    submitjob me-lotf-liccov-M.sh $D_ARG $D_ARG $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
#    submitjob me-lotf-rsml-M.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
}


defaultrun() {
    # Default values 
   D_SAMPLESIZE=1
    D_ARGMIN=1
    D_ARGMAX=10

    D_STEPCEIL=40000000

  THEARG=$D_ARGMIN
  while [ $THEARG -le $D_ARGMAX ]
  do
#    submitjob me-lotf-rsml-I.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
#    submitjob me-lotf-cov-I.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
#    submitjob me-lotf-rsml-cov-I.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $INSTANCES
    submitjob me-lotf-liccov-M.sh $THEARG $THEARG $D_SAMPLESIZE $D_STEPCEIL $INSTANCES

  THEARG=`expr $THEARG + 1`
  done
}

THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  testrun
  #defaultrun
  THECOUNT=`expr $THECOUNT + 1`
done
