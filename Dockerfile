FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y \
    wget \
    ca-certificates \
    bzip2 \
    gcc \
    g++ \
    gfortran \
	libopenmpi-dev \
	git \
    python3 \
    python3-numpy \
    libgomp1 \
    libopenmpi3 \
    libopenblas-base \
    zlib1g \

RUN mkdir -p /home/tools

RUN git clone git@github.com:daisy20170101/TriBIE.git
	&& cd TriBIE/src \
	&& mpiifort phy3d_module_non.f90 3dtriBIE_v1.f90 -o tribie

RUN apt-get update \
    && apt-get install -y \
    wget \
    ca-certificates \
    bzip2 \
    gcc \
    g++ \
    gfortran \
    libopenmpi-dev \
    git \
    python3 \
    python3-numpy \
    libgomp1 \
    libopenmpi3 \
    libopenblas-base \
    zlib1g \

WORKDIR /home
COPY --from=0 /home/tools tools
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip && pip3 install -r requirements.txt

WORKDIR /home/training
COPY SEAS-BP3/ SEAS-BP3/

VOLUME ["/shared"]
WORKDIR /shared
ENTRYPOINT ["tini", "-g", "/entrypoint.sh", "--"]
