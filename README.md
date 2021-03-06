- [Bash 简介](#bash-简介)
  - [Shell 的含义](#shell-的含义)
  - [Shell 的种类](#shell-的种类)
  - [命令行环境](#命令行环境)
    - [终端模拟器](#终端模拟器)
    - [命令行提示符](#命令行提示符)
    - [进入和退出方法](#进入和退出方法)
    - [查看 Shell 版本](#查看-shell-版本)
- [Bash 基本语法](#bash-基本语法)
  - [echo 命令](#echo-命令)
  - [命令格式](#命令格式)
  - [空格](#空格)
  - [分号](#分号)
  - [命令组合符 `&&` 和 `||`](#命令组合符--和-)
  - [`type` 命令](#type-命令)
  - [快捷键](#快捷键)
- [Bash 模式扩展](#bash-模式扩展)
  - [简介](#简介)
  - [`~` 波浪线扩展](#-波浪线扩展)
  - [`?` 字符扩展](#-字符扩展)
  - [`*` 字符扩展](#-字符扩展-1)
  - [`[]` 方括号扩展](#-方括号扩展)
  - [`[start-end]` 扩展](#start-end-扩展)
  - [`{}` 大括号扩展](#-大括号扩展)
  - [`{start-end}` 扩展](#start-end-扩展-1)
  - [变量扩展](#变量扩展)
  - [子命令扩展](#子命令扩展)
  - [算术扩展](#算术扩展)
  - [字符类](#字符类)
  - [注意](#注意)
  - [量词语法](#量词语法)
  - [shopt 命令](#shopt-命令)
  - [参考](#参考)
- [引号和转义](#引号和转义)
  - [转义](#转义)
  - [单引号](#单引号)
  - [双引号](#双引号)
  - [Here 文档](#here-文档)
  - [Here 字符串](#here-字符串)
  - [参考](#参考-1)
- [变量](#变量)
  - [环境变量](#环境变量)
  - [自定义变量](#自定义变量)
  - [参考](#参考-2)
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
  - [参考](#参考-3)
- [read 命令](#read-命令)
  - [用法](#用法)
  - [参数](#参数)
  - [IFS (Internal Field Separator，内部字段分隔符)](#ifs-internal-field-separator内部字段分隔符)
  - [参考](#参考-4)
- [条件判断](#条件判断)
  - [if 结构](#if-结构)
  - [test 命令](#test-命令)
  - [判断表达式](#判断表达式)
  - [算数判断](#算数判断)
  - [普通命令的逻辑运算](#普通命令的逻辑运算)
  - [case 结构](#case-结构)
  - [参考](#参考-5)
- [循环](#循环)
  - [while](#while)
  - [until](#until)
  - [for in](#for-in)
  - [for](#for)
  - [break 和 continue](#break-和-continue)
  - [select](#select)
  - [参考](#参考-6)
- [函数](#函数)
  - [简介](#简介-1)
  - [参数变量](#参数变量)
  - [return 命令](#return-命令)
  - [全局变量和局部变量](#全局变量和局部变量)
  - [参考](#参考-7)
- [数组](#数组)
  - [创建数组](#创建数组)
  - [读取数组](#读取数组)
    - [读取单个元素](#读取单个元素)
    - [读取所有成员](#读取所有成员)
    - [拷贝数组](#拷贝数组)
    - [追加元素](#追加元素)
  - [数组长度](#数组长度)
  - [提取数组序号](#提取数组序号)
  - [提取数组成员](#提取数组成员)
  - [追加数组成员](#追加数组成员)
  - [删除数组](#删除数组)
  - [关联数组](#关联数组)
  - [参考](#参考-8)


## Bash 简介

Bash 是绝大多数 Linux 发行版的默认 Shell。

### Shell 的含义

- Shell 是一个程序，为用户提供一个与操作系统对话的命令行环境
- Shell 是一个命令解释器，可以写 Shell 脚本给 Shell 解释执行
- Shell 是一个工具箱，提供了各种方便的小工具

### Shell 的种类

Bourne Shell（sh）、Bourne Again shell（bash）、C Shell（csh）、TENEX C Shell（tcsh）、Korn shell（ksh）、Z Shell（zsh）、Friendly Interactive Shell（fish）。其中 Bash 最常用

- 查看当前运行的 Shell

  ```shell
  $ echo $SHELL
  /usr/bin/zsh
  ```

- 查看当前系统安装的所有 Shell

  ```shell
  $ cat /etc/shells
  # /etc/shells: valid login shells
  /bin/sh
  /bin/bash
  /usr/bin/bash
  /bin/rbash
  /usr/bin/rbash
  /bin/dash
  /usr/bin/dash
  /usr/bin/tmux
  /usr/bin/screen
  /bin/zsh
  /usr/bin/zsh
  ```

### 命令行环境

#### 终端模拟器

终端模拟器（terminal emulator）是一个模拟命令行的窗口程序，可以让用户在图形环境中进入命令行环境，使用 Shell

#### 命令行提示符

```shell
[user@hostname] $
```

root 用户不是 `$` 而是 `#`

#### 进入和退出方法

- 启动 Bash

  ```shell
  $ bash
  ```

- 退出 Bash

  ```shell
  $ exit
  ```

  或者 Ctrl + d


#### 查看 Shell 版本

```shell
➜  ~ bash --version
GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

➜  ~ zsh --version
zsh 5.8 (x86_64-ubuntu-linux-gnu)
```

## Bash 基本语法

### echo 命令

- 输出单行文本

  ```shell
  ➜  ~ echo hello world
  hello world
  ```

- 输出多行文本，需要 `“”`

  ```shell
  ➜  ~ echo "<html>
  dquote> </html>
  dquote> "
  <html>
  </html>
  ```

- `-n` 取消末尾默认的回车符

  ```shell
  ➜  ~ echo -n hello
  hello%
  ```

- `-e` 解释引号（单引号或者双引号）里的特殊字符（例如 `\n`）

  ```shell
  $ echo "hello\nworld"
  hello\nworld
  $ echo 'hello\nworld'
  hello\nworld
  $ echo -e "hello\nworld"
  hello
  world
  $ echo -e 'hello\nworld'
  hello
  world
  ```

### 命令格式

- ```shell
  $ command [ arg1 ... [ argN ]]
  ```

  - command 为具体的命令
  - arg1 ... argN 传递给命令的可选参数
- 以 `-` 开头的参数是命令的配置项，配置项分为短形式和长形式

  ```shell
  # 短形式 便于手动输入
  $ ls -r

  # 长形式 便于命令自解释 常用于脚本
  $ ls --reverse
  ```

- `\` 将命令分为多行

  ```shell
  $ echo foo bar
  foo bar
  $ echo foo \
  > bar
  foo bar
  ```

### 空格

- Bash 使用空格（或 Tab）分隔不同参数

  ```shell
  $ command foo bar
  ```

- Bash 会自动忽略多余的空格

  ```shell
  $ echo hello       world
  hello world
  ```

### 分号

- `;` 是命令结束符，使得一行可以放置多行命令，命令按序执行，不论上一个命令成功或失败，当前命令总是会执行

  ```shell
  $ clear; ls
  ```

### 命令组合符 `&&` 和 `||`

-
  ```shell
  # 若 Command1 执行成功，则继续执行 Command2
  Command1 && Command2

  # 若 Command1 执行失败，则继续执行 Command2
  Command1 || Command2
  ```

### `type` 命令

- `type` 命令用来判断命令的来源（内置命令 or 外部程序）

  ```shell
  $ type echo
  echo is a shell builtin
  $ type ls
  ls is aliased to `ls --color=auto'
  ```

- `-a` 查看命令的所有定义

  ```shell
  $ type -a ls
  ls is aliased to `ls --color=auto'
  ls is /usr/bin/ls
  ls is /bin/ls
  $ type -a echo
  echo is a shell builtin
  echo is /usr/bin/echo
  echo is /bin/echo
  ```

- `-t` 查看命令的类型：别名（alias），关键词（keyword），函数（function），内置命令（builtin）和文件（file）

  ```shell
  $ type -t ls
  alias
  $ type -t type
  builtin
  ```

### 快捷键

- `Ctrl + L`：清除屏幕并将当前行移到页面顶部。
- `Ctrl + C`：中止当前正在执行的命令。
- `Shift + PageUp`：向上滚动。
- `Shift + PageDown`：向下滚动。
- `Ctrl + U`：从光标位置删除到行首。
- `Ctrl + K`：从光标位置删除到行尾。
- `Ctrl + D`：关闭 Shell 会话。
- `↑`，`↓`：浏览已执行命令的历史记录。
- `Tab`：自动补全，两次 `Tab` 显示自动补全的所有可选项


## Bash 模式扩展

### 简介

用户输入命令后，Shell 首先会按照空格将命令拆分成若干个 token，然后对存在特殊字符的 token 进行**模式扩展**（globbing），最后才会执行相应的命令。

Bash 提供了 8 种扩展：`~`、`?`、`*`、`[]`、`{}`、变量扩展、子命令扩展、算数扩展。

模式扩展的执行者是 Bash，而不是命令。

关闭模式扩展：

```shell
$ set -o noglob
# or
$ set -f
```

重新打开扩展：

```shell
$ set +o noglob
# or
$ set +f
```

### `~` 波浪线扩展

- `~` 会自动扩展成用户主目录

  ```shell
  $ echo ~
  /home/strangerxd
  ```

- `~/dir` 扩展为用户主目录下的 dir

  ```shell
  $ echo ~/dir
  /home/strangerxd/dir
  ```

- `~user` 扩展成用户 `user` 的主目录

  ```shell
  $ echo ~root
  /root
  ```

  若 `user` 用户不存在，则 `~` 不起作用

  ```shell
  $ echo ~wddxrw
  ~wddxrw
  ```

- `~+` 扩展为当前目录，相当于 `pwd`

  ```shell
  $ echo ~+
  /home/strangerxd
  $ pwd
  /home/strangerxd
  ```

### `?` 字符扩展

- `?` 字符代表文件路径里面的任意单个字符，不包括空字符。
- 如果 `?.txt` 可以扩展成文件名，echo 命令会输出扩展后的结果；如果不能扩展成文件名，echo 就会原样输出 `?.txt`。

### `*` 字符扩展

- `*` 字符代表文件路径里面的任意数量的任意字符，包括零个字符。
- `*` 不会匹配隐藏文件（以 . 开头的文件）。
- 如果要匹配隐藏文件，需要写成 `.*`。
- 如果要匹配除 `.` 和 `..` 以外的隐藏文件 `.[!.]*`。
- `*` 字符扩展属于文件名扩展，只有文件确实存在的前提下才会扩展。如果文件不存在，就会原样输出。
- `**` 匹配零个或多个子目录。因此，`**/*.txt` 可以匹配顶层的文本文件和任意深度子目录的文本文件。

### `[]` 方括号扩展

- 方括号扩展的形式是 `[...]`，只有文件确实存在的前提下才会扩展。如果文件不存在，就会原样输出。
- `[abc]` 匹配 `a b c` 中的任意一个字符。
- `[^...]` 和 `[!...]` 表示匹配不在方括号里面的字符。
- 如果需要匹配连字号 `-`，只能放在方括号内部的开头或结尾，比如 `[-aeiou]` 或` [aeiou-]`。

### `[start-end]` 扩展

- 方括号扩展有一个简写形式 `[start-end]`，表示匹配一个连续的范围。比如，`[a-c]` 等同于 `[abc]`，`[0-9]` 匹配 `[0123456789]`。
- 常用示例：
  - `[a-z]`：所有小写字母。
  - `[a-zA-Z]`：所有小写字母与大写字母。
  - `[a-zA-Z0-9]`：所有小写字母、大写字母与数字。
  - `[abc]*`：所有以 a、b、c 字符之一开头的文件名。
  - `program.[co]`：文件 program.c 与文件 program.o。
  - `BACKUP.[0-9][0-9][0-9]`：所有以 BACKUP. 开头，后面是三个数字的文件名。
- 否定形式 `[!start-end]`，表示匹配不属于这个范围的字符。

### `{}` 大括号扩展

- 大括号扩展 `{...}` 表示分别扩展成大括号里面的**所有值**，各个值之间使用逗号分隔。比如，`{1,2,3}` 扩展成 1 2 3。
- 大括号扩展不是文件名扩展。它会扩展成所有给定的值，而不管是否有对应的文件存在。
- 大括号内部的逗号前后不能有空格。
- 逗号前面可以没有值，表示扩展的第一项为空。
- 大括号可以嵌套。
- 大括号也可以与其他模式联用，并且总是先于其他模式进行扩展。
- 大括号可以用于多字符的模式，方括号不行（只能匹配单字符）。

### `{start-end}` 扩展

- 大括号扩展有一个简写形式 `{start..end}`，表示扩展成一个连续序列。比如，`{a..z}` 可以扩展成 26 个小写英文字母。
- 支持逆序。
- 如果遇到无法理解的简写，大括号模式就会原样输出，不会扩展。
- 可以嵌套使用。
- 如果整数前面有前导 `0`，扩展输出的每一项都有前导 `0`。
    ```Bash
    $ echo {01..5}
    01 02 03 04 05

    $ echo {001..5}
    001 002 003 004 005
    ```
- 使用第二个双点号 {start..end..step}，用来指定扩展的步长。
- 多个简写形式连用，会有循环处理的效果。
    ```Bash
    $ echo {a..c}{1..3}
    a1 a2 a3 b1 b2 b3 c1 c2 c3
    ```

### 变量扩展

- Bash 将美元符号 `$` 开头的词元视为变量，将其扩展成变量值。
- 变量名除了放在美元符号后面，也可以放在 `${}` 里面。
- `${!S*}` 扩展成所有以 `S` 开头的变量名。

### 子命令扩展

- `$(...)` 可以扩展成另一个命令的运行结果，该命令的所有输出都会作为返回值。
    ```Bash
    $ echo $(echo ${SHELL})
    /usr/bin/zsh
    $ echo $(SHELL)
    SHELL: command not found
    ```
- 子命令放在反引号之中，也可以扩展成命令的运行结果。
- 可以嵌套。

### 算术扩展

- `$((...))` 可以扩展成整数运算的结果。

### 字符类

- `[[:class:]]` 表示一个字符类，扩展成某一类特定字符之中的一个。常用的字符类如下。

  - `[[:alnum:]]`：匹配任意英文字母与数字
  - `[[:alpha:]]`：匹配任意英文字母
  - `[[:blank:]]`：空格和 Tab 键。
  - `[[:cntrl:]]`：ASCII 码 0-31 的不可打印字符。
  - `[[:digit:]]`：匹配任意数字 0-9。
  - `[[:graph:]]`：A-Z、a-z、0-9 和标点符号。
  - `[[:lower:]]`：匹配任意小写字母 a-z。
  - `[[:print:]]`：ASCII 码 32-127 的可打印字符。
  - `[[:punct:]]`：标点符号（除了 A-Z、a-z、0-9 的可打印字符）。
  - `[[:space:]]`：空格、Tab、LF（10）、VT（11）、FF（12）、CR（13）。
  - `[[:upper:]]`：匹配任意大写字母 A-Z。
  - `[[:xdigit:]]`：16 进制字符（A-F、a-f、0-9）。

- 字符类的第一个方括号后面，可以加上感叹号!，表示否定。比如，[![:digit:]]匹配所有非数字。
- 字符类也属于文件名扩展，如果没有匹配的文件名，字符类就会原样输出。

### 注意

- 通配符是先解释，再执行。
- 文件名扩展在不匹配时，会原样输出。
- 只适用于单层路径。
- 文件名可以使用通配符。

### 量词语法

- 量词语法用来控制模式匹配的次数。它只有在 Bash 的 extglob 参数打开的情况下才能使用。
    ```Bash
    $ shopt extglob
    extglob         on # 默认打开
    ```
    若关闭使用 `shopt -s extglob` 打开。
- `?(pattern-list)`：匹配零个或一个模式。
- `*(pattern-list)`：匹配零个或多个模式。
- `+(pattern-list)`：匹配一个或多个模式。
- `@(pattern-list)`：只匹配一个模式。
- `!(pattern-list)`：匹配给定模式以外的任何内容。

### shopt 命令

- shopt 命令可以调整 Bash 的行为。
    ```bash
    # 打开某个参数
    $ shopt -s [optionname]

    # 关闭某个参数
    $ shopt -u [optionname]

    # 查询某个参数关闭还是打开
    $ shopt [optionname]
    ```
- `dotglob` 参数可以让扩展结果包括隐藏文件（即点开头的文件）。默认关闭。
- `nullglob` 参数可以让通配符不匹配任何文件名时，返回空字符。默认关闭。
- `failglob` 参数使得通配符不匹配任何文件名时，Bash 会直接报错，而不是让各个命令去处理。默认关闭。
- `extglob` 参数使得 Bash 支持 ksh 的一些扩展语法。默认打开。
- `nocaseglob` 参数可以让通配符扩展不区分大小写。默认关闭。
- `globstar` 参数可以使得 `**` 匹配零个或多个子目录。默认关闭。

### 参考

https://wangdoc.com/bash/expansion.html

## 引号和转义

Bash 只有一种数据类型，就是字符串。不管用户输入什么数据，Bash 都视为字符串。因此，字符串相关的引号和转义，对 Bash 来说就非常重要。

### 转义

- 如果想要原样输出 `$` `&` `*` `\` 特殊字符，就必须在它们前面加上反斜杠，使其变成普通字符。这就叫做“转义”（escape）。
- 反斜杠除了用于转义，还可以表示一些不可打印的字符。
  - `\a`：响铃
  - `\b`：退格
  - `\n`：换行
  - `\r`：回车
  - `\t`：制表符
  - 在命令行中中使用这些不可打印字符。
    ```bash
    $ echo aa\tb
    aatb
    $ echo "aa\tb"
    aa\tb
    $ echo -e "aa\tb"
    aa      b
    ```
- 换行符是一个特殊字符，表示命令的结束，Bash 收到这个字符以后，就会对输入的命令进行解释执行。换行符前面加上反斜杠转义，就使得换行符变成一个普通字符，Bash 会将其当作空格处理，从而可以将一行命令写成多行。
    ```bash
    $ mv \
    /path/to/foo \
    /path/to/bar

    # 等同于
    $ mv /path/to/foo /path/to/bar
    ```

### 单引号

- 单引号用于保留字符的字面含义，各种特殊字符在单引号里面，都会变为普通字符。
- 并不能通过 `\` 在单引号里使用 '
    ```bash
    $ echo 'ab\'c'
    > '
    ab\c

    $ echo $'ab\'c' # 可以的做法
    ab'c
    $ echo "ab\'c" # 正确的做法
    ab\'c
    ```
### 双引号

- 双引号比单引号宽松，大部分特殊字符在双引号里面，都会失去特殊含义，变成普通字符。美元符号 `$`、反引号 \` 和反斜杠 `\`。这三个字符在双引号之中，依然有特殊含义，会被 Bash 自动扩展。
- 换行符在双引号之中，会失去特殊含义，Bash 不再将其解释为命令的结束，只是作为普通的换行符。
- 双引号的另一个常见的使用场合是，文件名包含空格。这时就必须使用双引号（或单引号），将文件名放在里面。
- 双引号还有一个作用，就是保存原始命令的输出格式。
    ```bash
    $ echo $(cal)
    January 2022 Su Mo Tu We Th Fr Sa 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    (base) wddxrw@LAPTOP-7A1CH1LG:~$ echo "$(cal)"
        January 2022
    Su Mo Tu We Th Fr Sa
                    1
    2  3  4  5  6  7  8
    9 10 11 12 13 14 15
    16 17 18 19 20 21 22
    23 24 25 26 27 28 29
    30 31
    ```

### Here 文档

- Here 文档（here document）是一种输入多行字符串的方法，格式如下。
    ```bash
    << token
    text
    token
    ```
- Here 文档内部会发生变量替换，同时支持反斜杠转义，但是不支持通配符扩展，双引号和单引号也失去语法作用，变成了普通字符。
    ```bash
    $ foo='hello world'
    $ cat << _example_
    $foo
    "$foo"
    '$foo'
    _example_

    hello world # $foo 发生了变量替换
    "hello world" # "$foo" 双引号被原样输出
    'hello world' # "$foo" 单引号被原样输出
    ```
- 如果不希望发生变量替换，可以把 Here 文档的开始标记放在单引号之中。
    ```bash
    $ foo='hello world'
    $ cat << '_example_'
    $foo
    "$foo"
    '$foo'
    _example_

    $foo
    "$foo"
    '$foo'
    ```
- Here 文档的本质是重定向，它将字符串重定向输出给某个命令，相当于包含了echo命令。
    ```bash
    $ command << token
    string
    token

    # 等同于

    $ echo string | command
    ```
- Here 字符串只适合那些可以接受标准输入作为参数的命令，对于其他命令无效。
- Here 文档也不能作为变量的值，只能用于命令的参数。

### Here 字符串

- Here 字符串是将字符串通过标准输入，传递给命令的方法，格式如下：
    ```bash
    <<< string
    ```
- 有些命令直接接受给定的参数，与通过标准输入接受参数，结果是不一样的。所以才有了这个语法，使得将字符串通过标准输入传递给命令更方便，比如 cat 命令只接受标准输入传入的字符串。

### 参考

https://wangdoc.com/bash/quotation.html

## 变量

Bash 变量分成环境变量和自定义变量两类。

### 环境变量
- 环境变量是 Bash 环境自带的变量。
- `env` 命令或 `printenv` 命令，可以显示所有环境变量。
- 常见的环境变量
  - `BASHPID`：Bash 进程的进程 ID。
  - `BASHOPTS`：当前 Shell 的参数，可以用shopt命令修改。
  - `DISPLAY`：图形环境的显示器名字，通常是:0，表示 X Server 的第一个显示器。
  - `EDITOR`：默认的文本编辑器。
  - `HOME`：用户的主目录。
  - `HOST`：当前主机的名称。
  - `IFS`：词与词之间的分隔符，默认为空格。
  - `LANG`：字符集以及语言编码，比如zh_CN.UTF-8。
  - `PATH`：由冒号分开的目录列表，当输入可执行程序名后，会搜索这个目录列表。
  - `PS1`：Shell 提示符。
  - `PS2`： 输入多行命令时，次要的 Shell 提示符。
  - `PWD`：当前工作目录。
  - `RANDOM`：返回一个0到32767之间的随机数。
  - `SHELL`：Shell 的名字。
  - `SHELLOPTS`：启动当前 Shell 的set命令的参数，参见《set 命令》一章。
  - `TERM`：终端类型名，即终端仿真器所用的协议。
  - `UID`：当前用户的 ID 编号。
  - `USER`：当前用户的用户名。
- Bash 变量名区分大小写，HOME 和 home 是两个不同的变量。
- 查看单个环境变量的值
    ```bash
    $ printenv PATH
    # 或者
    $ echo $PATH
    ```
### 自定义变量

自定义变量是用户在当前 Shell 里面自己定义的变量，仅在当前 Shell 可用。一旦退出当前 Shell，该变量就不存在了。

set 命令可以显示所有变量（包括环境变量和自定义变量），以及所有的 Bash 函数。

### 参考

https://wangdoc.com/bash/variable.html

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


## 函数

### 简介
- 同名优先级：别名 > 函数 > 脚本
- 语法：
    ```bash
    # 第一种
    fn() {
    # codes
    }

    # 第二种
    function fn () { # () 加不加都可以
    # codes
    }
    ```
    示例：
    ```bash
    ➜  shell-learning git:(main) ✗ hello() {
    function> echo "Hello $1"
    function> }
    ➜  shell-learning git:(main) ✗ hello world
    Hello world
    ```
- `unset -f functionName` 删除已定义函数。
    示例：
    ```bash
    ➜  shell-learning git:(main) ✗ unset -f hello
    ➜  shell-learning git:(main) ✗ hello world
    zsh: command not found: hello
    ```

- `declare -f` 查看所有已定义的函数。
- `declare -f functionName` 单独查看指定函数。

### 参数变量
- 函数的参数变量，与脚本参数是一致的。
    [示例](13-函数/para.sh)：
    ```bash
    #!/usr/bin/env bash

    function alice () {
        echo "alice: $@"
        echo "$0: $1 $2 $3 $4"
        echo "$# 个参数"
    }

    alice in wonderland # 这就是个函数调用，函数名为 alice，参数分别为 in 和 wonderland
    ```
    执行：
    ```bash
    ➜  13-函数 git:(main) ✗ ./para.sh
    alice: in wonderland
    ./para.sh: in wonderland
    2 个参数
    ```
- 日志函数示例：
    ```bash
    ➜  13-函数 git:(main) ✗ function log {
    echo "[ `date '+ %F %T'` ]: $@"
    }
    ➜  13-函数 git:(main) ✗ log 123
    [  2022-01-16 16:50:54 ]: 123
    ```

### return 命令
- 基本同 C。
- 如果命令行直接执行函数，下一个命令可以用 `$?` 拿到返回值。

### 全局变量和局部变量
- [Bash 函数体内可以声明，读取，修改全局变量](13-函数/globalandlocal.sh)。
- [Bash 函数体内声明局部变量需显式使用 `local` 命令](13-函数/globalandlocal.sh)。
    ```bash
    #!/usr/bin/env bash

    foo() {
        bar=1
        echo "bar=$bar"
    }

    foo

    echo "bar=$bar"

    widget() {
        local w=5
        echo "w=$w"
    }

    widget

    echo "w=$w"
    ```
    执行：
    ```bash
    ➜  13-函数 git:(main) ✗ ./globalandlocal.sh
    bar=1
    bar=1
    w=5
    w=
    ```

### 参考
https://wangdoc.com/bash/function.html

## 数组

### 创建数组
- [示例](14-array/create.sh)：
    ```bash
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
    ```

### [读取数组](./14-array/read.sh)

#### 读取单个元素
    ```bash
    array[0]=a
    # 加大括号
    echo ${array[0]} # a
    # 不加大括号，默认读取 0 位置的元素
    echo $array[0] # a[0]
    ```

#### 读取所有成员
    ```bash
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
    ```

#### 拷贝数组
    ```bash
    barCopy=( "${bar[@]}" )
    echo "${barCopy[@]}" # hello world yue rui feng xi dian tyut
    ```

#### 追加元素
    ```bash
    barAppend=( "${bar[@]}" 321)
    echo "${barAppend[@]}" # hello world yue rui feng xi dian tyut 321
    ```

### 数组长度
    ```bash
    ${#array[*]}
    ${#array[@]}
    ```

### 提取数组序号
- 返回数组中存在元素的位置的下标
    ```bash
    ${!array[@]}
    ${!array[*]}
    ```

### 提取数组成员
    ```bash
    ${array[@]:position:length} # 返回从位置 position 开始的 length 个元素
    ${array[@]:position} # 返回重位置 position 开始的所有元素
    ```

### 追加数组成员
- 使用 `+=` 向数组末尾追加成员
    ```bash
    $ foo=(a b c)
    $ echo ${foo[@]}
    a b c

    $ foo+=(d e f)
    $ echo ${foo[@]}
    a b c d e f
    ```

### 删除数组
- 使用 `unset` 删除元素
    ```bash
    unset foo[1] # 删除指定元素
    unset foo # 删除整个数组
    ```

### 关联数组
- 关联数组可以看做下标为字符串的数组
- 使用关联数组前必须使用 `declare -A` 声明
    ```bash
    declare -A colors
    colors["red"]="#ff0000"
    colors["green"]="#00ff00"
    colors["blue"]="#0000ff"
    ```

### 参考
https://wangdoc.com/bash/array.html