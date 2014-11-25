#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Number of containers required as argument"
fi

for (( c=1; c<=$1; c++ ))
do
  DIRECTORY=/var/appdata/es_node_$c
  if [ ! -d "$DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    mkdir $DIRECTORY
  fi
  cd $DIRECTORY
  if [ ! -f "elasticsearch.yml" ]; then
    printf "path:\n logs: /data/log\n data: /data/data" > elasticsearch.yml
  fi
done
