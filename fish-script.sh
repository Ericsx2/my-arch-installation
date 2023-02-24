! /usr/bin/env fish

## asdf plugins
asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust

asdf install nodejs latest
asdf global nodejs latest

asdf install python latest
asdf global python latest

asdf install rust latest
asdf global rust latest

source

## Add yarn global
sudo npm i -g yarn

## Lunarvim 
LV_BRANCH='release-1.2/neovim-0.8'
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)