#!/bin/bash
set -e
git clone \
    --jobs $(nproc) \
    --shallow-submodules \
    --recurse-submodules \
    --single-branch \
    --branch "$1" \
    https://github.com/boostorg/boost && \
(cd boost && \
    git ls-files --recurse-submodules \
    | grep -Ev '^"?libs/wave/' \
    | zip /var/sdk/boost.zip -@)
