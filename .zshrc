PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f > '
RPROMPT='[%F{yellow}%?%f]'

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/blopes/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

export QT_QPA_PLATFORM=xcb
export EDITOR=vim

alias ls='eza --icons -Mah'
alias dwl='dwl -s somebar'
alias cat='cat -n'

# Uncomment if using Wine flatpak
alias wine='flatpak run org.winehq.Wine'
alias winecfg='flatpak run org.winehq.Wine ~/.var/app/org.winehq.Wine/data/wine/drive_c/windows/system32/winecfg.exe'
alias winetricks='flatpak run --command="winetricks" org.winehq.Wine'

source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
