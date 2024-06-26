#!/bin/bash -ex

case "${1}" in
    install)
        git clone --depth=1 https://github.com/twisted/twisted
        cd twisted
        git rev-parse HEAD
        pip install --index-url 'https://:2020-04-22T23:19:51.290101Z@time-machines-pypi.sealsecurity.io/' ".[tls,conch,http2]"
        ;;
    run)
        cd twisted
        python -m twisted.trial src/twisted
        ;;
    *)
        exit 1
        ;;
esac
