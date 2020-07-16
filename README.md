![Docker Image CI](https://github.com/fvalle1/topics/workflows/Docker%20Image%20CI/badge.svg?branch=master)

# topics
Material for ** [link](arxiv.org/)

See [analyses](analyses.md) to follow all the steps to reproduce the analyses

![](bipartite_network.svg)

# Environment
The easiest way to run all the notebooks of this repository with all dependencies handled correctly is using Docker.

You can enable *jupyter lab* with *docker-compose*
```bash
docker-compose up -d
```

or you can pull the docker image
```bash
docker run -v $PWD:/home/jovyan/work -p 8888:8888 --rm -it --name topic_models docker.pkg.github.com/fvalle1/topics/topicmodel:latest
```

then point your browser to [localhost](localhost:8888)

# Package
A test package can be downloaded from [https://test.pypi.org/project/topicpy/](https://test.pypi.org/project/topicpy/)
```bash
pip install -i https://test.pypi.org/simple/ topicpy
```
