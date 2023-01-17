#!/usr/bin/env bash

set -e

client_branch="main"
if [[ "${TRIGGER_REPO}" == "taikoxyz/taiko-client" ]]; then
    client_branch=${TRIGGER_REF}
fi

build_client_image() {
    client_dir="/tmp/taiko-client"
    rm -fr ${client_dir}
    git clone --depth=1 https://github.com/taikoxyz/taiko-client.git ${client_dir}
    cd ${client_dir}
    git checkout "${client_branch}"
    docker build -t taiko-client:local .
    cd -
    echo "Success to build taiko-client image"
}

build_client_image