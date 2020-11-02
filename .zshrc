# REMOVE USERNAME
prompt_context () {
}

# REMOVE current working directory
prompt_dir() {
  prompt_segment blue black '%c'
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Binding Key
# set -o vi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gozilla"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
YPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    osx
    docker
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
alias watch='watch '

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    alias vim='vim'
    alias vi='vim'
    alias hjkl="/media/$USER/hjkl/"
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

elif [[ "$OSTYPE" == "DARWIN"* ]]; then

    alias vim='mvim -v'
    alias vi='mvim -v'
    alias hjkl="/Volumes/hjkl/"

fi

alias python="python3"
alias pip="pip3"
alias pypy="pypy3"
alias pip_pypy="pip_pypy3"
alias k="kubectl"

# Application
alias tf="terraform"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias icloud="~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias spotify="open -a spotify"
alias dota2="open -a Dota\ 2"
alias gg="googler"

# GIT ALIAS
alias g3="git log --graph --oneline --all"
alias gs="git status"

# AWS PATH
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# SSH PATH
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

#PYTHON PATH
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.9/lib"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"


# GOPATH
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export GOROOT=/snap/go/current
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export GOROOT=/usr/local/Cellar/go/1.15.3/libexec
fi
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=on
# export GCCGO="gccgo"
# export CC="gcc"
# export CXX="g++"
# export CGO_ENABLED="1"


# Clang LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"


# NVMPATH
export NVM_DIR="$HOME/.nvm"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    source "$HOME/.nvm/nvm.sh"

elif [[ "$OSTYPE" == "darwin"* ]]; then

    source "$(brew --prefix nvm)/nvm.sh"

fi

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# KUBECONFIG
export KUBECONFIG=$HOME/.kube/bn-sme-production-cluster:$HOME/.kube/bn-sme-staging-cluster:$HOME/.kube/config

# FZF
export FZF_DEFAULT_COMMAND="rg --column --hidden --line-number --no-heading --color=always --smart-case"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"

# Bind Key
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux || tmux new
fi
