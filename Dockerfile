FROM jupyter/datascience-notebook

LABEL maintainer="filippo.valle@unito.it"

USER root
RUN apt-get update
RUN apt-get install sudo apt-utils --yes

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && python3 -m pip install --upgrade pip

# install graph-tool
RUN conda install -c conda-forge mamba -y
RUN mambda install -c conda-forge graph-tool -y 

# install project requirements
COPY requirements.txt /home/jovyan

RUN apt-get install libgtk-3-dev libjs-mathjax pandoc --yes
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN python3 -m pip uninstall Pillow -y
RUN python3 -m pip install --no-cache-dir matplotlib


# get gdc-client for TCGA downloads
RUN wget https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.5.0_Ubuntu_x64.zip
RUN unzip gdc-client_v1.5.0_Ubuntu_x64.zip
RUN mv gdc-client /usr/local/bin
RUN rm -f gdc-client_v1.5.0_Ubuntu_x64.zip

#R files
RUN apt-get install libgit2-dev --yes
COPY install_pkgs.R /home/jovyan
RUN Rscript install_pkgs.R

ENV PYTHONIOENCODING=utf8

USER jovyan
WORKDIR /home/jovyan/work

ENTRYPOINT jupyter lab
CMD [""]