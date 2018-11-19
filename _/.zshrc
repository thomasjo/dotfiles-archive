##
# OH MY ZSH!
# ----------
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

plugins=(jump gitfast colored-man docker kubectl minikube)
source "$ZSH/oh-my-zsh.sh"
unsetopt correct_all


##
# Exports
# -------
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"
export EDITOR="atom"
export GIT_EDITOR="atom --wait"
export PYTHONDONTWRITEBYTECODE="ERMAHGERD"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export RBENV_ROOT="$HOME/.rbenv"
export PYENV_ROOT="$HOME/.pyenv"
export NODENV_ROOT="$HOME/.nodenv"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$NODENV_ROOT/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"

# CUDA
CUDA_ROOT="/usr/local/cuda"
if [ -d "$CUDA_ROOT" ]; then
  export PATH="$CUDA_ROOT/bin:$PATH"
fi

# Mono
export MONO_GAC_PREFIX="/usr/local"

# Atom
ATOM_REPOS_HOME="$HOME/Code/atom"
if [ -d "$ATOM_REPOS_HOME" ]; then export ATOM_REPOS_HOME; fi

ATOM_DEV_RESOURCE_PATH="$HOME/Code/atom/atom"
if [ -d "$ATOM_DEV_RESOURCE_PATH" ]; then export ATOM_DEV_RESOURCE_PATH; fi


##
# Aliases
# -------
alias ls="${aliases[ls]:-ls} --group-directories-first"

# OMG: Prevents potential disasters...
if which safe-rm > /dev/null; then alias rm="safe-rm"; fi

# Homebrew
# alias burp="brew update && brew upgrade --all && brew cleanup"

# https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
# alias brewdoc="env PATH=${PATH/$(pyenv root)\/shims:/} brew doctor"

# Mark (oh-my-zsh plugin)
alias J="jump"
alias M="mark"

# docker-compose
alias dc="docker-compose"

# Misc...
alias tree="tree -CA"


##
# Bootstrappers
# -------------

# Initialize rbenv if installed.
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Initialize pyenv if installed.
if which pyenv > /dev/null; then
  eval "$(pyenv init - --no-rehash)"

  # Initialize pyenv-virtualenv if installed.
  if pyenv commands | grep virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
  fi

fi

# Initialize nodenv if installed.
if which nodenv > /dev/null; then eval "$(nodenv init - --no-rehash)"; fi

# Initialize direnv if installed.
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Setup hub alias if hub is installed. (git -> hub)
if which hub > /dev/null; then eval "$(hub alias -s)"; fi
