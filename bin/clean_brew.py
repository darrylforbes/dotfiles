#!/usr/bin/env python3

import subprocess

leaves = set()
for leaf in subprocess.check_output(['brew', 'leaves']).splitlines():
    leaves.add(leaf.decode('UTF-8'))

deps = set()
for line in subprocess.check_output(['brew', 'deps', '--installed']).splitlines():
    split_line = line.decode('UTF-8').split(' ')
    for i in range(1, len(split_line)):
        if split_line[i] != '':
            deps.add(split_line[i])

packages = set()
for line in subprocess.check_output(['brew', 'list']).splitlines():
    packages.add(line.decode('UTF-8'))
packages.add("Testing scrpt")

unused = set()
for p in packages:
    if p not in deps | leaves:
        unused.add(p)

if unused:
    print("Unused dependencies:")
    for p in unused:
        print(p)
else:
    print("No unused dependencies found")

