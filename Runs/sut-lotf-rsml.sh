# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION

while [ $count -le $RUNS ]
do
    evaluate /raid/farago/Experiments/Skeletons/SUT_ReachShowMoreLicenses_LazyOTF.jtorx /raid/farago/Experiments/Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "noargs;" lazyotf
    count=`expr $count + 1`
done
