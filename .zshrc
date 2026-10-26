# install oh my posh if it doesn't exist
BIN_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"
export PATH="${BIN_DIR}:$PATH"
if [[ ! -e "${BIN_DIR}/oh-my-posh" ]]; then
  mkdir -p "${BIN_DIR}"
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ${BIN_DIR} >/dev/null
fi

# download plugin manager if it doesn't exist
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# init plugin manager
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light Aloxaf/fzf-tab
zinit light kazhala/dotbare
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zpm-zsh/colors
zinit light zpm-zsh/colorize
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-beginning-search-backward-end history-beginning-search-forward-end)

# snippets
zinit snippet OMZP::gpg-agent
zinit snippet OMZP::sudo

# load completions
autoload -Uz compinit && compinit

# load oh my posh
eval "$(oh-my-posh -c $XDG_CONFIG_HOME/ohmyposh/config.toml init zsh)"

# keybindings
bindkey -e

# history setup
HISTFILE=$HOME/.config/zsh/.zhistory
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# completion style
zstyle ':completion:*:git-checkout:*' sort false
# zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# aliases
alias zsh-reload="source ~/.zshrc"
alias zsh-edit="nvim ~/.zshrc"
alias diff="colordiff"
alias cat="bat"
alias ls="eza --icons=always --group-directories-first"
alias ll="ls -l"
alias la="ls -la"
alias oldvim="\vim"
alias oldvimdiff="\vimdiff"
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias open="xdg-open"
# `claude` uses CLAUDE_CONFIG_DIR from ~/.zshenv (defaults to ~/.claude-work).
# No plain `claude` alias: it would shadow an env-prefix override (CLAUDE_CONFIG_DIR=... claude).
alias claude-work="CLAUDE_CONFIG_DIR=~/.claude-work claude"
alias claude-private="CLAUDE_CONFIG_DIR=~/.claude-private claude"

# shell integrations
#eval $(tmuxifier init -)
eval $(thefuck --alias)
eval $(thefuck --alias fk)
eval $(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gurimusan/.local/src/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gurimusan/.local/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gurimusan/.local/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gurimusan/.local/src/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/fzf.plugin.zsh
source ~/.config/zsh/plugins/yazi.plugin.zsh

# Created by `userpath` on 2025-04-09 11:25:53
export PATH="$PATH:/home/gurimusan/.local/share/hatch/pythons/3.12/python/bin"

# pnpm
export PNPM_HOME='/home/gurimusan/.local/share/pnpm'
case ":$PATH:" in
  ":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# direnv
eval "$(direnv hook zsh)"
