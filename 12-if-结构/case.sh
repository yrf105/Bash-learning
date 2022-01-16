#!/usr/bin/env bash

OS=$(uname -s)

case "$OS" in
    FreeBSD )
        echo "This is FreeBSD" ;;
    Linux )
        echo "This is Linux" ;;
    * )
        echo "不知道是啥系统" ;;
esac