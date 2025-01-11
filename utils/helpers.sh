#!/bin/bash
source ./utils/logger.sh

backup_zshrc() {
    if [[ -f "$HOME/.zshrc" ]]; then
        cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        log "Created backup of .zshrc" "success"
    fi
}

check_dependencies() {
    local missing=0
    for cmd in git curl zsh; do
        if ! command -v $cmd &> /dev/null; then
            log "$cmd is not installed" "error"
            missing=1
        fi
    done
    return $missing
}