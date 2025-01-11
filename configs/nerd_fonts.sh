#!/bin/bash
source ./utils/logger.sh

FONTS_DIR="$HOME/.local/share/fonts"
TEMP_DIR="/tmp/nerd_fonts"

install_nerd_fonts() {
    log "Starting Nerd Fonts installation..." "info"
    
    # Create fonts directory if it doesn't exist
    mkdir -p "$FONTS_DIR"
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR" || exit 1

    # Array of font names and their URLs
    declare -A fonts=(
        ["MesloLGS NF Regular"]="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
        ["MesloLGS NF Bold"]="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
        ["MesloLGS NF Italic"]="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
        ["MesloLGS NF Bold Italic"]="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
        ["JetBrainsMono"]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
        ["FiraCode"]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
        ["Hack"]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip"
    )

    for font_name in "${!fonts[@]}"; do
        local url="${fonts[$font_name]}"
        log "Installing $font_name..." "info"
        
        if [[ $url == *.ttf ]]; then
            # Direct TTF file
            if curl -fL "$url" -o "$FONTS_DIR/${font_name// /_}.ttf"; then
                log "$font_name downloaded successfully" "success"
            else
                log "Failed to download $font_name" "error"
                continue
            fi
        elif [[ $url == *.zip ]]; then
            # Zipped font collection
            if curl -fL "$url" -o "${font_name}.zip"; then
                unzip -o "${font_name}.zip" -d "$FONTS_DIR/${font_name}" > /dev/null 2>&1
                log "$font_name installed successfully" "success"
                rm "${font_name}.zip"
            else
                log "Failed to download $font_name" "error"
                continue
            fi
        fi
    done

    # Clean up
    cd - > /dev/null
    rm -rf "$TEMP_DIR"

    # Refresh font cache
    if command -v fc-cache &> /dev/null; then
        log "Refreshing font cache..." "info"
        fc-cache -f
        log "Font cache refreshed" "success"
    fi

    # Instructions for terminal configuration
    cat << 'EOF' >> "$HOME/.zshrc"

# Terminal font configuration reminder
# To use these fonts, configure your terminal to use one of:
# - MesloLGS NF
# - JetBrainsMono Nerd Font
# - FiraCode Nerd Font
# - Hack Nerd Font
EOF

    log "Nerd Fonts installation complete" "success"
    log "Please configure your terminal to use one of the installed fonts" "info"
}