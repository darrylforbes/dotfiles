# Adds $HOME/bin to path if not already there
for x in $HOME/bin; do
    case ":$PATH:" in
        *":$x:"*) :;;
        *) export PATH="$PATH:$x";;
    esac
done

# Adds /Users/darryl/Library/Python/3.7/bin to path if not already there
for x in /Users/darryl/Library/Python/3.7/bin; do
    case ":$PATH:" in
        *":$x:"*) :;;
        *) export PATH="$PATH:$x";;
    esac
done

# Adds $HOME/.local/bin to path if not already there
for x in $HOME/.local/bin; do
    case ":$PATH:" in
        *":$x:"*) :;;
        *) export PATH="$PATH:$x";;
    esac
done

# Tells pipenv where to store virtual environments
export WORKON_HOME=$HOME/.virtualenvs

# Forces tmux to assume terminal supports 256 colors
export TERM=screen-256color

# Pyenv settings
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
