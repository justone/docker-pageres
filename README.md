# Pageres in Docker

This repo contains instructions on how to build a docker image that will run
[pageres](https://github.com/sindresorhus/pageres).

## Docker registry

This image is available on the [Docker registry](https://index.docker.io/) as
[nate/pageres](https://index.docker.io/u/nate/pageres/):

```
$ docker pull nate/pageres
```

## Building

```
$ git clone https://github.com/justone/docker-pageres
$ docker build --rm -t nate/pageres .
```

## Running

This docker container can be run in one of two ways.

### Using volumes:

This will output the images into the specified host directory.

```
docker run -v `pwd`:/pageres/output --rm nate/pageres google.com 1600x900
```

### Without volumes:

This will output the images as a base64'd tarball to stdout.  The base64 is because docker munges the binary output.

The output from the pageres command will be in pageres.log in the tarball.

```
docker run -a stdin -a stdout -e STREAM=1 --rm nate/pageres google.com 1600x900 | openssl base64 -d > output.tgz
```

To replicate the 'with volumes' version without volumes, pipe to a tar command:

```
docker run -a stdin -a stdout -e STREAM=1 --rm nate/pageres google.com 1600x900 | openssl base64 -d | tar -xzf - --strip-components 1
```

# License

Copyright © 2014 Nate Jones

Distributed under the MIT license.
