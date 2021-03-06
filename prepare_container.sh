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

  # install marvel plugin
  mkdir -p $DIRECTORY/plugins/marvel
  unzip -o marvel-latest.zip -d $DIRECTORY/plugins/marvel
  
  #pushd .
  #cd $DIRECTORY
  #if [ ! -f "elasticsearch.yml" ]; then
    cp elasticsearch.yml $DIRECTORY
  #fi
  #popd
  
done
