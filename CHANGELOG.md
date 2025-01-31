# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2024-01-31

### Added
- zsh-history-substring-search plugin for enhanced history search
- Source command for history substring search plugin

### Fixed
- Fixed missing history-substring-search widget error
- Ensure history search bindings work after plugin installation

## [1.0.2] - 2024-01-12

### Changed
- Updated README to clarify required and optional prerequisites
- Improved documentation for eza configuration requirements

## [1.0.1] - 2024-01-11

### Changed
- Renamed configuration files from .zsh to .sh for consistency
- Enhanced eza configuration script to handle eza installation if not present

### Fixed
- Added automatic eza installation in eza configuration script
- Fixed file extension consistency across the project

## [1.0.0] - 2024-01-11

### Added

- Initial release of the Zsh Development Environment Setup
- Modular script structure with separate configurations
- Interactive menu system with colored output
- Comprehensive logging system
- Installation components:
  - Oh My Zsh installation and configuration
  - Zsh plugins (autosuggestions, syntax-highlighting, fast-syntax-highlighting, autocomplete)
  - Powerlevel10k theme
  - Eza configurations with extensive aliases
  - Pyenv installation and setup
  - NVM (Node Version Manager) installation
  - Core Zsh configurations (history, key bindings)
  - Nerd Fonts installation (MesloLGS NF, JetBrainsMono, FiraCode, Hack)
- Backup system for existing configurations
- Error handling and dependency checking
- Detailed documentation and README
- Installation status checks to prevent duplicates

### Security

- Script performs all operations in user space
- No system-wide changes without explicit permission
- Secure download methods using trusted sources

### Dependencies

- git
- curl
- zsh
- unzip (for Nerd Fonts installation)
