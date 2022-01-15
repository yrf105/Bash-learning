#!/usr/bin/env bash

if cd abc; then
    ls -l
else
    echo "无法切换目录" 1>&2
    exit 1
fi