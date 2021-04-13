# Tutorial

First,

```
virtualenv env
source env/bin/activate

pip install Flask
pip freeze
```

```
touch app.py
```

To Docker
```
pip freeze > requirements.txt

touch Dockerfile

docker build --tag python-flask-docker .
docker tag python-flask-docker:latest python-flask-docker:v1.0.0
```


Run Webapp using Docker
```
docker run -d --publish 8080:5000 python-flask-docker
```

## Kienthuc

- Bash script
- HTML, CSS

## Ref
- https://www.w3schools.com/html/
- https://www.w3schools.com/w3css/defaulT.asp
- 