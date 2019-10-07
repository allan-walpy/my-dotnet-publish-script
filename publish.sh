#!/bin/bash

## builds app for all supported platforms;
##   must be launched from root repository folder;
## arguments:
##   1st framework identifier;
##   Nth platformIdentifier;

mkdir -p ./out/publish/package/ && \
dotnet restore -v q && \
dotnet build -c Release -v q && \

for platformIdentifier in $@
do
  if [ $1 != $platformIdentifier ]
  then
    ./publish/publish.one.sh $platformIdentifier $1
  fi
done
