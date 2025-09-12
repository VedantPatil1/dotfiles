autoload -Uz compinit
compinit

export PATH=$PATH:/opt/homebrew/bin

# Aliases
alias python="python3.13"
alias vi="nvim"
alias tree="eza -T -a --git-ignore --group-directories-first"
alias ls="eza -l -a --color=always --group-directories-first --git --no-permissions --no-user --no-filesize --time-style='relative'"
alias la="eza -l -a --git --colour=always --git-repos --no-filesize -M"
alias viz="vi ~/.zshrc"
alias dac="deactivate"
alias vac="python -m venv .venv && source .venv/bin/activate"
alias cat="bat"
#alias vac="source /Users/vedantpatil/Projects/.pm/shell-automations/scripts/activate_venv.sh"
#alias kubectl="minikube kubectl --"

# Poetry
export PATH="/Users/vedapati/.local/bin:$PATH"

# Starship
eval "$(starship init zsh)"


# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .venv --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

 
# BAT configurations
export BAT_THEME=tokyonight_night

# The Fuck
eval $(thefuck --alias)
eval $(thefuck --alias wtf)

eval "$(uv generate-shell-completion zsh)"

#export PATH=$PATH:$(go env GOPATH)/bin

# terraform autocomplete
#terraform -install-autocomplete

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
