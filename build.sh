#! /bin/bash
set -ex

CGO_ENABLED=0 go build -v -ldflags '-s -w -extldflags "-static"' -o main
mkdir -p output/
mv main output/