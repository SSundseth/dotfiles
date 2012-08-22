# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="cloud"

# Load Plugins
plugins=(git brew rvm yum)

source $ZSH/oh-my-zsh.sh

# Use Vim as default editor
<<<<<<< HEAD
export EDITOR="mvim"
=======
export EDITOR="gvim"
>>>>>>> prolog support in vimrc

# Completion
autoload -U compinit
compinit

# Automatically run cd when given a directory
setopt auto_cd

# Expand functions in the prompt
setopt prompt_subst

# Bindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# Path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/home/stefan/bin

# Aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# Github
if [ -e "$HOME/.github" ]; then
  source "$HOME/.github"
fi
