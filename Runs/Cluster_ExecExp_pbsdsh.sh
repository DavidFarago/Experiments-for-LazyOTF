#!/bin/bash

TMPUUID=`uuidgen`
OUTPUTID=`echo $TMPUUID | cut -c 1-6`

/usr/bin/pbsdsh -u -v dash $EXPERIMENT $ARGMIN $ARGMAX $STEPCEIL $SIZE $INSTANCES $OUTPUTID

#/usr/bin/pbsdsh -c $INSTANCES -v dash $EXECSCRIPT $ARGMIN $ARGMAX $STEPCEIL $SIZE $TOS $INSTANCES
