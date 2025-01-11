#!/bin/bash
source ./utils/logger.sh

install_nvm() {
    if [ -d "$HOME/.nvm" ]; then
        log "NVM already installed" "warning"
        return 0
    fi

    log "Installing NVM..." "info"
    if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash; then
        cat >> "$HOME/.zshrc" << 'EOF'

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF
        log "NVM installed and configured successfully" "success"
        
        # Install latest LTS Node
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        nvm install --lts
        nvm use --lts
        log "Node.js LTS installed successfully" "success"
    else
        log "Failed to install NVM" "error"
    fi
}