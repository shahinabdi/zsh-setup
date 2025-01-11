#!/bin/bash
source ./utils/logger.sh

install_pyenv() {
    if command -v pyenv &> /dev/null; then
        log "Pyenv already installed" "warning"
        return 0
    fi

    log "Installing pyenv dependencies..." "info"
    case "$(uname -s)" in
        Linux)
            if command -v apt-get &> /dev/null; then
                sudo apt-get update
                sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
                libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
                libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
            elif command -v pacman &> /dev/null; then
                sudo pacman -Sy --noconfirm base-devel openssl zlib xz
            elif command -v dnf &> /dev/null; then
                sudo dnf install -y make gcc zlib-devel bzip2 bzip2-devel \
                readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel
            fi
            ;;
        Darwin)
            if command -v brew &> /dev/null; then
                brew install openssl readline sqlite3 xz zlib
            else
                log "Homebrew not installed" "error"
                return 1
            fi
            ;;
    esac

    log "Installing pyenv..." "info"
    if curl https://pyenv.run | bash; then
        cat >> "$HOME/.zshrc" << 'EOF'

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF
        log "Pyenv installed and configured successfully" "success"
    else
        log "Failed to install pyenv" "error"
    fi
}