#!/bin/zsh

#zshに変更
chsh -s /bin/zsh

#X-Code
xcode-select --install
#Homebrewのインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Chromeのインストール
brew install wget
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil mount googlechrome.dmg

#pyenvのインストール
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

#Pythonのインストール
pyenv install
pyenv install $(pyenv install -l | grep 'anaconda3-' | grep -e '\s3*' | tail -1)

#zsh
brew install zsh-completions
echo 'fpath=(/path/to/homebrew/share/zsh-completions $fpath)' >> ~/.zshrc
echo 'autoload -U compinit' >> ~/.zshrc
echo 'compinit -u' >> ~/.zshrc


echo "SlackはAppStoreからのみインストールできます."
