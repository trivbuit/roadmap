#!/bin/bash
echo 'Stopping...'
docker stop python_code
echo 'Removing...'
docker rm python_code
echo 'Building'
docker build --tag python-flask-docker .
echo 'Running...'
docker run -d  --name python_code --publish 8080:5000 python-flask-docker
