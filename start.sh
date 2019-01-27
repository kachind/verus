#!/bin/bash

while getopts :h:p:a:w:c: option
do
case "${option}"
in
h) HOST=${OPTARG};;
p) PORT=${OPTARG};;
a) ADDRESS=${OPTARG};;
w) WORKER=${OPTARG};;
c) CPU=${OPTARG};;
esac
done

if [ "$CPU" -eq 0 ];then
  CPU=$((`getconf _NPROCESSORS_ONLN`))
fi

if [ "$WORKER" = "KachInd" ];then
  WORKER=$HOSTNAME
fi

./verusminer -v -l "${HOST}":"${PORT}" -u "${ADDRESS}"."${WORKER}" -t "${CPU}" "$@"
