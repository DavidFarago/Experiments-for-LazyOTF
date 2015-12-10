# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION

MINDEPTH=10
DEPTH=10
THRESH=1000

while [ $count -le $RUNS ]
do
#    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Gen3_NonFancyRSML.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "noargs;" lazyotf $DEPTH $DEPTH $THRESH
    count=`expr $count + 1`
done
