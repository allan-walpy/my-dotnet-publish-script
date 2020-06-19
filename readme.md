# my dotnet publish script

## main script `publish.sh`

- 1st argument `TargetFramework`;
- Nth argument `RuntimeIdentifier`;

example;
```shell
#!/bin/bash

# deleting output folders like `obj`, `bin` etc. if needed;
rm -r -f ./src/obj ./src/bin

# running publish script;
./publish.sh netcoreapp3.0 \
    ubuntu-x64 \
    debian-x64 \
    alpine-x64 \
    linux-x64
```

## support script `publish.one.sh`

- 1st argument `TargetFramework`;
- 2nd argument `RuntimeIdentifier`;

> `dotnet restore` & `dotnet build -c Release` must be run before executing;

example:
```shell
#!/bin/bash

# create all folders for output;
mkdir -p ./out/publish/package/

# restore & build before running;
dotnet restore -v q
dotnet build -c Release -v q

# run publish script
./publish/publish.one.sh netcoreapp3.0 alpine-x64
```
