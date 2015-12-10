# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2
count=$1
while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Plain_STraces_IOCO.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $3 $4  "findshowmorelicenses-simpleto;jtorx-mode;" otf 6 6 10
    count=`expr $count + 1`
done
