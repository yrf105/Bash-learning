#!/usr/bin/env bash

MAX_VALUE=100
MIN_VALUE=1

NUM=50

if [[ "$NUM" =~ ^-?[0-9]+$ ]]; then
    if [[ $NUM -le $MAX_VALUE && $NUM -ge $MIN_VALUE ]]; then # 这里必须是 [[ xx ]] 不能是 [ xx ]
        echo "$NUM 在范围内"
    else
        echo "$NUM 不在范围内"
    fi
else
    echo "$NUM 不是整数"
fi