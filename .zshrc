
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'


source /usr/share/zsh/share/antigen.zsh
# using oh-my-zsh
antigen use oh-my-zsh

#antigen bundle git
antigen bundle pip
antigen bundle colored-man-pages
antigen bundle react-native
antigen bundle web-search
antigen bundle virtualenvwrapper

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# theme
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv)

# Android Studio 
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools/bin

alias emulator='~/Android/Sdk/tools/emulator -avd Nexus_5X_API_23 -use-system-libs'


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andrei/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
