# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize

OUTPUTDIR=`basename $0`-$TREETOWEIGHT
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION

while [ $count -le $RUNS ]
do
    expCount=`(echo 2 \^ $count | bc)`
    evaluate ../../../Skeletons/Gen3_ReachShowMoreLicensesWExpiredInd_LazyOTF.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $expCount $MAXSTEP $SAMPLE "noargs;" lazyotf
    count=`expr $count + 1`
done
