#!/usr/bin/env bash

passwd=/etc/passwd
read -p "用户名：" username

userinfo="$(grep "^$username" $passwd)"

if [ -n "$userinfo" ]; then
    IFS=":" read user pw uid gid name home shell <<< "$userinfo"
    echo "user: $user"
    echo "pw: $pw"
    echo "uid: $uid"
    echo "gid: $gid"
    echo "name: $name"
    echo "home: $home"
    echo "shell: $shell"
else
    echo "no such user: $username" >&2
    exit 1
fi
