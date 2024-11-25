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
if ! echo "$out" | grep -q "平均値: 3.000000"; then
    ng "$LINENO"
fi

### 異常動作 ###
# 無効な入力がある場合（例: "あ"）
out=$(echo あ | ./average.py 2>&1)
if ! echo "$out" | grep -q "無効な入力がありました: あ"; then
    ng "$LINENO"
fi

# 空の入力の場合
out=$(echo | ./average.py 2>&1)
if ! echo "$out" | grep -q "有効な数値が入力されませんでした"; then
    ng "$LINENO"
fi

[ "$res" = 0 ] && echo OK
exit "$res"
