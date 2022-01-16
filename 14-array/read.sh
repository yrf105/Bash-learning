#!/usr/bin/env bash

# 读取单个元素
array[0]=a
# 加大括号
echo ${array[0]} # a
# 不加大括号，默认读取 0 位置的元素
echo $array[0] # a[0]

# 读取所有成员
# @ 和 * 是数组的特殊索引，表示返回数组的所有成员。
foo=(a b c d e f)
echo "${foo[@]}" # a b c d e f
echo "${foo[*]}" # a b c d e f

# 配合 for 循环遍历数组
for i in "${foo[@]}"; do
    echo -n "$i,"
done
echo
# a,b,c,d,e,f,

bar=("hello world" "yue rui feng" xi dian tyut)
# ${bar[@]} 是否放在 "" 中存在区别
for i in ${bar[@]}; do
    echo $i
done
# hello
# world
# yue
# rui
# feng
# xi
# dian
# tyut

for i in "${bar[@]}"; do
    echo $i
done
# hello world
# yue rui feng
# xi
# dian
# tyut

# ${bar[*]} 不放在 "" 中的效果同 ${bar[@]}

# ${bar[*]} 放在 "" 中
for i in "${bar[*]}"; do
    echo $i
done
# hello world yue rui feng xi dian tyut

# 拷贝数组
barCopy=( "${bar[@]}" )
echo "${barCopy[@]}" # hello world yue rui feng xi dian tyut

# 追加元素
barAppend=( "${bar[@]}" 321)
echo "${barAppend[@]}" # hello world yue rui feng xi dian tyut 321
