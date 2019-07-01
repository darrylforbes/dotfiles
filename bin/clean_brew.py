#!/usr/bin/env python3

import subprocess

leaves = subprocess.check_output(['brew', 'leaves'])

for leaf in leaves.splitlines():
    print(leaf.decode('UTF-8'))

print()

deps = subprocess.check_output(['brew', 'deps', '--installed'])

for dep in deps.splitlines():
    print(dep.decode('UTF-8'))

# Compare dependencies of leaves with installed packages to find orphans
