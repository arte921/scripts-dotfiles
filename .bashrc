PS1="\W \$ "
source /usr/share/bash-completion/completions/git
export PATH=$PATH:~/.keep/scripts/
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
alias date="date +'%Y-%m-%d %H:%M:%S'"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
. "$HOME/.cargo/env"
neofetch
date
cat /sys/class/power_supply/BAT0/capacity

