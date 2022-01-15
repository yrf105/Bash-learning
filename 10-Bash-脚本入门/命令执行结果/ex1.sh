#!/usr/bin/env bash

cd abc
if [ "$?" = "0" ]; then
    ls -l
else
    echo "无法切换目录" 1>&2
    exit 1
fi