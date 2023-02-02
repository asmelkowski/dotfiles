#! /usr/bin/env bash

# Install fonts
mkdir -p ~/.local/share/fonts && cp ./fonts/* ~/.local/share/fonts
fc-cache -f -v

# Install powerlevel10k oh-my-zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install i3wm
sudo apt update && sudo apt install -y \
    i3 \
    kitty \
    picom \
    polybar \
    rofi \
    scrot \
    zsh;

# Install oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install pyenv
curl https://pyenv.run | bash
