#!/bin/sh

if [ "$1" = "run" ]
then
  docker run -p 8001:8001 --env-file ./host1.properties --name my-server-1 -d my-server:0.1
  docker run -p 8002:8002 --env-file ./host2.properties --name my-server-2 -d my-server:0.1
elif [ "$1" = "destroy" ]
then
  docker stop my-server-1 my-server-2
  docker rm my-server-1 my-server-2
  docker rmi my-server:0.1
elif [ "$1" = "build" ]
then
  gradle clean
  gradle build
  docker build . --tag my-server:0.1
fi