# Training
Welcome to the TriBIE training. Please clone this repository with git (using the command line) or download it directly from the browser. This repository contains a Dockerfile to build a Docker container. The Docker container contains an interactive learning environment (Jupyter) which includes source codes (Fortran90 + MPI) and visualiation tools.

# Installation
Please install Docker (https://www.docker.com/get-started/), launch the Docker Desktop and then run

``docker pull daisy20170101/tribie-training``

# Training
After installation, run

``docker run -p 8899:8899 daisy20170101/tribie-training``

After some time you should see

``http://127.0.0.1:53155/lab?token=2b65a1f2b193c9ddb686bb8f157c3608571b581443021d60 ``

Click on that link or enter the link in the address bar of your web browser.

Then use the navigation bar to open the exercises (SEAS-BP3/) and we will look at the earthquake cycle modeling of a shallowing dipping fault (SEAS-BP3) in 2D medium.

# Tools
You can also use the tools in the Docker container for creating input files or running SeisSol on your local computer. To this end, you need to mount your local drive within the Docker container with the following command:

``docker run -v $(pwd):/shared/ -u $(id -u):$(id -g) daisy20170101/tribie-training <some command>``

The following tools are currently included:

  calc_stiffness: the analytical solution for triangular dislocation element
  
  tribie: boundary element code for cycling simulation
