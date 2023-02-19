# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

PRIMARY_FG=white
DEFAULT_USER=`whoami`
#powerlevel10k
# brew install romkatv/powerlevel10k/powerlevel10k
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='cyan'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='magneta'
#ZSH_THEME="powerlevel9k/powerlevel9k"

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
plugins=(git brew history-substring-search docker vi-mode mix-fast direnv mix-fast)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/opt/node@14/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Library/Python/2.7/bin:$PATH"
export LC_ALL=en_US.UTF-8
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

is_in_git_repo() {
    # git rev-parse HEAD > /dev/null 2>&1
    git rev-parse HEAD > /dev/null
}
# Filter branches.
git-br-fzf() {
    is_in_git_repo || return

    local tags branches target
    tags=$(
	git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(
	git branch --all | grep -v HEAD |
	    sed "s/.* //" | sed "s#remotes/[^/]*/##" |
	    sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$(
	(echo "$tags"; echo "$branches") |
	    fzf --no-hscroll --no-multi --delimiter="\t" -n 2 \
		--ansi --preview="git log -200 --pretty=format:%s $(echo {+2..} |  sed 's/$/../' )" ) || return
    echo $(echo "$target" | awk -F "\t" '{print $2}')
}
# Filter branches and checkout the selected one with <enter> key,
git-co-fzf() {
    is_in_git_repo || return
    git checkout $(git-br-fzf)
}
# Filter commit logs. The diff is shown on the preview window.
git-log-fzf() { # fshow - git commit browser
    is_in_git_repo || return

    _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"
    git log --graph --color=always \
	--format="%C(auto)%h%d [%an] %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
	--preview="$_viewGitLogLine" \
	--bind "ctrl-m:execute:
		(grep -o '[a-f0-9]\{7\}' | head -1 |
		xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
		{}
FZF-EOF"
}

PERL_MB_OPT="--install_base \"/Users/michal.piotrowski/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/michal.piotrowski/perl5"; export PERL_MM_OPT;

function timeout() { perl -e 'alarm shift; exec @ARGV' "$@"; }

alias config='/usr/bin/git --git-dir=/Users/michalpiotrowski/.cfg/ --work-tree=/Users/michalpiotrowski'

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=~/go

#Erlang ENV vars
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS="yes"
