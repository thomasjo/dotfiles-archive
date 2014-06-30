##
# OH MY ZSH!
# ----------
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="thomasjo"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"

skip_global_compinit=1
plugins=(gitfast colored-man brew rbenv pyenv tmux)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all


##
# Aliases
# -------
alias burp="brew update && brew upgrade && brew cleanup"


##
# Exports
# -------
export LANG="en_US.UTF-8"
export EDITOR="atom"
export GIT_EDITOR="atom --wait"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/Users/thomasjo/.bin:$PATH"
export PATH="/Users/thomasjo/.cabal/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"

# CA certs required by cURL and GIT (http://curl.haxx.se/docs/sslcerts.html)
export CURL_CA_BUNDLE="/Users/thomasjo/.ssh/cacert.pem"
export GIT_SSL_CAINFO="/Users/thomasjo/.ssh/ca-bundle.crt"


##
# Bootstrappers
# -------------
# Not needed as long as we use the corresponding oh-my-zsh plugins
#
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which hub > /dev/null; then eval "$(hub alias -s)"; fi

##
# Handy stuff
# -----------
if which pygmentize > /dev/null; then
  pretty() { pygmentize -f terminal "$1" | less -R }
fi
