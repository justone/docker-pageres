FROM ubuntu:14.04
MAINTAINER nate@endot.org

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install libfontconfig libfreetype6 software-properties-common -y
RUN add-apt-repository ppa:chris-lea/node.js -y
RUN apt-get update
RUN apt-get install nodejs -y

RUN mkdir /pageres
WORKDIR /pageres

RUN npm install --save pageres

RUN addgroup --gid 1000 pageres
RUN adduser --uid 1000 --gid 1000 pageres
