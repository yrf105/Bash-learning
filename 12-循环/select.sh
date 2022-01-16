#!/usr/bin/env bash

echo "你最喜欢的操作系统是？"

select os in Arch Ubuntu Win10 MacOS
do
    case $os in
        "Arch" | "Ubuntu" | "Win10")
            echo "i also like $os" ;;
        "MacOS" )
            echo "我买不起 Mac" ;;
        * )
            echo "我没听说过 $os" ;;
    esac
done