###_set_variables_###
###_set_options_###
###_aliases_###
###_Prompt_###
###_miscellaneous_code_###
###_bindkey_###
###_enable_terminal_transparent_###

################################################################################
###_set_variables_### (for oh-my-zsh)
export PATH="$PATH:$HOME/.local/script"
export ZSH=/usr/share/oh-my-zsh
HISTORY_BASE="$HOME/.dir_history" #for plugin per-directory-history
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
[[ ! -d $ZSH_CACHE_DIR ]]&& mkdir $ZSH_CACHE_DIR

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colorize copydir copyfile cp extract sudo 
dircycle dirhistory wd per-directory-history 
git git-extras gitfast git_remote_branch github tig 
git-flow git-flow-avh git-hubflow 
archlinux systemd docker pip python bundler gem npm)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
###############################################################################
###_set_options_### see man zsh zshoptions

# append history list to the history file; this is the default but we make sure
# because it's required for share_history.
setopt append_history

# import new commands from the history file also in other zsh-session
setopt share_history

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
setopt histignorealldups

# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace

# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# display PID when suspending processes as well
setopt longlistjobs

# report the status of backgrounds jobs immediately
setopt notify

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup

# make cd push the old directory onto the directory stack.
setopt auto_pushd

# avoid "beep"ing
setopt nobeep

# don't push the same dir twice.
setopt pushd_ignore_dups

# * shouldn't match dotfiles. ever.
setopt noglobdots

# use zsh style word splitting
setopt noshwordsplit

# don't error out when unset parameters are used
setopt unset

###############################################################################
###_aliases_###

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g R=' > /c/aaa/tee.txt '
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lAh'
alias dir="command ls -lSrah"                                  # a2 # Execute \kbd{ls -lSrah}
alias lad='command ls -d .*(/)'                                # a2 # Only show dot-directories
alias lsa='command ls -a .*(.)'                                # a2 # Only show dot-files
alias lss='command ls -l *(s,S,t)'                             # a2 # Only files with setgid/setuid/sticky flag
alias lsl='command ls -l *(@)'                                 # a2 # Only show symlinks
alias lsd='command ls -d *(/)'                                 # a2 # Only show directories
alias lse='command ls -d *(/^F)'                               # a2 # Only show empty directories
alias lsx='command ls -l *(*)'                                 # a2 # Display only executables
alias lsw='command ls -ld *(R,W,X.^ND/)'                       # a2 # Display world-{readable,writable,executable} files
alias lsbig="command ls -flh *(.OL[1,10])"                     # a2 # Display the 10 biggest files
alias lsnew="command ls -rtlh *(D.om[1,10])"                   # a2 # Display the 10 newest files
alias lsold="command ls -rtlh *(D.Om[1,10])"                   # a2 # Display the 10 oldest files
alias lssmall="command ls -Srl *(.oL[1,10])"                   # a2 # Display the 10 smallest files
alias lsnewdir="command ls -rthdl *(/om[1,10]) .*(D/om[1,10])" # a2 # Display the 10 newest directories and 10 newest .directories
alias lsolddir="command ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])" # a2 # Display the 10 oldest directories and 10 oldest .directories

alias rcd='cd ..; rmdir $OLDPWD || cd $OLDPWD' #a2# Remove current empty directory.

##_enable_color_support_of_ls_and_also_add_handy_aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi

alias vin='vim --noplugin'
alias vic="vim ~/.vim/vimrc"
alias vip='vim ~/.vim/vimrc.plugin.conf'
alias vix='vim ~/.Xresources'
alias viz='vim ~/.zshrc'
alias srz='source ~/.zshrc'
alias xrdbx='xrdb ~/.Xresources'
alias ect='emacsclient -t'
alias ecc='emacsclient -c'
alias ectc='emacsclient -tc'
alias ecs='emacsclient .spacemacs'

alias sdcv='sdcv -c'
alias sdc2='sdcv -c -u 英文字根字典 -u 朗道英汉字典5.0'
alias cman='man -L zh_CN'
alias prn='perl-rename'

alias hibernate='systemctl start systemd-hibernate.service'
alias qs='~/.local/bin/qshell_linux_amd64'

##_associate_types_and_extensions_(be_aware_with_perl_scripts_and_anwanted_behaviour!)
#check_com zsh-mime-setup || { autoload zsh-mime-setup && zsh-mime-setup }
#alias -s pl='perl -S'
alias -s png=feh
alias -s jpg=feh
alias -s bmp=feh
alias -s gif=feh

