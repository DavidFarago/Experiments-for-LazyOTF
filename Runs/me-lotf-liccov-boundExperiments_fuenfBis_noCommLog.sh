# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize Maxbounds

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION
MAXBOUNDS=$5 

while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:

    evaluate ../../../Skeletons/Gen3_Bare_LazyOTF.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "liccov-lazyotfto;0;$count;disable-lotf-comm-logging;" lazyotf 5 $MAXBOUNDS

    count=`expr $count + 1`
done
