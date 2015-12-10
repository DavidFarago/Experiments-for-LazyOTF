#!/home/farago/bin/dash
# usage: sh JTorX_RSML.sh MIN MAX MAXSTEPS RUNSPERMAXPORTION

mkdir -p Output/JTorX_RSML
cd Output/JTorX_RSML

RUNS=$2
count=$1
while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Plain_STraces_IOCO.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $3 $4  "findshowmorelicenses-simpleto;jtorx-mode;" otf
    count=`expr $count + 1`
done
