#!/usr/bin/env bash

echo "总共输入 $# 个参数"

while [ "$1" != "" ]; do
    echo "剩下 $# 个参数"
    echo "参数：$1"
    shift # shift 2
done