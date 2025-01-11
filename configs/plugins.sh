#!/bin/bash
source ./utils/logger.sh

install_plugins() {
    local plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
    declare -A plugins=(
        ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
        ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
        ["fast-syntax-highlighting"]="https://github.com/zdharma-continuum/fast-syntax-highlighting"
        ["zsh-autocomplete"]="https://github.com/marlonrichert/zsh-autocomplete"
    )

    for plugin in "${!plugins[@]}"; do
        if [ -d "$plugins_dir/$plugin" ]; then
            log "Plugin $plugin already installed" "warning"
            continue
        fi

        log "Installing $plugin..." "info"
        if git clone --depth=1 "${plugins[$plugin]}" "$plugins_dir/$plugin"; then
            log "Plugin $plugin installed successfully" "success"
        else
            log "Failed to install plugin $plugin" "error"
        fi
    done

    if ! grep -q "plugins=.*zsh-autosuggestions" "$HOME/.zshrc"; then
        sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' "$HOME/.zshrc"
        log "Plugins added to .zshrc" "success"
    fi
}