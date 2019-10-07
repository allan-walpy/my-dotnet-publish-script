#!/bin/bash

## builds with publish app with spesified parametrs basis on `Release` configuration;
##   must be launched from root repository folder;
## arguments:
##   1st platform identifier;
##   2nd framework identifier;

echo -e "\n\
publishing self-contained version of app \n\
  configuration '$2/$1' \n\
  output \n\
    folder 'out/publish/$1' \n\
    zip    'out/publish/paskage/$1.zip' \n\
" && \
dotnet publish --nologo --self-contained -v q -c Release \
    -o "./out/publish/$1" -f "$2" -r "$1" "./src/api.csproj" && \
cp -r -f "./config" "./out/publish/$1/config" && \
cp -f "./config/token/default.json" "./out/publish/$1/config/token.json" && \
mkdir "./out/publish/$1/log" && \
zip -r -q -0 "./out/publish/package/$1.zip" "./out/publish/$1/"
