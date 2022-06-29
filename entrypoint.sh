#!/bin/bash
set -o errexit
ulimit -Ss unlimited

if [ -z $1 ]
then
    cd /home/training
    set -x
    export DISPLAY=:99.0
    which Xvfb
    Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
    sleep 3
    set +x
    jupyter-lab --allow-root --no-browser
    exit
fi

case "$1" in
    tribie)
        set -- tribie "${@:2}"
        exec "$@"
    ;;
    calc_stiffness)
        set -- calc_stiffness "${@:2}"
        exec "$@"
    ;;
    *)
        echo "Unknown command: $1"
    ;;
esac
