autoload -Uz compinit
compinit

bindkey -v
export KEYTIMEOUT=1

ZSH_CONFIG_DIR="$HOME/.config/dotfiles/zsh"


source "$ZSH_CONFIG_DIR/plugins.zsh"


for config_file in $ZSH_CONFIG_DIR/user/*.zsh; do
  source "$config_file"
done
