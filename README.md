
- [Bash 脚本入门](#bash-脚本入门)
  - [Shebang 行](#shebang-行)
  - [执行权限和路径](#执行权限和路径)
  - [env 命令](#env-命令)
  - [脚本参数](#脚本参数)
    - [特殊变量](#特殊变量)
    - [使用 `for` 循环读取每一个参数：](#使用-for-循环读取每一个参数)
    - [使用 while 循环结合 shift 读取每一个参数](#使用-while-循环结合-shift-读取每一个参数)
    - [使用 getopts 命令处理带前置连线（-）的参数](#使用-getopts-命令处理带前置连线-的参数)
  - [配置项参数终止符 --](#配置项参数终止符---)
  - [exit 命令](#exit-命令)
  - [命令执行结果](#命令执行结果)
  - [source 命令](#source-命令)
  - [别名 alias](#别名-alias)
  - [参考](#参考)
- [read 命令](#read-命令)
  - [用法](#用法)
  - [参数](#参数)
  - [IFS (Internal Field Separator，内部字段分隔符)](#ifs-internal-field-separator内部字段分隔符)
  - [参考](#参考-1)
- [条件判断](#条件判断)
  - [if 结构](#if-结构)
  - [test 命令](#test-命令)
  - [判断表达式](#判断表达式)
  - [算数判断](#算数判断)
  - [普通命令的逻辑运算](#普通命令的逻辑运算)
  - [case 结构](#case-结构)
  - [参考](#参考-2)
- [循环](#循环)
  - [while](#while)
  - [until](#until)
  - [for in](#for-in)
  - [for](#for)
  - [break 和 continue](#break-和-continue)
  - [select](#select)
  - [参考](#参考-3)


## Bash 脚本入门

### Shebang 行
bash 脚本的第一行称为 Shebang 行
```
#!/bin/bash
# 或者
#!/usr/bin/env bash # 使用范围更广
```

### 执行权限和路径
```bash
# 给所有用户执行权限
$ chmod +x script.sh

# 给所有用户读权限和执行权限
$ chmod +rx script.sh
# 或者
$ chmod 755 script.sh

# 只给脚本拥有者读权限和执行权限
$ chmod u+rx script.sh
```

可以在将所有的脚本都放在 ~/bin 中，并将 ~/bin 加入 PATH（将 `export PATH=$PATH:~/bin` 添加到 `~/.bashrc` 的末尾），以避免每次执行脚本都输入脚本的完整路径（`cmd.sh` 代替 `/home/usr/path/cmd.sh`）。

### env 命令
- env 的二进制文件总是 /usr/bin/env
- `#!/usr/bin/env NAME` 的意思是让 Shell 查找 `$PATH` 环境变量里面第一个匹配的 `NAME`
    - 例如：Node.js 脚本的 Shebang 行可以写成：
        ```bash
        #!/usr/bin/env node
        ```

### 脚本参数

#### [特殊变量](./10-Bash-脚本入门/脚本参数/ex1.sh)
```bash
#!/usr/bin/env bash

echo "脚本名：" $0
echo '$1：'     $1
echo '$2：'     $2
echo '$3：'     $3
echo '$4：'     $4
echo "参数总数：" $#
echo "所有参数：" $@
```
执行 `./ex1.sh -p 0 hello --path world` 输出：
```bash
脚本名： ./ex1.sh
$1： -p
$2： 0
$3： hello
$4： --path
参数总数： 5
所有参数： -p 0 hello --path world
```

#### [使用 `for` 循环读取每一个参数](./10-Bash-脚本入门/脚本参数/ex2.sh)：
```bash
#!/usr/bin/env bash

for i in "$@"; do
    echo $i
done
```
执行 `./ex2.sh -p hello --path world "file path" "hello world"` 输出：
```bash
-p
hello
--path
world
file path
hello world
```
"file path" 中的 file path 将被看做一个整体。

#### [使用 while 循环结合 shift 读取每一个参数](./10-Bash-脚本入门/脚本参数/ex3.sh)
```bash
#!/usr/bin/env bash

echo "总共输入 $# 个参数"

while [ "$1" != "" ]; do # [] test 命令
    echo "剩下 $# 个参数"
    echo "参数：$1"
    shift # shift 2
done
```
执行 `./ex3.sh he llo wor ld` 输出：
```bash
总共输入 4 个参数
剩下 4 个参数
参数：he
剩下 3 个参数
参数：llo
剩下 2 个参数
参数：wor
剩下 1 个参数
参数：ld
```

#### [使用 getopts 命令处理带前置连线（-）的参数](./10-Bash-脚本入门/脚本参数/ex4.sh)
```bash
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
```
执行 `./ex4.sh -l -h -a 666` 输出：
```bash
linux config
ha ha ha
the value of a is a
5
```
执行 `./ex4.sh -l -h -a` 输出：
```bash
linux config
ha ha ha
./ex4.sh: option requires an argument -- a
usage: ex4.sh [-l] [-h] [-a somevalue]
```
执行 `./ex4.sh s -l -h -a` 输出：
```bash
1
```
这里 getopts 出错。

### 配置项参数终止符 --
- `--` 的作用是告诉 Bash 其后的以 - 或 -- 开头的参数不是配置项，只能当做实体参数解释。
    ```bash
    $ cat -f # 这里的 -f 被看做 cat 的配置项而报错
    cat: invalid option -- 'f'
    Try 'cat --help' for more information.

    $ cat -- -f # 这里 -f 被看做名为 -f 的文件，但是 -f 文件不存在而报错
    cat: -f: No such file or directory

    $ grep -- "--hello" example.txt # 在 example.txt 的查找 --hello
    ```

### exit 命令
- `exit 0` 终止当前脚本，并向 Bash 返回 0

### 命令执行结果
- `$?` 读取前一个命令的返回值
- [切换到指定目录 `dire`，若成功就列出 `dire` 中所有文件的详细信息](./10-Bash-脚本入门/命令执行结果/ex1.sh)
    ```bash
    #!/usr/bin/env bash

    cd abc
    if [ "$?" = "0" ]; then
        ls -l
    else
        echo "无法切换目录" 1>&2
        exit 1
    fi
    ```
    [或者](10-Bash-脚本入门/命令执行结果/ex2.sh)
    ```bash
    #!/usr/bin/env bash

    if cd abc; then
        ls -l
    else
        echo "无法切换目录" 1>&2
        exit 1
    fi
    ```
    [或者](10-Bash-脚本入门/命令执行结果/ex3.sh)
    ```bash
    # 第一步执行成功（返回 0），才会执行第二步
    cd abc && ls -l
    # 第一步执行失败（返回非 0），才会执行第二步
    cd abc || exit 1
    ```

### source 命令
- [source 在当前 Shell （而非新建一个 Shell）执行脚本](10-Bash-脚本入门/source命令/ex1.sh)
    ```bash
    ➜  source命令 foo=1
    ➜  source命令 ./ex1.sh

    ➜  source命令 source ex1.sh
    1
    ```
- 重新加载一个配置文件 `source .bashrc`
- 在脚本内部连接外部库 `source ./lib.sh`
- `. .bashrc` 等价于 `source .bashrc`

### 别名 alias
- 为一个命令（只能是命令，不能是如路径等其他）指定别名
    ```bash
    alias NAME=DEFINITION
    ```
- 可将常用别名添加在 .bashrc 尾部

### 参考
https://wangdoc.com/bash/script.html

## read 命令

### 用法
- [接收用户输入，存入 text](11-read-命令/ex1.sh)
    ```bash
    #!/usr/bin/env bash

    echo -n "请输入："
    read text
    echo "你的输入：${text}"
    ```
    输出：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex1.sh
    请输入：hello world
    你的输入：hello world
    ```
- [接收多个值](./11-read-命令/ex2.sh)
    ```bash
    #!/usr/bin/env bash

    echo -n "请输入姓名："
    read FN LN
    echo "hello $FN · $LN"
    ```
    输出：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex2.sh
    请输入姓名：瑞峰 岳
    hello 瑞峰 · 岳
    ```
- [变量数目不匹配时](./11-read-命令/ex3.sh)
    ```bash
    #!/usr/bin/env bash

    echo -n "请输入 2 个参数："
    read a b
    echo "a: $a, b: $b"
    ```
    输出：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex3.sh
    请输入 2 个参数：re sa
    a: re, b: sa
    ➜  11-read-命令 git:(main) ✗ ./ex3.sh
    请输入 2 个参数：re sa cc nv
    a: re, b: sa cc nv
    ```
    多出来的变量都赋给最后一个变量。
- [read 之后没有变量](11-read-命令/ex4.sh)
    ```bash
    #!/usr/bin/env bash

    echo -n "请输入："
    read
    echo "$REPLY"
    ```
    输出：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex4.sh
    请输入：a b c d
    a b c d
    ```
- [read 读取文件内容]
    ```bash
    #!/usr/bin/env bash

    while read line
    do
        echo "$line"
    done < ex5.sh
    ```
    输出：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex5.sh
    #!/usr/bin/env bash

    while read line
    do
    echo "$line"
    ```
    最后一行 `done < ex5.sh` 没有输出，但若是 `done < ex5.sh` 之后还有空行 `done < ex5.sh` 就会被输出。

### 参数
- [`-t` 设置等待输入的超时时间](11-read-命令/ex6.sh)
    ```bash
    #!/usr/bin/env bash

    # 等待 3 秒
    if read -t 3 text; then
        echo "用户输入：$text"
    else
    echo '用户没有输出'
    fi
    ```
    执行：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex6.sh
    ./ex6.sh: line 3: read: text: invalid timeout specification
    用户没有输出
    ➜  11-read-命令 git:(main) ✗ ./ex6.sh
    32
    用户输入：32
    ```
- [`-p` 指定输入的提示信息]
    ```bash
    #!/usr/bin/env bash

    read -p "请输入：" text
    echo $text
    ```
    执行：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex7.sh
    请输入：2
    2
    ```
- [`-a` 将用户输入赋值给一个数组](11-read-命令/ex8.sh)
    ```bash
    #!/usr/bin/env bash

    read -a array
    echo ${array[0]}
    echo ${array[1]}
    ```
    输出：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex8.sh
    yue rui feng
    yue
    rui
    ```
- `-n` 指定读取字符个数
- `-e` 允许用户输入的时候，使用 readline 库提供的快捷键，比如自动补全
- `-d` delimiter：定义字符串 delimiter 的第一个字符作为用户输入的结束，而不是一个换行符
- `-r` raw 模式，表示不把用户输入的反斜杠字符解释为转义字符
- `-s` 使得用户的输入不显示在屏幕上，这常常用于输入密码或保密信息
- `-u` fd：使用文件描述符 fd 作为输入

### IFS (Internal Field Separator，内部字段分隔符)
- IFS 默认为「空格，Tab，换行」
- [IFS 的赋值命令与 read 写在一行，则在 read 执行结束后 IFS 自动回复为旧值](11-read-命令/ex9.sh)
    ```bash
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
    ```
    `<<<` 的意思是将后面的变量值转化为标准输入，因为 read 只能读取标准输入。

    执行：
    ```bash
    ➜  11-read-命令 git:(main) ✗ ./ex9.sh
    用户名：wddxrw
    user: wddxrw
    pw: x
    uid: 1000
    gid: 1000
    name: ,,,
    home: /home/wddxrw
    shell: /usr/bin/zsh
    ➜  11-read-命令 git:(main) ✗ ./ex9.sh
    用户名：xxx
    no such user: xxx
    ```

### 参考
https://wangdoc.com/bash/read.html


## 条件判断

### if 结构
- 语法
    ```bash
    if commands; then
        commands
    [elif commands; then
        commands...]
    [else
        commands]
    fi
    ```
- if 后可跟若干条命令，所有命令都会执行，只有最后一条命令的成功与否（是否返回 0），会决定 then 是否会执行。
    ```bash
    ➜  12-if-结构 git:(main) ✗  if false; false; true; then echo "hello"; else echo "world"; fi;
    hello
    ➜  12-if-结构 git:(main) ✗  if false; true; false; then echo "hello"; else echo "world"; fi;
    world
    ➜  12-if-结构 git:(main) ✗  false
    ➜  12-if-结构 git:(main) ✗  echo $?
    1
    ➜  12-if-结构 git:(main) ✗  true
    ➜  12-if-结构 git:(main) ✗  echo $?
    0
    ```

### test 命令
- if 的判断条件一般使用 test 命令
- test 命令的三种写法
    ```bash
    #!/usr/bin/env bash

    if test -e /tmp/abc
    then
        echo "/tmp/abc 存在"
    fi

    if [ -e /etc/hosts ]; then
        echo "/etc/hosts 存在"
    fi

    if [[ -e /etc/passwd ]]; then
        echo "/etc/passwd 存在"
    fi
    ```
    [[]] 中的表达式支持正则。
    执行：
    ```bash
    ➜  12-if-结构 git:(main) ✗ ./test.sh
    /etc/hosts 存在
    /etc/passwd 存在
    ```

### 判断表达式
- if 后跟的是一个或多个命令，命令返回 0 时代表成立，否则代表不成立。命令可以是 `test` 命令，也可以是其他命令。
- 文件判断
  - `[ -a file ]`：如果 file 存在，则为 true。
  - `[ -b file ]`：如果 file 存在并且是一个块（设备）文件，则为 true。
  - `[ -c file ]`：如果 file 存在并且是一个字符（设备）文件，则为 true。
  - `[ -d file ]`：如果 file 存在并且是一个目录，则为 true。
  - `[ -e file ]`：如果 file 存在，则为 true。
  - `[ -f file ]`：如果 file 存在并且是一个普通文件，则为 true。
  - `[ -g file ]`：如果 file 存在并且设置了组 ID，则为 true。
  - `[ -G file ]`：如果 file 存在并且属于有效的组 ID，则为 true。
  - `[ -h file ]`：如果 file 存在并且是符号链接，则为 true。
  - `[ -k file ]`：如果 file 存在并且设置了它的 “[sticky bit](https://zh.wikipedia.org/zh-hans/%E9%BB%8F%E6%BB%9E%E4%BD%8D)”，则为 true。
  - `[ -L file ]`：如果 file 存在并且是一个符号链接，则为 true。
  - `[ -N file ]`：如果 file 存在并且自上次读取后已被修改，则为 true。
  - `[ -O file ]`：如果 file 存在并且属于有效的用户 ID，则为 true。
  - `[ -p file ]`：如果 file 存在并且是一个命名管道，则为 true。
  - `[ -r file ]`：如果 file 存在并且可读（当前用户有可读权限），则为 true。
  - `[ -s file ]`：如果 file 存在且其长度大于零，则为 true。
  - `[ -S file ]`：如果 file 存在且是一个网络 socket，则为 true。
  - `[ -t fd ]`：如果 fd 是一个文件描述符，并且重定向到终端，则为 true。 这可以用来判断是否重定向了标准输入／输出／错误。
  - `[ -u file ]`：如果 file 存在并且设置了 setuid 位，则为 true。
  - `[ -w file ]`：如果 file 存在并且可写（当前用户拥有可写权限），则为 true。
  - `[ -x file ]`：如果 file 存在并且可执行（有效用户有执行／搜索权限），则为 true。
  - `[ file1 -nt file2 ]`：如果 FILE1 比 FILE2 的更新时间最近，或者 FILE1 存在而 FILE2 不存在，则为 true。
  - `[ file1 -ot file2 ]`：如果 FILE1 比 FILE2 的更新时间更旧，或者 FILE2 存在而 FILE1 不存在，则为 true。
  - `[ FILE1 -ef FILE2 ]`：如果 FILE1 和 FILE2 引用相同的设备和 inode 编号，则为 true。

    示例：
    ```bash
    #!/usr/bin/env bash

    FILE="./file.sh"

    if [ -e "$FILE" ]; then # 这里的 $FILE 必须被「双引号」包围
        echo "$FILE 文件存在"
    fi
    ```
    执行：
    ```bash
    ➜  12-if-结构 git:(main) ✗ ./file.sh
    ./file.sh 文件存在
    ```
- 字符串判断
    - `[ string ]`：如果 string 不为空（长度大于 0），则判断为真。
    - `[ -n string ]`：如果字符串 string 的长度大于零，则判断为真。
    - `[ -z string ]`：如果字符串 string 的长度为零，则判断为真。
    - `[ string1 = string2 ]`：如果 string1 和 string2 相同，则判断为真。
    - `[ string1 == string2 ]` 等同于 `[ string1 = string2 ]`。
    - `[ string1 != string2 ]`：如果 string1 和 string2 不相同，则判断为真。
    - `[ string1 '>' string2 ]`：如果按照字典顺序 string1 排列在 string 之后，则判断为真。
    - `[ string1 '<' string2 ]`：如果按照字典顺序 string1 排列在 string2 之前，则判断为真。

    注意，`test` 命令内部的 `>` 和 `<`，必须用引号引起来（或者是用反斜杠转义）。否则，它们会被 shell 解释为重定向操作符。

- 整数判断
    - `[ integer1 -eq integer2 ]`：如果 integer1 等于 integer2，则为 true。
    - `[ integer1 -ne integer2 ]`：如果 integer1 不等于 integer2，则为 true。
    - `[ integer1 -le integer2 ]`：如果 integer1 小于或等于 integer2，则为 true。
    - `[ integer1 -lt integer2 ]`：如果 integer1 小于 integer2，则为 true。
    - `[ integer1 -ge integer2 ]`：如果 integer1 大于或等于 integer2，则为 true。
    - `[ integer1 -gt integer2 ]`：如果 integer1 大于 integer2，则为 true。

- 正则判断
    - [[ expression ]]这种判断形式，支持正则表达式。
      例如：`[[ string1 =~ regex ]]`，`=~` 是正则比较运算符。

- `test` 判断的逻辑运算
    - `AND` 运算：符号 `&&`，也可使用参数 `-a`。
    - `OR` 运算：符号 `||`，也可使用参数 `-o`。
    - `NOT` 运算：符号 `!`。

    [判断整数是否在某个范围内](12-if-结构/file_digit.sh)：
    ```bash
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
    ```
    执行：
    ```bash
    ➜  12-if-结构 git:(main) ✗ ./file_digit.sh
    50 在范围内
    ```

### 算数判断
- 使用 `(())` 进行算数判断：
    ```bash
    if ((3 > 2)); then
        echo "true"
    fi
    ```
    如果算术计算的结果是非零值，则表示判断成立。这一点跟命令的返回值正好相反，需要小心。

### 普通命令的逻辑运算
- ```bash
  $ command1 && command2 # 先执行 command1，只有 command1 执行成功后， 才会执行 command2
  $ command1 || command2 # 先执行 command1，只有 command1 执行失败后， 才会执行 command2
  ```


### case 结构
- 语法
    ```bash
    case expression in
        pattern )
            commands ;;
        pattern )
            commands ;;
        ...
    esac
    ```
- 使用 `case` 判断当前操作系统类型
    ```bash
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
    ```
    执行：
    ```bash
    ➜  12-if-结构 git:(main) ✗ ./case.sh
    This is Linux
    ```
- `case` 模式中可用的通配模式
    - `a)`：匹配 a。
    - `a|b)`：匹配 a 或 b。
    - `[[:alpha:]])`：匹配单个字母。
    - `???)`：匹配 3 个字符的单词。
    - `*.txt)`：匹配 .txt 结尾。
    - `*)`：匹配任意输入，通常作为 case 结构的最后一个模式。
- Bash 4.0 之后，允许匹配多个条件，这时可以用 `;;&` 终止每个条件块。

### 参考
https://wangdoc.com/bash/condition.html

## 循环

### while
- 语法：
    ```bash
    while condition; do
        commands
    done
    ```
    其中 condition 与 if 中的 condition 用法和注意点相同。

### until
- 语法：
    ```bash
    until condition; do
        commands
    done
    ```
    与 `while` 正好相反，只要条件`不成立`，就一直循环下去。

### for in
- 遍历链表中的每一项。
- 语法：
    ```bash
    for variable in list; do
        commands
    done
    ```

### for
- C 语言版的 for 循环。
- 语法：
    ```bash
    for (( expression1; expression2; expression3 )); do
        commands
    done
    ```
- `(())` 中访问变量不必加 `$`:
    ```bash
    for (( i=0; i<5; i=i+1 )); do
        echo $i
    done
    ```

### break 和 continue
- 同 C。

### select
- 生成简单的菜单。
- 语法：
    ```bash
    select name
    [in list]
    do
        commands
    done
    ```
- [示例](12-循环/select.sh)：
    ```bash
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
    ```
    执行：
    ```bash
    ➜  12-循环 git:(main) ✗ ./select.sh
    你最喜欢的操作系统是？
    1) Arch
    2) Ubuntu
    3) Win10
    4) MacOS
    #? 1
    i also like Arch
    #? 4
    我买不起 Mac
    #? w
    我没听说过
    #? ^C
    ```

### 参考
https://wangdoc.com/bash/loop.html