#!/bin/bash

BASEDIR=`pwd`
MAXJOBS=19
HOWMANY=100
SIGNATURE="NON"
AWTC=$1Tree2Weight

wait_for_free_job() {
    USED=`(qstat | grep $USER | grep $SIGNATURE | wc -l)`
    while [ $USED -ge $MAXJOBS ]
    do
	sleep 60
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

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=$AWTC" -l walltime=10:00:00,nodes=1:ppn=1 Cluster_ExecExp_16Gig.sh
}
#nodes=1:ppn=1

#defaultrun() {
#submitjob me-lotf-nonfancyrsml-AWTC.sh 1 3 5 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 4 4 5 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 5 5 5 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 6 6 5 2000000
#sleep 1
#submitjob me-lotf-nonfancyrsml-AWTC.sh 7 7 3 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 7 7 2 2000000
#sleep 1
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#sleep 1
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1 2000000
#}

shortruns() {
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 1 3 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 1 3 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 1 3 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 4 4 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 4 4 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 4 4 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 5 5 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 5 5 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 5 5 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 6 6 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 6 6 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 6 6 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 7 7 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 7 7 3  2147483640
submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 7 7 3  2147483640
}

eightrun() {
  submitjob me-lotf-nonfancyrsml-AWTC.sh 8 8 1  24748364 #0
#  submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 8 8 1  24748364 #0
#  submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 8 8 1  24748364 #0
}

ninerun(){
  submitjob me-lotf-nonfancyrsml-AWTC.sh 9 9 1 214748364 #0
#  submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 9 9 1 214748364 #0
#  submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 9 9 1 214748364 #0
}

longrun() {
   submitjob me-lotf-nonfancyrsml-AWTC.sh 10 10 1 2147483640 #4000000
#   submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 10 10 1 2147483640 #4000000
#   submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 10 10 1 2147483640 #4000000
#   submitjob me-lotf-nonfancyrsml-AWTC-bound5.sh 10 10 1 2147483640 #4000000
}

THECOUNT=1
while [ $THECOUNT -le $HOWMANY ]
do
#  shortruns
#  eightrun
ninerun
#  longrun
  sleep 1
  THECOUNT=`expr $THECOUNT + 1`
done
