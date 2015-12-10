RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION
TOS=$5
INSTANCES=$6 #nur fuer verzeichnisbenamsung

export JTORXDIR=/home/farago/CaseStudy/jtorx-1.10.0-beta8/
export PATH=/home/farago/CaseStudy/Tools/jdk/latest/bin:~/bin:"$PATH"
export JAVA_HOME=~/CaseStudy/Tools/jdk/latest/
export LD_LIBRARY_PATH=~/CaseStudy/Tools/jdk/latest/jre/lib/amd64:~/CaseStudy/Tools/jdk/latest/jre/lib/amd64/jli

cd /raid/farago/Experiments/Runs

mkdir -p Output/$TOS/P$INSTANCES
cd Output/$TOS/P$INSTANCES

while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate ../../../Skeletons/$TOS  ../../../Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "use-dist-hazel;" lazyotf
    count=`expr $count + 1`
done
