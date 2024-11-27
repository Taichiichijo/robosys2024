#!/bin/bash -xv
# SPDX-FileCopyrightTest: 2024 Taichi Ichijo
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### 正常動作 ###
out=$(seq 5 | ./average.py)
if ! echo "$out" | grep -q "平均値: 3.000000"; then
    ng "$LINENO"
fi

### 異常動作 ###
out=$(echo あ | ./average.py 2>&1)
if ! echo "$out" | grep -q "無効な入力がありました: あ"; then
    ng "$LINENO"
fi

### 空の入力の場合 ###
out=$(echo | ./average.py 2>&1)
if ! echo "$out" | grep -q "有効な数値が入力されませんでした"; then
    ng "$LINENO"
fi

[ "$res" -eq ] && echo OK
exit "$res"
