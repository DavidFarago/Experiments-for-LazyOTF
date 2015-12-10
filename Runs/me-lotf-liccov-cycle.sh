# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION
#qsub variable TR: CYCLEWARNINGTHRESHOLD

OUTPUTDIR=`basename $0`-$TREETOWEIGHT-$TR
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Gen3_Bare_LazyOTF.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "liccov-lazyotfto;0;$count;enable-cycle-detection;$TR;" lazyotf
    count=`expr $count + 1`
done
