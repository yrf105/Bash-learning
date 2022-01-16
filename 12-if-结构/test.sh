#!/usr/bin/env bash

if test -e /tmp/abc
then
    echo "/tmp/abc 存在"
fi

if [ -e /etc/hosts ]; then
    echo "/etc/hosts 存在"
fi

if [[ -e /etc/passwd ]]; then
   echo "/etc/passwd 存在"
fi
