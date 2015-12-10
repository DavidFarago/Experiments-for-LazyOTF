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
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Gen3_ReachShowMoreLicensesWOInducing_LazyOTF.jtorx ../../../Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "decrease-lazyotfto;$count" lazyotf
#    evaluate /raid/farago/Experiments/Skeletons/Gen3_ReachShowMoreLicensesWExpiredInd_LazyOTF.jtorx /raid/farago/Experiments/Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "decrease-lazyotfto;$count" lazyotf
    count=`expr $count + 1`
done
