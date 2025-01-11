#!/bin/bash
source ./utils/colors.sh

print_success() {
    echo -e "${GREEN}[✔] $1${NC}"
}

print_error() {
    echo -e "${RED}[✘] $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}[!] $1${NC}"
}

print_info() {
    echo -e "${BLUE}[i] $1${NC}"
}

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
    case $2 in
        "success") print_success "$1" ;;
        "error") print_error "$1" ;;
        "warning") print_warning "$1" ;;
        *) print_info "$1" ;;
    esac
}