#!/bin/bash

BASEDIR=`pwd`
AWTC=PInputMeanDefaultTree2Weight

MAXJOBS=8 #damit niedrige Last
SIGNATURE="noCommLog.sh"
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
    MAXBOUNDS=$6

    NAME=`basename $EXPERIMENT $AWTC`

    qsub -N $NAME -o /home/farago/$NAME-out -e /home/farago/$NAME-err -V -v "ARGMIN=$AARGMIN,ARGMAX=$AARGMAX,SIZE=$ASIZE,STEPCEIL=$ASTEPCEIL,EXPERIMENT=$EXPERIMENT,TREETOWEIGHT=$AWTC,MAXBOUNDS=$MAXBOUNDS" -l walltime=250:00:00,nodes=cn20 Cluster_ExecExpMaxbounds.sh
}
#nodes=1:ppn=1

defaultrun() {
    # Default values
    D_SAMPLESIZE=1
    D_ARGMIN=10
    D_ARGMAX=10

    D_STEPCEIL=40000000

MAXBOUNDS=11
while [ $MAXBOUNDS -le 10 ]
do

    submitjob me-lotf-liccov-boundExperiments_einzeln_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL $MAXBOUNDS

  MAXBOUNDS=`expr $MAXBOUNDS + 1`
done

#    submitjob me-lotf-liccov-boundExperiments_einsBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 4
#    submitjob me-lotf-liccov-boundExperiments_einsBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 7
#    submitjob me-lotf-liccov-boundExperiments_einsBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 10
#    submitjob me-lotf-liccov-boundExperiments_vierBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 7
#    submitjob me-lotf-liccov-boundExperiments_vierBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 10
#
##    submitjob me-lotf-liccov-boundExperiments_fuenfBisSchnell_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 8
##    submitjob me-lotf-liccov-boundExperiments_fuenfBisSchnell_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 10
    submitjob me-lotf-liccov-boundExperiments_fuenfBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 8
    submitjob me-lotf-liccov-boundExperiments_fuenfBis_noCommLog.sh $D_ARGMIN $D_ARGMAX $D_SAMPLESIZE $D_STEPCEIL 10

}

THERUNS=100
THECOUNT=1
while [ $THECOUNT -le $THERUNS ]
do
  defaultrun
#  echo "einzelnUndVierBisUndFuenfBis"+$THECOUNT
  THECOUNT=`expr $THECOUNT + 1`
done
