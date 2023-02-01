#!/bin/zsh
source $HOME/.bw_session
echo $(bw get password 'STX laptop' --session $BW_SESSION)