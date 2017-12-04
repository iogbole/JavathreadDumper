#!/bin/bash
if [ $# -eq 0 ]; then
    echo >&2 "Usage: threadDumper.sh <pid> <run_user> [ <count> [ <delay> ] ]"
    echo >&2 "    Defaults: count = 10, delay = 0.5 (seconds)"
    exit 1
fi
pid=$1          # required
user=$2         # required
count=${3:-10}  # defaults to 10 times
delay=${4:-0.5} # defaults to 0.5 seconds
while [ $count -gt 0 ]
do
    sudo -u $user jstack -l $pid >threaddumps.$pid.$(date +%H%M%S.%N)
    #sudo -u $user kill -3 $pid >threaddumps.$pid.$(date +%H%M%S.%N) #if jstack isn't available 
    sleep $delay
    let count--
    echo -n "."
done

#Usage
#sh threadDumper.sh [pid] [pidOwner] [count] [delay]
#For example:
#sh threadDumpGrabber.sh 1234 israelo 10 3
#* 1234 is the pid of the java process
#* israelo is the Linux or Unix user that the java process runs as
#* 10 is how many thread dumps to take
#* 3 is the delay between each dump 
