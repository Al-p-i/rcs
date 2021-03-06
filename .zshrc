# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="superjarin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

#source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/apomosov/Рабочий стол/scripts:/home/apomosov/soft/gradle-1.12/bin:/home/apomosov/Рабочий стол/scripts:/home/apomosov/soft/gradle-1.12/bin:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
alias vmi='vim'
alias duh='du -h * --max-depth=0'
alias s='percol'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias hglog='hg log --template "\033[0;33m{rev}\t{svnrev|nonempty}\t\033[1;30m{phase}\t<{author|person}>\t\033[1;30m({date|age})\t\033[0m{desc|firstline|strip}\033[0m\n"'

alias tmux='tmux -2 attach || tmux -2 new'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# functions
# Поиск файла по шаблону:
if [ -f ~/.functions ]; then
  . ~/.functions
fi

function ff() { find . -type f -iname '*'$*'*' -ls; }
function fff() { find . -type f -iname '*'$*'*' -ls | fpp; }
# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
function agf() { ag $* | fpp; }
# cat and shadow password
function scat() { cat $* | sed 's/password.*/password=\*\*\*\*\*\*/' ; }
function psg() {ps aux | grep $1 ; }
function share() { cp -R "$*" ~/share ; }
function ww() { echo $* >> ~/share/wall.txt ; }
function cww() { echo $* > ~/share/wall.txt ; }
function rw() { curl localhost:7777/wall.txt ; }
if [[ $COLORTERM == "gnome-terminal" ]]; then
  export TERM="xterm-256color"
fi

JDK_HOME=/ssd/trunk_hg/vendors/Java/jdk-1.8-linux-64/
IDEA_JDK_64=/ssd/trunk_hg/vendors/Java/jdk-1.8-linux-64/
export HISTSIZE=1000000
HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

autoload -U colors && colors
PS1="%{$fg[yellow]%}[$(date +%H:%M:%S)] %{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec start && xrandr --output DVI-I-3 --auto --pos 0x0 --output DVI-I-2 --auto --right-of DVI-I-3x
