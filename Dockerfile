# Python Jupyter notebooks for Artificial Intelligence (AI) / Machine Learning (ML)
# Reference:
# * https://hub.docker.com/r/artificialintelligence/python-jupyter/
# * https://github.com/machine-learning-helpers/docker-images-python-jupyter
#
FROM centos:centos7
MAINTAINER Denis Arnaud <denis.arnaud_github at m4x dot org>
LABEL version="0.1"

# Configuration
ENV HOME /root

# Import the Centos-7 GPG key to prevent warnings
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

# Update of CentOS
RUN yum -y clean all
RUN yum -y upgrade

# EPEL
RUN yum -y install epel-release

# Base install
RUN yum -y install git-all unzip bzip2 gzip tar wget curl maven rake rubygem-rake which

# Development
RUN yum -y install gcc-c++ Cython python34-Cython openblas-devel readline-devel graphviz

# R
RUN yum -y install R-devel

# Python
RUN yum -y install python python2-pip python-devel
RUN yum -y install python34 python34-pip python34-devel
RUN pip3 install --upgrade pip
RUN pip3 install r2_kernel
RUN pip3 install pandas matplotlib seaborn graphviz
RUN pip3 install jupyterlab
RUN pip3 install jupyter-git jupyter-pip jupyter-beautifier jupyter-full-width jupyter-notebook-gist
RUN pip3 install jupyter_dashboards jupyter_dashboards_bundlers jupyter-spark
RUN pip3 install jupyter_utils jupyter-tools bash_kernel
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN pip3 install networkx
RUN pip3 install imageio
RUN pip3 install xlrd
RUN pip3 install tensorflow ml-tools
RUN pip3 install keras scikit-keras
RUN pip3 install Theano
RUN pip3 install gym
#RUN pip3 install pytorch
RUN yum -y install npm
RUN npm install npm@latest -g
#RUN jupyter labextension install jupyterlab-drawio
RUN pip3 install onnxmltools
RUN pip3 install surprise
RUN pip3 install parfit
RUN pip3 install mcfly
#RUN pip3 install basemap

# Notebook directory
VOLUME /notebook
WORKDIR /notebook

# Tell Docker that about the Jupyter port
EXPOSE 8888

# Launch Jupyter
#CMD jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --NotebookApp.token=
CMD jupyter lab --allow-root --no-browser --ip 0.0.0.0 --NotebookApp.token=

