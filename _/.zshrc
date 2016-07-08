##
# OH MY ZSH!
# ----------
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

plugins=(jump gitfast colored-man brew docker)
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

export BYOBU_PREFIX=$(brew --prefix)

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules"

# CUDA
CUDA_ROOT="/usr/local/cuda"
if [ -d $CUDA_ROOT ]; then
  export PATH="$CUDA_ROOT/bin:$PATH"
  export DYLD_LIBRARY_PATH="$CUDA_ROOT/lib"
fi

# Go
GOPATH="$HOME/.go"
if [ -d $GOPATH ]; then
  export GOPATH
  export PATH="$GOPATH/bin:$PATH"
fi

GOROOT="/usr/local/opt/go/libexec"
if [ -d $GOROOT ]; then
  export GOROOT
  export PATH="$GOROOT/bin:$PATH"
fi

# Mono
export MONO_GAC_PREFIX="/usr/local"

# Atom
ATOM_REPOS_HOME="$HOME/Code/atom"
if [ -d $ATOM_REPOS_HOME ]; then export ATOM_REPOS_HOME; fi

ATOM_DEV_RESOURCE_PATH="$HOME/Code/atom/atom"
if [ -d $ATOM_DEV_RESOURCE_PATH ]; then export ATOM_DEV_RESOURCE_PATH; fi

# Android SDK
ANDROID_HOME="/usr/local/opt/android-sdk"
if [ -d $ANDROID_HOME ]; then export ANDROID_HOME; fi


##
# Aliases
# -------

# Homebrew
alias burp="brew update && brew upgrade --all && brew cleanup"

# https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
alias brewdoc="env PATH=${PATH/$(pyenv root)\/shims:/} brew doctor"

# Mark (oh-my-zsh plugin)
alias J="jump"
alias M="mark"

# Prevents potential disasters...
if which safe-rm > /dev/null; then alias rm="safe-rm"; fi

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

# Setup hub alias if hub is installed. (git -> hub)
if which hub > /dev/null; then eval "$(hub alias -s)"; fi

# Initialize nvm if installed
if [ -d "$HOME/.nvm" ]; then source "$HOME/.nvm/nvm.sh"; fi


##
# Handy stuff
# -----------
if which pygmentize > /dev/null; then
  pretty() { pygmentize -f terminal "$1" | less -R }
fi
