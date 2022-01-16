#!/usr/bin/env bash

function alice  {
    echo "alice: $@"
    echo "$0: $1 $2 $3 $4"
    echo "$# 个参数"
}

alice in wonderland # 这就是个函数调用，函数名为 alice，参数分别为 in 和 wonderland
