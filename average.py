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
            print(f"無効な入力がありました: {s}", file=sys.stderr)
            sys.exit(1)

numbers = []

for line in sys.stdin:
    line = line.rstrip()
    try:
        numbers.append(tonum(line))
    except SystemExit:
        raise
    except Exception:
        print(f"無効な入力がありました: {line}", file=sys.stderr)
        sys.exit(1)

if numbers:
    average = sum(numbers) / len(numbers)
    print(f"平均値: {average:.6f}")
else:
    print("有効な数値が入力されませんでした", file=sys.stderr)
    sys.exit(1)
