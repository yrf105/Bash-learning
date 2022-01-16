#!/usr/bin/env bash

if read -t 3 text; then
    echo "用户输入：$text"
else
   echo '用户没有输出'
fi
