#! /usr/bin/env bash

# Install fonts
cp ./fonts/* ~/.local/share/fonts
fc-cache -f -v

# Install i3wm
sudo apt update && sudo apt install -y \
    i3 \
    zsh

# Install oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install pyenv
curl https://pyenv.run | bash
