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

# Sets pipenv to store virtual environments inside project directory
export PIPENV_VENV_IN_PROJECT=1

# Forces tmux to assume terminal supports 256 colors
export TERM=screen-256color

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
