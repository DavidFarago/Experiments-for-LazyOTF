# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR
cd Output/$OUTPUTDIR

RUNS=$2
count=$1
while [ $count -le $RUNS ]
do
    evaluate ../../../Skeletons/Plain_STraces_IOCO.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax 1 $3 $4 "liccov-jtorxto;0;$count;jtorx-mode;" otf $count $count 10
    count=`expr $count + 1`
done
