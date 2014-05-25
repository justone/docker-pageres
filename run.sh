#!/bin/bash

if [[ -n $STREAM ]]; then
  mkdir -p /pageres/output
  cd /pageres/output
  pageres $* > pageres.log
  cd ..
  tar -czf - output | cat
elif [[ -d /pageres/output ]]; then
  cd /pageres/output
  pageres $*
else
cat <<USAGE
Docker pageres container.  This container has two modes of operation:

1. Output the images to a mounted volume.  To trigger this behavior, just mount
a volume to /pageres/output (i.e. '-v `pwd`:/pageres/output').

2. Stream a tarball of the images to STDOUT.  To trigger this behavior, set the
environment variable 'STREAM' to 1 (i.e. '-e STREAM=1').

USAGE
  exit;
fi
