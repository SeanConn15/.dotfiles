# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %S%p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/sean/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history share_history autocd notify
unsetopt beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -Uz promptinit
promptinit
export LANG="en_US.UTF-8"
export PATH=/home/sean/.local/bin:$PATH

#powerlevel 9k theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='15'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='08'

POWERLEVEL9K_DIR_HOME_FOREGROUND='00'
POWERLEVEL9K_DIR_HOME_BACKGROUND='02'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='00'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='02'


POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='02'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='00'


POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='07'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='08'
#end powerlevel theme

#theme for man pages
man() {
    LESS_TERMCAP_md=$'\e[10;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[10;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[10;32m' \
    command man "$@"
}

# make keys work
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# enable history searching based on already typed text
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

alias yogurt='yaourt'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rmswap='rm -rf ~/rf ~/.cache/vim/swap'
alias sudo='sudo '
alias pamcan='echo "oh yes hello this is 100% a real command and you are not some sort of dumbass"'
alias psyu='sudo pacman -Syu'
alias vpn='cd ~/Documents && sudo openvpn --mute-replay-warnings --config ipvanish-US-Chicago-chi-a23.ovpn --auth-user-pass .stuff'
alias neo='neofetch'
alias sshsean='ssh -p 2000 sean@208.38.224.144'
alias sshpu='ssh connell7@data.cs.purdue.edu'
alias gib='sudo pacman -S'

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
