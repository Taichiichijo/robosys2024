#!/bin/bash -xv
# SPDX-FileCopyrightTest: 2024 Taichi Ichijo
# SPDX-License-Identifier: BSD-3-Clause

ng () {
       echo "${1}行目が違うよ"
       res=1
}

res=0

### 正常動作 ###
# 入力が 1, 2, 3, 4, 5 の場合、平均値は 3.0
out=$(seq 5 | ./average.py)
[ "$(echo "$out" | grep -o '平均値: [0-9.]*')" = "平均値: 3.000000" ] || ng "$LINENO"

### 異常動作 ###
# 入力が無効 (文字列 "あ") の場合、エラーメッセージが出る
out=$(echo あ | ./average.py 2>&1)
[ "$?" -ne 0 ] && echo "$out" | grep -q "無効な入力がありました" || ng "$LINENO"

# 空の入力の場合、エラーメッセージが出る
out=$(echo | ./average.py 2>&1)
[ "$?" -ne 0 ] && echo "$out" | grep -q "有効な数値が入力されませんでした" || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"
