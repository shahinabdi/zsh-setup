#!/bin/bash
source ./utils/logger.sh

install_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        log "Oh My Zsh already installed" "warning"
        return 0
    fi

    log "Installing Oh My Zsh..." "info"
    if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; then
        log "Oh My Zsh installed successfully" "success"
    else
        log "Failed to install Oh My Zsh" "error"
        return 1
    fi
}