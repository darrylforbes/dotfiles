# dotfiles

## Setup Instructions

Delete any files that you don't want to install

Run bin/install_dotfiles.sh

Open vim

Run :PlugInstall

Exit vim

Run bin/link_tmuxline_snapshot.sh


## Packages to install

- vim
- git (to clone dotfiles)
- nodejs (for coc)
- npm (nodejs didn't come with npm)
- tmux
- docker
- docker compose

Python Stuff
- pip3 (sudo apt install python3-pip)
    - pipenv (python3 -m pip install --user pipenv)
    Within project pipenv
    - jedi
    - pylint
    - black
- pyenv (installation instructions - github.com/pyenv/pyenv#installation)
