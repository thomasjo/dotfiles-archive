##
# OH MY ZSH!
# ----------
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="thomasjo"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

# skip_global_compinit=1
plugins=(jump gitfast colored-man brew)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all


##
# Exports
# -------
export LANG="en_US.UTF-8"
export EDITOR="atom"
export GIT_EDITOR="atom --wait"
export PYTHONDONTWRITEBYTECODE="ERMAHGERD"

export PATH="/usr/local/bin:$PATH"
export PATH="/Users/thomasjo/.bin:$PATH"
export PATH="/Users/thomasjo/.rbenv/bin:$PATH"
export PATH="/Users/thomasjo/.pyenv/bin:$PATH"
export PATH="$PATH:/Developer/NVIDIA/CUDA-7.0/bin"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:/Users/thomasjo/.cabal/bin"

# export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-7.0/lib:$DYLD_LIBRARY_PATH"

export NODE_PATH="/usr/local/lib/node_modules"
export ANDROID_HOME="/usr/local/opt/android-sdk"
export ATOM_DEV_RESOURCE_PATH="/Users/thomasjo/Code/atom/atom"

# Go paths...
export GOPATH="$HOME/Code/go"
export PATH="$PATH:$GOPATH/bin"


##
# Aliases
# -------
alias burp="brew update && brew upgrade --all && brew cleanup"
alias git="hub"
alias atom="atom --one"

# Resolves .config folder nonsense...
#  ~ https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
alias brewdoc="env PATH=${PATH/$(pyenv root)\/shims:/} brew doctor"

alias J="jump"
alias M="mark"

if which safe-rm > /dev/null; then alias rm="safe-rm"; fi

##
# Bootstrappers
# -------------
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which hub > /dev/null; then eval "$(hub alias -s)"; fi

[[ -d "$HOME/.nvm" ]] && source "$HOME/.nvm/nvm.sh"

##
# Handy stuff
# -----------
if which pygmentize > /dev/null; then
  pretty() { pygmentize -f terminal "$1" | less -R }
fi
