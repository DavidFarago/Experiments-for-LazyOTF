# ... minStep maxStep stepIncrement sampleSize

#!/home/farago/bin/dash
# usage: sh JTorX_Dec.sh MIN MAX MAXSTEPS RUNSPERMAXPORTION


OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2
count=$1
MAXSTEP=$3
SAMPLE=$4

while [ $count -le $RUNS ]
do
    realmp=`expr $count \* 10`
    evaluate ../../../Skeletons/Plain_STraces_IOCO_NoVizLog_RSMLGuide.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $realmp $MAXSTEP $SAMPLE "jtorx-mode;quiet;" otf
    count=`expr $count + 1`
done
