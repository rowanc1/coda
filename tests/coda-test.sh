#!/bin/bash

echo "[bumpversion]" > .bumpversion.cfg
echo "current_version = 0.0.0" >> .bumpversion.cfg
echo "files = ver.txt" >> .bumpversion.cfg

echo "0.0.0" > ver.txt

git init
git config --global user.email "test@test.com"
git config --global user.name "test"
git add .bumpversion.cfg
git add ver.txt
git commit -m "test commit"

function cleanup
{
    rm -rf .git/
    rm .bumpversion.cfg
    rm ver.txt

    exit $1
}


if ! [ "$(cat ver.txt)" = "0.0.0" ]; then
    cleanup 1
fi
coda patch beta
if ! [ "$(cat ver.txt)" = "0.0.1b0" ]; then
    cleanup 1
fi
coda beta
if ! [ "$(cat ver.txt)" = "0.0.1b1" ]; then
    cleanup 1
fi
coda release
if ! [ "$(cat ver.txt)" = "0.0.1" ]; then
    cleanup 1
fi
coda patch
if ! [ "$(cat ver.txt)" = "0.0.2" ]; then
    cleanup 1
fi
coda minor
if ! [ "$(cat ver.txt)" = "0.1.0" ]; then
    cleanup 1
fi
coda minor beta
if ! [ "$(cat ver.txt)" = "0.2.0b0" ]; then
    cleanup 1
fi
coda beta
if ! [ "$(cat ver.txt)" = "0.2.0b1" ]; then
    cleanup 1
fi
coda release
if ! [ "$(cat ver.txt)" = "0.2.0" ]; then
    cleanup 1
fi
coda major beta
if ! [ "$(cat ver.txt)" = "1.0.0b0" ]; then
    cleanup 1
fi
coda release
if ! [ "$(cat ver.txt)" = "1.0.0" ]; then
    cleanup 1
fi
coda minor
if ! [ "$(cat ver.txt)" = "1.1.0" ]; then
    cleanup 1
fi
coda patch beta
if ! [ "$(cat ver.txt)" = "1.1.1b0" ]; then
    cleanup 1
fi

cleanup 0

