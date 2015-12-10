#!/home/farago/bin/dash
# usage: sh JTorX_RSML_Cov_Dec.sh MIN MAX MAXSTEPS RUNSPERMAXPORTION

mkdir -p Output/JTorX_RSML_Cov_Dec
cd Output/JTorX_RSML_Cov_Dec

RUNS=$2
count=$1
while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/Plain_STraces_IOCO.jtorx  ../../../Skeletons/licenseGenerator3Skel.sax $count $3 $4 "findshowmorelicenses-simpleto;coverage-simpleto;decrease-simpleto;$count;jtorx-mode;" otf
    count=`expr $count + 1`
done
