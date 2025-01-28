
# Zsh Configuration Setup

This repository contains a `.zshrc` file with a custom configuration designed for productivity and aesthetic enhancements in Arch Linux. The configuration can be followed for other Unix-like systems but the steps below are for Arch. Follow the steps below to install the necessary tools and dependencies.

---

## Prerequisites

Before using this configuration, ensure you have the following installed:

### Zsh
- Install Zsh if it’s not already installed:
  ```bash
  sudo pacman -S zsh  # Arch-based systems
  sudo apt install zsh # Debian-based systems

- Set Zsh as your default shell:

  chsh -s $(which zsh)

- Install Powerlevel10k for customisable prompts:

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh-theme-powerlevel10k

- Install Zshell plugins for more auto suggestions and syntax highlighting:

  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/.zsh/zsh-autosuggestions

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh-syntax-highlighting

- Add Zoxide for better directory navigation:

  sudo pacman -S zoxide  # Arch-based systems

- Install fuzzy finder:

  sudo pacman -S fzf  # Arch-based systems

### Optional
- Install NVM for managing node.js versions

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash


- Install Neofetch to get system details on load

  sudo pacman -S neofetch

- Install WINE
  
  sudo pacman -S wine

### Additional steps

- run p10k configure to setup Powerlevel10k

  p10k configure
