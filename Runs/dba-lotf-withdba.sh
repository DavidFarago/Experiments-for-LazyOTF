# Parameters: MinMaxLCCover MaxMaxLCCover MaxSteps SampleSize

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION
MAXPORTION=1

while [ $count -le $RUNS ]
do
    MAXDEPTH=`expr 4 + 2 \* $count`
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Gen3_Bare_LazyOTF.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $MAXPORTION $MAXSTEP $SAMPLE "liccov-lazyotfto;0;$count;quiet;" lazyotf 4 $MAXDEPTH 10
    count=`expr $count + 1`
done

