# Zsh Development Environment Setup

A modular script to set up a complete Zsh development environment with various tools and configurations.

## Features

- 🚀 Oh My Zsh installation
- 🎨 Powerlevel10k theme
- 📦 Zsh plugins (autosuggestions, syntax highlighting, etc.)
- 📂 Eza configurations for better ls experience
- 🐍 Pyenv for Python version management
- 📘 NVM for Node.js version management
- ⚙️ Core Zsh configurations
- 🔤 Nerd Fonts installation (MesloLGS NF, JetBrainsMono, FiraCode, Hack)

## Prerequisites

### Required
- git (for cloning and plugin management)
- curl (for downloading components)
- zsh (core shell requirement)

### Optional
These are only required if you choose to install their respective configurations:
- eza (required if selecting eza configurations)
- unzip (required for Nerd Fonts installation)

Note: If eza isn't installed and you select eza configurations, the script will attempt to install it automatically on supported systems (requires sudo privileges).

## Installation

1. Clone the repository:

```bash
git clone https://github.com/shahinabdi/zsh-setup.git
cd zsh-setup
```

2. Make scripts executable:

```bash
chmod +x install.sh utils/*.sh configs/*.sh
```

3. Run the installer:

```bash
./install.sh
```

## Components

### Oh My Zsh

- Base framework for managing Zsh configuration
- Provides plugin system and themes

### Zsh Plugins

- zsh-autosuggestions: Fish-like autosuggestions
- zsh-syntax-highlighting: Fish-like syntax highlighting
- fast-syntax-highlighting: Advanced syntax highlighting
- zsh-autocomplete: Advanced completion system

### Powerlevel10k

- A fast and feature-rich Zsh theme
- Customizable prompt segments
- Instant prompt feature

### Eza Configurations

- Modern replacement for ls
- Git integration
- Tree view support
- Icons support (with Nerd Fonts)
- Color customization
- Detailed and special views
- Git status integration

### Pyenv

- Python version management
- Virtual environment support
- Automatic version switching

### NVM (Node Version Manager)

- Node.js version management
- npm/yarn global package management
- Automatic version switching

### Core Zsh Configurations

- Enhanced history management
- Key bindings for better navigation
- Improved command line experience

### Nerd Fonts

- MesloLGS NF (Regular, Bold, Italic, Bold Italic)
- JetBrainsMono Nerd Font
- FiraCode Nerd Font
- Hack Nerd Font
- Automatic font cache updating
- Terminal configuration guidance

## Directory Structure

```
.
├── install.sh              # Main installation script
├── utils/                  # Utility scripts
│   ├── colors.sh          # Color definitions
│   ├── helpers.sh         # Helper functions
│   └── logger.sh          # Logging functions
└── configs/               # Component configurations
    ├── eza.sh            # Eza aliases and settings
    ├── nerd_fonts.sh     # Nerd Fonts installation
    ├── nvm.sh            # NVM installation and setup
    ├── oh-my-zsh.sh      # Oh My Zsh installation
    ├── plugins.sh        # Zsh plugins installation
    ├── powerlevel10k.sh  # P10k theme installation
    ├── pyenv.sh          # Pyenv installation
    └── zshrc.sh          # Core Zsh settings
```

## Usage

Run the installer and select the components you want to install:

```bash
./install.sh
```

Options:

1. Oh My Zsh
2. Zsh Plugins
3. Powerlevel10k
4. Eza configurations
5. Pyenv
6. NVM
7. Core Zsh configurations
8. Nerd Fonts
9. Install ALL
10. Exit

## Logs and Backups

- Installation logs are saved to `install.log`
- Your original `.zshrc` is backed up before modifications
- Each component checks for existing installations to prevent duplicates

## After Installation

1. Restart your terminal
2. Configure your terminal to use one of the installed Nerd Fonts:
   - MesloLGS NF
   - JetBrainsMono Nerd Font
   - FiraCode Nerd Font
   - Hack Nerd Font
3. If you installed Powerlevel10k, run `p10k configure` for customization
4. If you installed NVM, use `nvm install --lts` to install the latest LTS Node.js
5. If you installed Pyenv, use `pyenv install <version>` to install Python versions

## Troubleshooting

### Common Issues

1. **Oh My Zsh installation fails**

   - Ensure Zsh is installed: `which zsh`
   - Make sure you have write permissions in home directory

2. **Plugin installation fails**

   - Check internet connection
   - Verify Git is installed and configured

3. **Eza commands not working**

   - Ensure Eza is installed: `which eza`
   - Restart your terminal after installation

4. **Nerd Fonts not showing up**
   - Run `fc-cache -fv` to rebuild font cache
   - Make sure your terminal is configured to use the Nerd Font
   - Log out and log back in if fonts still don't appear

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details
