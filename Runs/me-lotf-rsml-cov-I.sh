# Parameters: MinMaxPortion MaxMaxPortion MaxSteps SampleSize ParallelInstances

RUNS=$2 #MAXPORTION
SAMPLE=$4 #SAMPLE
MAXSTEP=$3 #MAXSTEP
count=$1 #MINPORTION
INSTANCES=$5 #parallel instances
CLUSTERID=$6 #name of the cluster

cd /raid/`whoami`/Experiments/Cluster
export JTORXDIR=/home/farago/CaseStudy/jtorx-1.10.0-beta8/
export SUTJAR=/home/farago/CaseStudy/LicenseGeneratorSUT/licenseGenerator.jar
export PATH=/home/farago/CaseStudy/Tools/jdk/latest/bin:/home/farago/bin:"$PATH"
export JAVA_HOME=/home/farago/CaseStudy/Tools/jdk/latest/
export LD_LIBRARY_PATH=/home/farago/CaseStudy/Tools/jdk/latest/jre/lib/amd64:/home/farago/CaseStudy/Tools/jdk/latest/jre/lib/amd64/jli

OUTPUTDIR=`basename $0`
mkdir -p Output/$OUTPUTDIR/I$INSTANCES
cd Output/$OUTPUTDIR/I$INSTANCES

while [ $count -le $RUNS ]
do
    echo Run for maxPortion = $count:
    evaluate /raid/farago/Experiments/Skeletons/Gen3_RSMLANDCover_LazyOTF.jtorx  /raid/farago/Experiments/Skeletons/licenseGenerator3Skel.sax $count $MAXSTEP $SAMPLE "use-dist-hazel;${INSTANCES};${CLUSTERID};" lazyotf
    count=`expr $count + 1`
done
#   use-dist-mudp;              Use Distributed LazyOTF (UDP Multicast).
#   mudp-loopback;              Enable loopback when using use-dist-mudp.
#   use-dist-budp;              Use Distributed LazyOTF (UDP Broadcast).
#   use-dist-hazel;MINCS;NAME;  Use Distributed LazyOTF (Hazelcase)
#                                 with minClusterSize=MINCS
#                                 and clusterName=NAME.
