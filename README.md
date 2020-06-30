# topics
Material for ** [link](arxiv.org/)

See [analyses](analyses.md) to follow all the steps to reproduce the analyses

# Environment
The easiest way to run all the notebooks of this repository with all dependencies handled correctly is using Docker.

You can enable *jupyter lab* with *docker-compose*
```bash
docker-compose up -d
```

or you can pull the docker image
```bash
docker run -v $PWD:/home/jovyan/work -p 8888:8888 --rm -it docker.pkg.github.com/fvalle1/topics/topicmodel:latest
```

then point your browser to [localhost](localhost:8888)
