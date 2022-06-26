FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y \
    ca-certificates \
    gfortran \
    git \
    libopenmpi-dev \
    libgomp1 \
    libopenmpi3 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/tools

RUN git clone https://github.com/daisy20170101/TriBIE.git \
    && cd TriBIE/src \
    && mpif90 phy3d_module_non.f90 3dtriBIE_v1.f90 -o tribie

FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libgomp1 \
    libopenmpi3 \
    libopenmpi-dev \
    openmpi-bin \
    python3 \
    python3-pip \
    python3-numpy \
    python3-setuptools \
    libxrender1 \
    xvfb \
    tini \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home
COPY --from=0 /home/tools tools
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip && pip3 install -r requirements.txt

ENV PATH=/home/tools/bin:$PATH
ENV OMP_PLACES="cores"
ENV OMP_PROC_BIND="spread"
ENV PYTHONPATH="${PYTHONPATH}:/home/tools/lib"
COPY entrypoint.sh /entrypoint.sh

WORKDIR /home/training
COPY SEAS-BP3/ SEAS-BP3/

VOLUME ["/shared"]
WORKDIR /shared
ENTRYPOINT ["tini", "-g", "/entrypoint.sh", "--"]