################################################################################
###_Prompt_###
#see
#man zshmisc
#           EXPANSION OF PROMPT SEQUENCES
#           SIMPLE PROMPT ESCAPES
#           CONDITIONAL SUBSTRINGS IN PROMPTS
#man zshcontrib
#           GATHERING INFORMATION FROM VERSION CONTROL SYSTEMS

autoload -U colors && colors
autoload -U promptinit && promptinit
if [[ $HOST == 'reuleaux' ]]&&[[ $USER == 'j0ham' ]];then
    PROMPT="%{$fg_no_bold[yellow]%}$%{$fg_no_bold[green]%}"
else
    PROMPT="%{$fg_bold[blue]%}%n@%M%{$fg_no_bold[yellow]%}$%{$fg_no_bold[green]%}"
fi
setopt prompt_subst
autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%F{12}%s%F{5})%F{3}-%F{5}[%F{35}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       \
    '%F{5}(%F{12}%s%F{5})%F{3}-%F{5}[%F{35}%b%F{5}]%F{2}%c%F{1}%u%f'
zstyle ':vcs_info:git:*' stagedstr 'M'
zstyle ':vcs_info:git:*' unstagedstr 'M'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{1}??%f'
fi
}
precmd () { vcs_info }
RPROMPT=' %F{243}%3~%f ${vcs_info_msg_0_}%f'
export PS4='+\e[33m${LINENO}\e[37m:\e[30;1m${FUNCNAME[0]}\e[37m:\e[0m  '

###############################################################################
###_miscellaneous_code_###

#_utility_functions
# this function checks if a command exists and returns either true
# or false. This avoids using 'which' and 'whence', which will
# avoid problems with aliases for which on certain weird systems. :-)
# Usage: check_com [-c|-g] word
#   -c  only checks for external commands
#   -g  does the usual tests and also checks for global aliases
function check_com () {
    emulate -L zsh
    local -i comonly gatoo
    comonly=0
    gatoo=0

    if [[ $1 == '-c' ]] ; then
        comonly=1
        shift 1
    elif [[ $1 == '-g' ]] ; then
        gatoo=1
        shift 1
    fi

    if (( ${#argv} != 1 )) ; then
        printf 'usage: check_com [-c|-g] <command>\n' >&2
        return 1
    fi

    if (( comonly > 0 )) ; then
        (( ${+commands[$1]}  )) && return 0
        return 1
    fi

    if     (( ${+commands[$1]}    )) \
        || (( ${+functions[$1]}   )) \
        || (( ${+aliases[$1]}     )) \
        || (( ${+reswords[(r)$1]} )) ; then
        return 0
    fi

    if (( gatoo > 0 )) && (( ${+galiases[$1]} )) ; then
        return 0
    fi

    return 1
}


#f5# cd to directoy and list files
function cl () { emulate -L zsh; cd $1 && ls -a }
#
#f5# Create temporary directory and \kbd{cd} to it
function cdt () { builtin cd "$(mktemp -d)"; builtin pwd }
#
#f5# Create Directoy and cd to it
function mcd () {
    if (( ARGC != 1 )); then
        printf 'usage: mcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf ''%s'\'' already exists: cd-ing.\n' "$1"
    fi
    builtin cd "$1"
}

#f5# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
function accessed () { emulate -L zsh; print -l -- *(a-${1:-1}) }
#
#f5# List files which have been changed within the last {\it n} days, {\it n} defaults to 1
function changed () { emulate -L zsh; print -l -- *(c-${1:-1}) }
#
#f5# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
function modified () { emulate -L zsh; print -l -- *(m-${1:-1}) }
# 
# modified() was named new() in earlier versions, add an alias for backwards compatibility
check_com new || alias new=modified

###############################################################################
###_bindkey_### see man zshzle
bindkey "^U" backward-kill-line
#setxkbmap -option ctrl:swapcaps
################################################################################
###_enable_terminal_transparent_###
if [ -n "$WINDOWID" ];then
	TRANSPARENCY_HEX=$(printf 0x%x $((0xffffffff * 10 / 100)))
	xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c \
                       -set _NET_WM_WINDOW_OPACITY "$TRANSPARENCY_HEX"
fi

[[ $TERM=="xterm-256color" || $TERM=="rxvt-unicode-256color" ]]\
&& transset-df .9 --id "$WINDOWID" >/dev/null

## END OF FILE #################################################################
