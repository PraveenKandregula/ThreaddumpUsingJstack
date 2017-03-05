#!/bin/bash

#Interval in seconds between data points.
INTERVAL=10

counter=1

# Export  Java Home
JAVA_HOME=/usr/java/jdk1.6.0_24

host=$HOSTNAME
SERVERDUMP_LOCATION=/dumps/threaddumps/
TODAY_DATE=$(date +"%d%m%Y")

#create Server Dumps directory
if [ ! -d ${SERVERDUMP_LOCATION} ]
then
echo "creating dump directory"
mkdir -p $SERVERDUMP_LOCATION
fi

PID=$(ps -ef | grep -i java | grep -i adminserver | awk '{print $2}'| head -1)
# read input
if [ -z $PID ]; then
  # process id is  empty
  echo "Run the command in the format: sh thread"
  exit 1
fi


while [ $counter -le 6 ]
do
  echo "*****Generating Thread dump #" $counter
  $JAVA_HOME/bin/jstack -l $PID >> $SERVERDUMP_LOCATION/Admin_threaddump$TODAY_DATE.out
  counter=$(( $counter + 1 ))
  sleep $INTERVAL
done

echo "Done *****"
You have new mail in /var/spool/mail/oracle
