#!/usr/bin/env bash

# 可以输出 -l -h -a 带前置连线参数
# 其中 a: 代表 -a 后可以跟参数
while getopts "lha:" OPTION; do
    case "$OPTION" in
    l)
        echo "linux config"
        ;;
    h)
        echo "ha ha ha"
        ;;
    a)
        echo "the value of a is $OPTION"
        ;;
    ?)
        echo "usage: $(basename $0) [-l] [-h] [-a somevalue]" >&2
        exit 1
        ;;
    esac
done
echo "$OPTIND"
shift "$(($OPTIND - 1))" # 以便后面的代码可以使用 $1 $2 处理参数