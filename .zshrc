zmodload zsh/zprof
###Table_Of_Content### press * jump to subheading
###_set_variables_###
###_set_options_###
###_aliases_###
###_Prompt_###
###_miscellaneous_code_###
###_bindkey_###
###_enable_terminal_transparent_###
###_Lazy_mise_activation_###
###_Zinit'_###

################################################################################
###_set_variables_### (for oh-my-zsh)

export PATH="$PATH:$HOME/.local/share:$HOME/.local/bin:$HOME/.local/share/mise/installs/python/3.12/bin:$HOME/.cargo/bin:/opt/natapp"

# pnpm
export PNPM_HOME="/home/philosoph/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# 自动启动 ssh-agent 并加载私钥
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/id_ed25519 2> /dev/null || true
fi
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
#export HTTPS_PROXY=$https_proxy
#export HTTP_PROXY=$http_proxy
export no_proxy="r.cnpmjs.org,registry.npmmirror.com,localhost,127.0.0.1"
export NO_PROXY=$no_proxy
export UV_LINK_MODE=copy
# export ZSH="${ZDOTDIR}/oh-my-zsh"
# export ZSH=/usr/share/oh-my-zsh
HISTORY_BASE="${ZDOTDIR:-$HOME}/dir_history" #for plugin per-directory-history
ZSH_CACHE_DIR=${ZDOTDIR:-$HOME}/cache
ZSH_COMPDUMP=${ZDOTDIR:-$HOME}/.zcompdump
zmodload zsh/files
[[ ! -d $ZSH_CACHE_DIR ]] && zf_mkdir $ZSH_CACHE_DIR

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
#plugins=(colorize copydir copyfile cp extract sudo 
# git git-extras gitfast git_remote_branch github tig 
#plugins=(colorize copyfile cp extract sudo 
#dircycle dirhistory wd per-directory-history 
#git git-extras gitfast github tig 
#git-flow git-flow-avh git-hubflow 
#
#archlinux systemd docker pip python bundler gem npm)

source $HOME/.antidote/antidote.zsh
antidote load
ZSH_DISABLE_COMPFIX=true
#source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f ~/.config/broot/launcher/bash/br ]] && source ~/.config/broot/launcher/bash/br

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

# cd + ls combos: cd to DIR then list with each ls variant
function cdl()        { builtin cd "${1:-.}" && l }
function cdla()       { builtin cd "${1:-.}" && la }
function cdll()       { builtin cd "${1:-.}" && ll }
function cdlla()      { builtin cd "${1:-.}" && lla }
function cddir()      { builtin cd "${1:-.}" && dir }
function cdlad()      { builtin cd "${1:-.}" && lad }
function cdlsa()      { builtin cd "${1:-.}" && lsa }
function cdlss()      { builtin cd "${1:-.}" && lss }
function cdlsl()      { builtin cd "${1:-.}" && lsl }
function cdlsd()      { builtin cd "${1:-.}" && lsd }
function cdlse()      { builtin cd "${1:-.}" && lse }
function cdlsx()      { builtin cd "${1:-.}" && lsx }
function cdlsw()      { builtin cd "${1:-.}" && lsw }
function cdlsbig()    { builtin cd "${1:-.}" && lsbig }
function cdlsnew()    { builtin cd "${1:-.}" && lsnew }
function cdlsold()    { builtin cd "${1:-.}" && lsold }
function cdlssmall()  { builtin cd "${1:-.}" && lssmall }
function cdlsnewdir() { builtin cd "${1:-.}" && lsnewdir }
function cdlsolddir() { builtin cd "${1:-.}" && lsolddir }

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
alias vicc="vim ~/.claude/settings.json"
alias vip='vim ~/.vim/vimrc.plugin.conf'
alias vix='vim ~/.Xresources'
alias viz='vim ${ZDOTDIR:-$HOME}/.zshrc'
alias vizp='vim ${ZDOTDIR:-$HOME}/.zsh_plugins.txt'
alias srz='source ${ZDOTDIR:-$HOME}/.zshrc'
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

alias pncfgs='nocorrect pnpm config set'
alias pncfgg='nocorrect pnpm config get'
alias rtk='nocorrect rtk'

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

# autoload -U colors && colors
# autoload -U promptinit && promptinit
# eval "$(starship init zsh)"
(){
    local cache="${ZSH_CACHE_DIR}/starship-init.zsh"
    local bin="${commands[starship]:-starship}"
    [[ ! -f "$cache" || "$bin" -nt "$cache" ]] && "$bin" init zsh >| "$cache"
    source "$cache"
}

setopt PROMPT_SUBST
# export PRMT_TIMEOUT=50
# zsh/datetime 提供 strftime 内建，替换外部 date 命令
# zmodload zsh/datetime

