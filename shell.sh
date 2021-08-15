#!/bin/sh
ls
docker kill $(docker ps -q)
git fetch && git rebase
docker build -t garima-web .
docker run -p 8080:8080 garima-web &
