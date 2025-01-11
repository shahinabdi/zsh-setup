#!/bin/bash
source ./utils/logger.sh

install_powerlevel10k() {
    local dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    
    if [ -d "$dir" ]; then
        log "Powerlevel10k already installed" "warning"
        return 0
    fi

    log "Installing Powerlevel10k..." "info"
    if git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$dir"; then
        sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
        log "Powerlevel10k installed and configured successfully" "success"
    else
        log "Failed to install Powerlevel10k" "error"
    fi
}
