#!/bin/bash

BASEDIR=`pwd`
AWTC=PInputMeanDefaultTree2Weight

# submitjob EXPSCRIPTRELPATH ARGMIN ARGMAX SAMPLESIZE STEPCEILING
submitjob() {
    EXPERIMENT=$BASEDIR/$1
    AARGMIN=$2
    AARGMAX=$3
    ASIZE=$4
    ASTEPCEIL=$5
    MAXBOUNDS=$6

    NAME=`basename $EXPERIMENT $AWTC`

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=$AWTC,MAXBOUNDS=$MAXBOUNDS" -l walltime=250:00:00,nodes=1:ppn=1 Cluster_ExecExpMaxbounds.sh
#nodes=1 oder nodes=<name>
}

defaultrun() {
defaultruneinzeln
defaultruneinsbis
}

defaultruneinzeln() {
    # Default values
    D_SAMPLESIZE=1 #10
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=40000000

MAXBOUNDS=1
while [ $MAXBOUNDS -le 10 ]
do

    submitjob me-lotf-liccov-boundExperiments_einzeln.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $MAXBOUNDS
  MAXBOUNDS=`expr $MAXBOUNDS + 1`
done
}

defaultruneinsbis() {
    # Default values
    D_SAMPLESIZE=1 #10
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=40000000

    submitjob me-lotf-liccov-boundExperiments_einsBis.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 4
    submitjob me-lotf-liccov-boundExperiments_einsBis.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 7
    submitjob me-lotf-liccov-boundExperiments_einsBis.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 10
}

THERUNS=1
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  defaultruneinsbis
  THECOUNT=`expr $THECOUNT + 1`
done
