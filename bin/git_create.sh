#!/bin/bash

user=$(git config user.username)
read -p 'Repository name: ' repo
read -sp 'Github password: ' pass

curl -u $user:$pass https://api.github.com/user/repos -d "{\"name\":\"$repo\"}"

