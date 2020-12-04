##############################################################
# => ZSH Startup with Tmux
##############################################################
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux || tmux new
fi

##############################################################
# => ZSH Startup with P10K
##############################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##############################################################
# => ZSH Plugins
##############################################################
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
ZSH="$HOME/.oh-my-zsh"
UPDATE_ZSH_DAYS=13
ZSH_CUSTOM=$ZSH/custom
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
NVM_LAZY_LOAD=true
NVM_COMPLETION=true

# ZSH Plugins
plugins=(
    osx
    docker
    docker-compose
    terraform
    git
    golang
    brew
    kubectl
    zsh-nvm
    zsh-syntax-highlighting
    zsh-autosuggestions
    web-search
)

nvim () {
    unset -f nvim
    _zsh_nvm_load
    nvim "$@"
}

source $ZSH/oh-my-zsh.sh

##############################################################
# => Keys Binding
##############################################################
bindkey -v
bindkey -v '^?' backward-delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

##############################################################
# => Alias Bash Script
##############################################################
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias top="htop"
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias watch='watch '
alias vi="nvim"
alias vim="nvim"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias hjkl="/media/$USER/hjkl/"
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
elif [[ "$OSTYPE" == "DARWIN"* ]]; then
    alias hjkl="/Volumes/hjkl/"
fi
alias clang="clang-11"
alias python="python3"
alias pip="pip3"
alias pypy="pypy3"
alias pip_pypy="pip_pypy3"
alias k="kubectl"
alias tf="terraform"
alias os="openstack"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias icloud="~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias spotify="open -a spotify"
alias dota2="open -a Dota\ 2"
alias g3="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs="git status"
alias bt="blueutil"
alias bt-on="blueutil --power 1"
alias bt-off="blueutil --power 0"
alias bt-pair-sony="blueutil --connect 38-18-4c-c1-9b-01"
alias bt-unpair-sony="blueutil --disconnect 38-18-4c-c1-9b-01"

##############################################################
# => Export Global Environments Variable
##############################################################
if [[ -n $SSH_CONNECTION ]]; then export EDITOR='vim'
else export EDITOR='nvim'
fi
export TERM=screen-256color
export ARCHFLAGS="-arch x86_64"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# AWS path
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# SSH path
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

#PYTHON path
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.9/lib"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"

# GO path
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=on
export GOPRIVATE="gitlab.com/botnoi-sme,bitbucket.org/botnoi-sme,github.com/botnoi-sme"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
if [[ "$OSTYPE" == "linux-gnu"* ]]; then export GOROOT=/snap/go/current
elif [[ "$OSTYPE" == "darwin"* ]]; then export GOROOT=/usr/local/Cellar/go/1.15.5/libexec
fi

# Clang LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CC=clang-11
export CXX=clang++-11


# NVM path
# export NVM_DIR="$HOME/.nvm"
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then source "$HOME/.nvm/nvm.sh"
# elif [[ "$OSTYPE" == "darwin"* ]]; then source "$(brew --prefix nvm)/nvm.sh"
# fi

# Custom binary file (ubuntu)
export PATH=$PATH:$HOME/bin

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# GNU bin
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Terraform Config
export TF_LOG=1

# DOCKER CONFIG
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# KUBE config
export KUBECONFIG=$HOME/.kube/bn-sme-production-cluster:$HOME/.kube/bn-sme-staging-cluster:$HOME/.kube/config

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,vendor}/*" 2> /dev/null'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# P10K config
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
POWERLEVEL9K_DIR_MAX_LENGTH=1
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
ZLE_RPROMPT_INDENT=0
