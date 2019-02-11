#!/bin/bash

while getopts "h:p:a:w:t:" option
do
case "${option}"
in
h) HOST=${OPTARG};;
p) PORT=${OPTARG};;
a) ADDRESS=${OPTARG};;
w) WORKER=${OPTARG};;
t) THREADS=${OPTARG};;
esac
done

if [ "$THREADS" -eq 0 ];then
  THREADS=$((`getconf _NPROCESSORS_ONLN`))
fi

if [ "$WORKER" = "KachInd" ];then
  WORKER=$HOSTNAME
fi

echo "-a verus -o stratum:tcp://$HOST:$PORT -u $ADDRESS.$WORKER -t THREADS"
./ccminer -a verus -o stratum:tcp://"${HOST}":"${PORT}" -u "${ADDRESS}"."${WORKER}" -t "${THREADS}"
