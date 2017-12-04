# Java Thread Dumper 

A good practice is to take multiple (~ 10) thread dumps at a regular interval. This script does just that - simply provide the count and the interval and hit enter. 

## Usage
Make the script executable `chomod +x threadDumper.sh`

Run `./threadDumper.sh [pid] [pidOwner] [count] [delay]`

## For example:
sh threadDumper.sh 1234 israelo 10 3
where
* 1234 is the pid of the java process
* israelo is the Linux or Unix user that the java process runs as
* 10 is how many thread dumps to take
* 3 is the delay between each dump 
