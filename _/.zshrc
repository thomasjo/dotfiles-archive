##
# OH MY ZSH!
# ----------
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

plugins=(jump gitfast colored-man brew)
source "$ZSH/oh-my-zsh.sh"
unsetopt correct_all


##
# Exports
# -------
export LANG="en_US.UTF-8"
export EDITOR="atom"
export GIT_EDITOR="atom --wait"
export PYTHONDONTWRITEBYTECODE="ERMAHGERD"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

# CUDA
CUDA_ROOT="/Developer/NVIDIA/CUDA-7.0"
if [ -d $CUDA_ROOT ]; then
  export PATH="$CUDA_ROOT/bin:$PATH"
  # export DYLD_LIBRARY_PATH="$CUDA_ROOT/lib:$DYLD_LIBRARY_PATH"
fi

# Go
GOPATH="$HOME/Code/go"
if [ -d $GOPATH ]; then
  export GOPATH
  export PATH="$GOPATH/bin:$PATH"
fi

# Atom
ATOM_DEV_RESOURCE_PATH="$HOME/Code/atom/atom"
if [ -d $ATOM_DEV_RESOURCE_PATH ]; then export ATOM_DEV_RESOURCE_PATH; fi

ATOM_PATH="$HOME/Applications"
if [ -e $ATOM_PATH ]; then export ATOM_PATH; fi

##
# Aliases
# -------
alias burp="brew update && brew upgrade --all && brew cleanup"
alias J="jump"
alias M="mark"

# Resolves .config folder nonsense...
#  ~ https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
alias brewdoc="env PATH=${PATH/$(pyenv root)\/shims:/} brew doctor"

# Prevent potential disasters...
if which safe-rm > /dev/null; then alias rm="safe-rm"; fi


##
# Bootstrappers
# -------------
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which hub > /dev/null; then eval "$(hub alias -s)"; fi
if [ -d "$HOME/.nvm" ]; then source "$HOME/.nvm/nvm.sh"; fi

##
# Handy stuff
# -----------
if which pygmentize > /dev/null; then
  pretty() { pygmentize -f terminal "$1" | less -R }
fi
