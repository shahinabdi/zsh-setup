# configs/plugins.sh
#!/bin/bash
source ./utils/logger.sh

install_plugins() {
    local plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
    declare -A plugins=(
        ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
        ["fast-syntax-highlighting"]="https://github.com/zdharma-continuum/fast-syntax-highlighting"
        ["zsh-autocomplete"]="https://github.com/marlonrichert/zsh-autocomplete"
        ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search"
    )

    # Install plugins
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

    # Update .zshrc plugins configuration
    local zshrc="$HOME/.zshrc"
    local plugins_line
    local new_plugins="git zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete zsh-history-substring-search"

    # Read current plugins configuration
    if plugins_line=$(grep -E '^[[:space:]]*plugins=\([^)]*\)' "$zshrc"); then
        # Extract current plugins
        local current_plugins
        current_plugins=$(echo "$plugins_line" | sed -E 's/^[[:space:]]*plugins=\((.*)\)/\1/')
        
        # Create a list of plugins to add
        local plugins_to_add=""
        for plugin in $new_plugins; do
            if ! echo "$current_plugins" | grep -q "$plugin"; then
                plugins_to_add="$plugins_to_add $plugin"
            fi
        done

        if [ -n "$plugins_to_add" ]; then
            # Remove trailing space and closing parenthesis
            sed -i -E 's/^([[:space:]]*plugins=\([^)]*)\)/\1'"$plugins_to_add"')/' "$zshrc"
            log "Added new plugins: $plugins_to_add" "success"
        else
            log "All plugins already in configuration" "warning"
        fi
    else
        # If no plugins line found, add it
        echo "plugins=($new_plugins)" >> "$zshrc"
        log "Created new plugins configuration" "success"
    fi

    # Ensure source commands are present for plugins that need them
    local source_commands=(
        "source \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
    )

    for cmd in "${source_commands[@]}"; do
        if ! grep -q "$cmd" "$zshrc"; then
            echo "$cmd" >> "$zshrc"
            log "Added source command for plugin" "success"
        fi
    done
}