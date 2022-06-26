# Training
Welcome to the TriBIE training. Please clone this repository with git (using the command line) or download it directly from the browser. This repository contains a Dockerfile to build a Docker container. The Docker container contains an interactive learning environment (Jupyter) which includes source codes and visualiation tools.

# Installation
Please install Docker, launch the Docker Desktop and then run

``docker pull dli/tribie-training``

# Training
After installation, run

``docker run -p 53155:53155 dli/tribie-training``

We will look at the earthquake cycle modeling of a shallowing dipping fault (SEAS-BP3) in 2D medium in this training.