# function _prmt_prompt() {
#     local code=${_prmt_exit_code:-0}
#     local username hostname user_host time_str pad status_mark
#     username="${USER}"
#     hostname="${HOST%%.*}"
#     user_host="${username}@${hostname}"
#     # time_str="$(date +%H:%M)"
#     # time_hs=$(prmt --code $code "!{time:yellow:24hs}#")
#     strftime -s time_str '%H:%M:%S' $EPOCHSECONDS
#     path_a_zsh=$PWD              # /home/user/projects  (zsh native)
#     path_r_zsh="${(%):-%~}"
#     path_s_zsh="${(%):-%1~}"     # projects  (zsh native)
#     local path_r path_a path_s path_r_zshpath_a_zsh path_s_zsh path_i path_u
#     # path_r=$(prmt '{path::r}')   # ~/projects
#     # path_a=$(prmt '{path::a}')   # /home/user/projects
#     # path_s=$(prmt '{path::s}')   # projects
#     path_i=$(prmt '{path::i}')   # ~/p/projects
#     # path_u=$(prmt '{path::u}')   # ~/prjcts
#     git_info=$(prmt '{git::::}')
#     pad=$(( COLUMNS - ${#user_host} - 1 - ${#time_str} - 1 - ${#path_i} - 1 - ${#git_info} ))
#     (( pad < 1 )) && pad=1
#     # $(prmt --shell zsh --code $code '{ok:green}{fail:red} ')
#     if (( code == 0 )); then
#         status_mark='%F{green}✓%f '
#     else
#         status_mark='%F{red}✗%f '
#     fi
#     printf '%%F{green}%s%%f@%%F{blue}%s%%f%%F{magenta}!%%f%%F{yellow}%s%%f#%*s%%F{cyan}%s%%f:%s\n%s' \
#         "$username" "$hostname" "$time_str" "$pad" "" "$path_i" "$git_info" "$status_mark"
# }
#
# function _prmt_precmd() { _prmt_exit_code=$?; }
#
# PROMPT='$(_prmt_prompt)'
#
# typeset -ga precmd_functions
# (( ${precmd_functions[(I)_prmt_precmd]} )) || precmd_functions+=(_prmt_precmd)
#
# TRAPWINCH() { zle && zle reset-prompt; }

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
function cl () { emulate -L zsh; builtin cd $1 && print -l -- *(D) }
#
#f5# Create temporary directory and \kbd{cd} to it
# function cdt () { builtin cd "$(mktemp -d)"; builtin pwd }
function cdt () {
    local tmp="${TMPDIR:-/tmp}/zsh-cdt-$$-$RANDOM"
    zf_mkdir "$tmp" && builtin cd "$tmp" && builtin pwd
}
#
#f5# Create Directoy and cd to it
function mcd () {
    if (( ARGC != 1 )); then
        printf 'usage: mcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        zf_mkdir -p "$1"
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
#if [ -n "$WINDOWID" ];then
#	TRANSPARENCY_HEX=$(printf 0x%x $((0xffffffff * 80 / 100)))
#	xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c \
#                       -set _NET_WM_WINDOW_OPACITY "$TRANSPARENCY_HEX"
#fi

#[[ $TERM=="xterm-256color" || $TERM=="rxvt-unicode-256color" ]]\
#&& transset-df .9 --id "$WINDOWID" >/dev/null

################################################################################
###_Lazy_mise_activation_###
# only activate when entering a mise-managed directory.
# Saves ~200ms on every shell startup when not in a mise project.
_mise_lazy_activate() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -f "$dir/.mise.toml"              || -f "$dir/mise.toml"            ||
              -f "$dir/.mise/config.toml"       || -f "$dir/.mise.local.toml"     ||
              -f "$dir/mise.local.toml"         || -f "$dir/.tool-versions"       ||
              -f "$dir/.config/mise/config.toml" ]]; then
            add-zsh-hook -d precmd _mise_lazy_activate
            local cache="$HOME/.cache/mise-activate.zsh"
            local mise_bin="${commands[mise]:-/usr/bin/mise}"
            [[ ! -x "$mise_bin" ]] && return
            if [[ ! -f "$cache" || "$mise_bin" -nt "$cache" ]]; then
                zf_mkdir -p "${cache:h}"
                "$mise_bin" activate zsh > "$cache"
            fi
            source "$cache"
            _mise_hook   # apply versions for current directory immediately
            return
        fi
        dir="${dir:h}"
    done
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _mise_lazy_activate

################################################################################
###_Zinit'_###
	
# if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#     print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#         print -P "%F{33} %F{34}Installation successful.%f%b" || \
#         print -P "%F{160} The clone has failed.%f%b"
# fi
#
# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
#
# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust
#
# ### End of Zinit's installer chunk
#
## END OF FILE #################################################################
zprof | head -20
