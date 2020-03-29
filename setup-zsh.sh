#!/bin/zsh

#xcode command line tools
xcode-select --install

#HomeBrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#HomeBrewのアップデート(強制)
brew update --force && brew upgrade

#brew cask
brew install caskroom/cask/brew-cask
#今は自動インストールされるらしい でも一応ね

#Launchpadに表示されるように
echo '#Launchpadに表示されないので表示されるように設定'\\n'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc
source ~/.zshrc

#zshの補完
brew install zsh-completions
echo 'fpath=(/path/to/homebrew/share/zsh-completions $fpath)' >> ~/.zshrc
echo 'autoload -U compinit' >> ~/.zshrc
echo 'compinit -u' >> ~/.zshrc

source ~/.zshrc
