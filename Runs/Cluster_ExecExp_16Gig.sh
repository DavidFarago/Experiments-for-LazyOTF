#!/bin/bash
#PBS -m n

cd /raid/`whoami`/Experiments/Cluster
export JTORXDIR=~/CaseStudy/jtorx-1.10.0-beta8/
#export SUTJAR=~/CaseStudy/LicenseGeneratorSUT/licenseGenerator.jar
export SUTBIN=~/CaseStudy/LicenseGeneratorSUT/licenseGenerator
export PATH=~/CaseStudy/Tools/jdk/latest/bin:~/bin:"$PATH"
export JAVA_HOME=~/CaseStudy/Tools/jdk/latest/
export LD_LIBRARY_PATH=~/CaseStudy/Tools/jdk/latest/jre/lib/amd64:~/CaseStudy/Tools/jdk/latest/jre/lib/amd64/jli

export _JAVA_OPTIONS="-Xmx16g"
export JAVA_OPTIONS="-Xmx16g"

dash $EXPERIMENT $ARGMIN $ARGMAX $STEPCEIL $SIZE 
