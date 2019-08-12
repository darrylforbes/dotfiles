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

