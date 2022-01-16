#!/usr/bin/env bash

FILE="./file.sh"

if [ -e "$FILE" ]; then # 这里的 $FILE 必须被「双引号」包围
    echo "$FILE 文件存在"
fi
