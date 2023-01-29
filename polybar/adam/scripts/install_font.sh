#!/usr/bin/env bash

if ! git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git && [ -d "nerd-fonts" ] ; then
    echo "Clone failed because the folde nerd-fonts exists"
fi

./nerd-fonts/install.sh JetBrainsMono && \
    rm -rf nerd-fonts

# curl -LO https://github.com/Keyamoon/IcoMoon-Free/archive/master.zip && \ 
#     unzip master.zip -d ./icomoon && \
#     cp -a ./icomoon/IcoMoon-Free-master/Font/*.ttf $HOME/.local/share/fonts &&
#     rm -rf ./icomoon && \
#     fc-cache -f -v