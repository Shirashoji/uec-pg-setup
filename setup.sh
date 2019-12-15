#!/bin/zsh

#zshに変更
chsh -s /bin/zsh

#X-Code
xcode-select --install
#Homebrewのインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#iTerm2のインストール
brew cask install iterm2
#Slackのインストール
brew cask install slack
#Chromeのインストール
brew cask install google-chrome
#Atomのインストール
brew cask install atom
apm install terminal-plus
apm install atom-runner
apm install color-picker

#pyenvのインストール
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

#Pythonのインストール
pyenv install
pyenv install $(pyenv install -l | grep 'anaconda3-' | grep -e '\s3*' | tail -1)

#zshの補完
brew install zsh-completions
echo 'fpath=(/path/to/homebrew/share/zsh-completions $fpath)' >> ~/.zshrc
echo 'autoload -U compinit' >> ~/.zshrc
echo 'compinit -u' >> ~/.zshrc
