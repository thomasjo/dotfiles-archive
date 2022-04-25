# Uncomment to profile shell with zprof
# zmodload zsh/zprof

##
# OH MY ZSH!
# ----------
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
# DISABLE_AUTO_TITLE="true"

plugins=(
  colored-man-pages
  git
  gitfast
  jump
)

source "$ZSH/oh-my-zsh.sh"

# setopt noglob  # Disable fancy and extremely annoying globbing


##
# Exports
# -------
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"

export EDITOR="code --wait"
export GIT_EDITOR="code --new-window --wait"

export PYTHONDONTWRITEBYTECODE="ERMAHGERD"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIPENV_VENV_IN_PROJECT=1

PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT" ]]; then
  export PYENV_ROOT
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

# TODO: Make this conditional; only add when missing.
if [[ ! "$PATH" == *"/usr/local/bin"* ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# User installed binaries.
export PATH="$HOME/.local/bin:$PATH"

# CUDA
CUDA_ROOT="/usr/local/cuda"
if [[ -d "$CUDA_ROOT" ]]; then
  export PATH="$CUDA_ROOT/bin:$PATH"
fi

# Mono
export MONO_GAC_PREFIX="/usr/local"

# Go
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$GOPATH/bin"

# Rootless Docker
# TODO: Find a better way to do this.
if [[ -f "$HOME/.config/systemd/user/default.target.wants/docker.service" ]]; then
  export DOCKER_HOST=unix:///run/user/1000/docker.sock
fi

# IPython
export IPYTHONDIR="$HOME/.config/ipython"


##
# Aliases
# -------
alias less="less -R"
alias ls="${aliases[ls]:-ls} --group-directories-first"
alias tree="tree -CA"

alias e="$EDITOR"
if [[ "$EDITOR" == "code"* ]]; then
  alias en="code --new-window"
  alias er="code --reuse-window"
  alias ew="code --wait"
  alias enw="code --new-window --wait"
  alias erw="code --reuse-window --wait"
fi

# Shorthands
alias k="kubectl"
alias d="docker"
alias dc="docker-compose"

# jump (oh-my-zsh plugin)
alias J="jump"
alias M="mark"

# safe-rm: prevent potential disasters...
if [[ -x "$(command -v safe-rm)" ]]; then alias rm="safe-rm"; fi


##
# Bootstrappers
# -------------

# Initialize direnv if installed.
if [[ -x "$(command -v direnv)" ]]; then eval "$(direnv hook zsh)"; fi

# Setup hub alias if hub is installed. (git -> hub)
if [[ -x "$(command -v hub)" ]]; then eval "$(hub alias -s)"; fi
