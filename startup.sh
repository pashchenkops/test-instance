#!bin/bash

kill -15 $(sudo lsof -t -i:8081)

nohup java -jar test-instance-0.0.1-SNAPSHOT.jar > ~/log.txt 2>&1 &

echo $! > pid.file