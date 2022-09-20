#!/bin/bash

# Safely execute this bash script
# e exit on first failure
# x all executed commands are printed to the terminal
# u unset variables are errors
# a export all variables to the environment
# E any trap on ERR is inherited by shell functions
# -o pipefail | produces a failure code if any stage fails
set -Eeuoxa pipefail

# Get the directory of this script
LOCAL_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# build
$LOCAL_DIRECTORY/build.sh

docker run -it --rm \
    -v $LOCAL_DIRECTORY/../components:/app/web-powerml/components \
    -v $LOCAL_DIRECTORY/../icon:/app/web-powerml/icon \
    -v $LOCAL_DIRECTORY/../dist:/app/web-powerml/dist \
    -v $LOCAL_DIRECTORY/../pages:/app/web-powerml/pages --entrypoint /app/web-powerml/scripts/generate.sh web-powerml:latest $@


