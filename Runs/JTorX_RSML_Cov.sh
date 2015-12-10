#!/home/farago/bin/dash
# usage: sh JTorX_RSML_Cov.sh MIN MAX MAXSTEPS RUNSPERMAXPORTION

mkdir -p Output/JTorX_RSML_Cov
cd Output/JTorX_RSML_Cov

RUNS=$2
count=$1
while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Plain_STraces_IOCO.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $3 $4 "findshowmorelicenses-simpleto;coverage-simpleto;jtorx-mode;" otf
    count=`expr $count + 1`
done
