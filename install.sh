#!/bin/bash

# Source utilities
source ./utils/colors.sh
source ./utils/logger.sh
source ./utils/helpers.sh

# Source all configs
for config in ./configs/*.sh; do
    source "$config"
done

print_menu() {
    clear
    echo -e "${BLUE}===========================${NC}"
    echo -e "${BLUE}    Dev Setup Assistant${NC}"
    echo -e "${BLUE}===========================${NC}"
    echo "Select components to install:"
    echo -e "${GREEN}1.${NC} Oh My Zsh"
    echo -e "${GREEN}2.${NC} Zsh Plugins"
    echo -e "${GREEN}3.${NC} Powerlevel10k"
    echo -e "${GREEN}4.${NC} Eza configurations"
    echo -e "${GREEN}5.${NC} Pyenv"
    echo -e "${GREEN}6.${NC} NVM (Node Version Manager)"
    echo -e "${GREEN}7.${NC} Core Zsh configurations"
    echo -e "${GREEN}8.${NC} Nerd Fonts"
    echo -e "${GREEN}9.${NC} Install ALL"
    echo -e "${RED}10.${NC} Exit"
    echo
    echo -e "${CYAN}Enter your choice:${NC}"
}

handle_installation() {
    case $1 in
        1) install_oh_my_zsh ;;
        2) install_plugins ;;
        3) install_powerlevel10k ;;
        4) install_eza ;;
        5) install_pyenv ;;
        6) install_nvm ;;
        7) configure_zsh_core ;;
        8) install_nerd_fonts ;;
        9) 
            install_nerd_fonts
            install_oh_my_zsh
            configure_zsh_core
            install_plugins
            install_powerlevel10k
            install_eza
            install_pyenv
            install_nvm
            ;;
        10) 
            print_info "Installation complete"
            print_success "Installation log saved to $LOG_FILE"
            print_info "Please restart your terminal for changes to take effect"
            exit 0
            ;;
        *) 
            print_error "Invalid choice: $1"
            return 1
            ;;
    esac
}


main() {
    export LOG_FILE="install.log"
    > "$LOG_FILE"
    
    print_info "Starting installation..."
    
    if ! check_dependencies; then
        print_error "Please install the required dependencies first"
        exit 1
    fi

    backup_zshrc

    while true; do
        print_menu
        read choice
        handle_installation "$choice"
        
        if [ $? -eq 0 ]; then
            echo
            read -p "Press Enter to continue..."
        fi
    done
}

main