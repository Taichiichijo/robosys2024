#!/bin/bash -xv
# SPDX-FileCopyrightTest: 2024 Taichi Ichijo
# SPDX-License-Identifier: BSD-3-Clause
ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

### 正常動作 ###
out=$(seq 5 | ./average.py)
[ "${out}" = 15 ] || ng "$LINENO"

### 異常動作 ###
out=$(echo あ | ./average.py)
[ "$?" = 1 ]	  || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./average.py)
[ "$?" = 1 ]	  || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"
