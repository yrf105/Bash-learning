#!/usr/bin/env bash

# 采用逐个赋值的方式创建有三个元素的数组
array[0]=1
array[1]=2
array[3]=3
echo "${array[@]}" # 1 2 3

# 采用一次性赋值的方式创建有三个元素的数组
ARRAY=(1 2 3)
echo "${ARRAY[@]}" # 1 2 3
ARRAY=(
    1
    2
    3
)
echo "${ARRAY[@]}" # 1 2 3

# 指定元素位置
ARRAY=([2]=a [1]=b [0]=c)
echo "${ARRAY[@]}" # c b a

# 没有赋值的数组元素的默认值是空字符串。
ARRAY=(a [4]=hello)
echo "${ARRAY[@]}" # a hello

# 使用通配符，将当前文件夹下所有以 .sh 结尾的文件放入 shs 数组
shs=(*.sh)
echo "${shs[@]}" # create.sh

# 使用 declare 声明数组
declare -a ARRAY