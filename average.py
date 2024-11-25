#!/usr/bin/python3
# SPDX-FileCopyrightTest: 2024 Taichi Ichijo
# SPDX-License-Identifier: BSD-3-Clause

import sys

def tonum(s):
    try:
        return int(s)
    except ValueError:
        try:
            return float(s)
        except ValueError:
            raise ValueError("無効な入力がありました: %s" % s)

numbers = []
errors = []

for line in sys.stdin:
    line = line.rstrip()
    if not line:  # 空行の場合
        errors.append("有効な数値が入力されませんでした")
        continue
    try:
        numbers.append(tonum(line))
    except ValueError as e:
        errors.append(str(e))

if numbers:
    average = sum(numbers) / len(numbers)
    print("平均値: %f" % average)
else:
    errors.append("有効な数値が入力されませんでした")

# エラーメッセージを表示
for error in errors:
    print(error)
