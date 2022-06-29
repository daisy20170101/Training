#!/bin/bash
docker run -v $(pwd):/shared/ -u $(id -u):$(id -g) daisy20170101/tribie-training "$@"
