FROM htcondor/mini_amd64

RUN yum install -y vim htop
RUN yum install -y gsl gsl-devel && ln -s /usr/lib64/libgsl.so /usr/lib64/libgsl.so.0

RUN useradd -m -s /bin/bash test_user



RUN yum install -y environment-modules
#TODO: Create modules for cuda-toolkit python/2.7.11 gcc/4.8.2


ENV MAMBA_ROOT_PREFIX=/opt/micromamba
RUN mkdir -p ${MAMBA_ROOT_PREFIX}

### Install Micromamba ###
RUN yum install -y bzip2 #The following commands need bzip2
RUN mkdir -p /opt/micromamba/bin && cd /opt/micromamba && \
    curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba && \
    echo 'eval "$(/opt/micromamba/bin/micromamba shell hook -s bash)"' >> /etc/bashrc

### use micromamba to install python 2.7.15 ###
RUN /opt/micromamba/bin/micromamba create -n py2715 python=2.7.15 numpy scipy -c conda-forge biopython -y
COPY python-modulefile /etc/modulefiles/python/2.7.11


### OTHER MODULE FILES ###
COPY cuda-toolkit-modulefile /etc/modulefiles/cuda-toolkit/default
COPY gcc-modulefile /etc/modulefiles/gcc/4.8.2
COPY gcc-modulefile /etc/modulefiles/gcc/9.2.0
COPY dummy-modulefile /etc/modulefiles/gsl/default

COPY dummy-modulefile /etc/modulefiles/numpy/default
COPY dummy-modulefile /etc/modulefiles/scipy/default


