export PATH="$PATH:$HOME/bin:$HOME/go/bin"
export EDITOR=/usr/bin/nvim
export XDG_CONFIG_HOME="$HOME/.config"

export CLAUDE_CODE_EFFORT_LEVEL=high
# Default Claude config dir for ALL zsh (interactive + non-interactive),
# so env-less launches never fall back to ~/.claude. Respects an explicit override.
export CLAUDE_CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude-work}"
