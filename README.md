# Training
Welcome to the TriBIE training. Please clone this repository with git (using the command line) or download it directly from the browser. This repository contains a Dockerfile to build a Docker container. The Docker container contains an interactive learning environment (Jupyter) which includes source codes (Fortran90 + MPI) and visualiation tools.

# Installation
Please install Docker (https://www.docker.com/get-started/), launch the Docker Desktop and then run

``docker pull daisy20170101/tribie-training``

# Training
After installation, run

``docker run -p 53155:53155 daisy20170101/tribie-training``

We will look at the earthquake cycle modeling of a shallowing dipping fault (SEAS-BP3) in 2D medium in this training.

# Tools
You can also use the tools in the Docker container for creating input files or running SeisSol on your local computer. To this end, you need to mount your local drive within the Docker container with the following command:

``docker run -v $(pwd):/shared/ -u $(id -u):$(id -g) daisy20170101/tribie-training <some command>``

The following tools are currently included:

  TriStiff: the analytical solution for triangular dislocation element
  
  TriBIE: boundary element code for cycling simulation
