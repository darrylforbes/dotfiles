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
- docker (look at docker docs for instructions)
- docker compose (look at docker docs for instructions)

Python Stuff
- pyenv (installation instructions - github.com/pyenv/pyenv#installation)
    - pyenv global 3.8.0
- pip3 (sudo apt install python3-pip)
    - pipenv (python -m pip install --user pipenv)
        - install python dev venv with pipfile in bin (python -m pipenv install)
        - contains jedi, pylint, and black
        - whenever editing .py files, set interpreter to venv python
