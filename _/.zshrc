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
export GIT_EDITOR="code --wait"

export PYTHONDONTWRITEBYTECODE="ERMAHGERD"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIPENV_VENV_IN_PROJECT=1

export RBENV_ROOT="$HOME/.rbenv"
export PYENV_ROOT="$HOME/.pyenv"
export NODENV_ROOT="$HOME/.nodenv"

# TODO: Make this conditional; only add when missing.
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$NODENV_ROOT/bin:$PATH"
# export PATH="$HOMEBREW_ROOT/bin:$PATH"

# Poetry
POETRY_ROOT="$HOME/.poetry"
if [ -d "$POETRY_ROOT" ]; then
  export PATH="$POETRY_ROOT/bin:$PATH"
fi

# CUDA
CUDA_ROOT="/usr/local/cuda"
if [ -d "$CUDA_ROOT" ]; then
  export PATH="$CUDA_ROOT/bin:$PATH"
fi

# Mono
export MONO_GAC_PREFIX="/usr/local"

# Go
export GOPATH="$HOME/.local/share/go"
export GO111MODULE="on"

GOLANG_ROOT="/usr/local/go"
if [ -d "$GOLANG_ROOT" ]; then
  export PATH="$GOLANG_ROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi

# Atom
ATOM_REPOS_HOME="$HOME/Code/atom"
if [ -d "$ATOM_REPOS_HOME" ]; then export ATOM_REPOS_HOME; fi

ATOM_DEV_RESOURCE_PATH="$HOME/Code/atom/atom"
if [ -d "$ATOM_DEV_RESOURCE_PATH" ]; then export ATOM_DEV_RESOURCE_PATH; fi


##
# Aliases
# -------
alias ls="${aliases[ls]:-ls} --group-directories-first"
alias tree="tree -CA"

# OMG: Prevents potential disasters...
if [ -x "$(command -v safe-rm)" ]; then alias rm="safe-rm"; fi

# jump (oh-my-zsh plugin)
alias J="jump"
alias M="mark"

# kubectl
alias k="kubectl"

# docker-compose
alias dc="docker-compose"


##
# Bootstrappers
# -------------

# Initialize rbenv if installed.
if [ -x "$(command -v rbenv)" ]; then eval "$(rbenv init - --no-rehash)"; fi

# Initialize pyenv if installed.
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init - --no-rehash)"

  # Initialize pyenv-virtualenv if installed.
  if pyenv commands | grep virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# Initialize nodenv if installed.
if [ -x "$(command -v nodenv)" ]; then eval "$(nodenv init - --no-rehash)"; fi

# Initialize direnv if installed.
if [ -x "$(command -v direnv)" ]; then eval "$(direnv hook zsh)"; fi

# Setup hub alias if hub is installed. (git -> hub)
if [ -x "$(command -v hub)" ]; then eval "$(hub alias -s)"; fi
