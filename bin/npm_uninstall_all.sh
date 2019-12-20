# Credit to Stack Overflow user jedmao
# https://stackoverflow.com/questions/19106284/how-do-you-uninstall-all-dependencies-listed-in-package-json-npm

npm uninstall `ls -1 node_modules | tr '/\n' ' '`
