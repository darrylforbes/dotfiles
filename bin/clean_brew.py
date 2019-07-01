#!/usr/bin/env python

import subprocess

leaves = subprocess.check_output(['brew', 'leaves'])

for leaf in leaves.splitlines():
    print(leaf.decode('UTF-8'))

# Compare dependencies of leaves with installed packages to find orphans
