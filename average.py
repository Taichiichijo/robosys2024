#!/usr/bin/python3
# SPDX-FileCopyrightTest: 2024 Taichi Ichijo
# SPDX-License-Identifier: BSD-3-Clause

import sys

def tonum(s):
    try:
        return int(s)
    except:
        return float(s)

numbers = []

for line in sys.stdin:
    line = line.rstrip()
    try:
        numbers.append(tonum(line))
    except:
        print("無効な入力がありました: %s" % line)

if numbers:
    average = sum(numbers) / len(numbers)
    print("平均値: %f" % average)
else:
    print("有効な数値が入力されませんでした")
