# configs/zshrc.sh
#!/bin/bash
source ./utils/logger.sh

configure_zsh_core() {
    if ! grep -q "HISTFILE=~/.zsh_history" "$HOME/.zshrc"; then
        log "Adding core zsh configurations..." "info"
        cat >> "$HOME/.zshrc" << 'EOF'

# Core Zsh settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# Source history substring search for key bindings
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
EOF
        log "Core zsh configurations added successfully" "success"
    else
        log "Core zsh configurations already exist" "warning"
    fi
}