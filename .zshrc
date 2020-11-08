# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

PRIMARY_FG=white
DEFAULT_USER=`whoami`
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='cyan'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='magneta'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew history-substring-search docker vi-mode mix-fast)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Library/Python/2.7/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
export LC_ALL=en_US.UTF-8
#test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
#source "$HOME/erlang/22.3.4.1/activate"
#source $HOME/.kiex/elixirs/elixir-1.5.3.env
# export MANPATH="/usr/local/man:$MANPATH"
#export HOMEBREW_GITHUB_API_TOKEN=67579cb4093ab7df79a9f250782e8a0bea16a790

# vi mode improvements

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

mimexec () { echo `git rev-parse --show-toplevel`/_build/$1/rel/mongooseim/bin/$2; }

mimc () { eval `mimexec prod mongooseimctl` $@; }
mim () { eval `mimexec prod mongooseim` $@; }
mimcdev1 () { eval `mimexec mim1 mongooseimctl` $@; }
mimdev1 () { eval `mimexec mim1 mongooseim` $@; }
mimcdev2 () { eval `mimexec mim2 mongooseimctl` $@; }
mimdev2 () { eval `mimexec mim2 mongooseim` $@; }
mimcdev3 () { eval `mimexec mim3 mongooseimctl` $@; }
mimdev3 () { eval `mimexec mim3 mongooseim` $@; }
mimcfed1 () { eval `mimexec fed1 mongooseimctl` $@; }
mimfed1 () { eval `mimexec fed1 mongooseim` $@; }

PERL_MB_OPT="--install_base \"/Users/michal.piotrowski/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/michal.piotrowski/perl5"; export PERL_MM_OPT;

function timeout() { perl -e 'alarm shift; exec @ARGV' "$@"; }

alias config='/usr/bin/git --git-dir=/Users/michalpiotrowski/.cfg/ --work-tree=/Users/michalpiotrowski'

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
