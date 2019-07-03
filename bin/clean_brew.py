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
packages.add("Test package")

unused = set()
for p in packages:
    if p not in deps | leaves:
        unused.add(p)

if unused:
    print("\nUnused dependencies:")
    for p in unused:
        print(p)

    delete = input("\nWould you like to uninstall these dependencies (y/n): ")
    delete = delete.lower()

    if delete == 'y':
        print("Packages have been deleted")

else:
    print("\nNo unused dependencies found")

