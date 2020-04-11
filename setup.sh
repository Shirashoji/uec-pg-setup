#!/bin/zsh

chsh -s /bin/zsh
zsh

echo "既に入っている物に関してはnを入力してください"
echo " ------------ XCode ------------"
echo "XCode Command Line Toolsのみインストール場合のみy"
read -p "Command Line Toolsをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    echo "Start Install Command Line Tools..."
    xcode-select --install
    echo "Install Command Line Tools is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"


echo " ------------ Homebrew ------------"
echo "新入生は入ってなければy"
read -p "Homebrewをインストールしますか？ (y/n)" Answer_homebrew < /dev/tty
case ${Answer_homebrew} in
  y|Y)
    echo "Start Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew update --force && brew upgrade
    echo "Install Homebrew is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ Anaconda ------------"
echo "新入生は入ってなければy，pyenvを使用したい場合は自分で入れてください．"
read -p "Anacondaをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    brew cask install anaconda ;;
  n|N)
      echo "インストールをスキップしました" ;;
  esac
echo " ------------ END ------------"

echo " ------------ Slack ------------"
read -p "Slackをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
  brew cask install slack ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ Chrome ------------"
read -p "Chromeをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    brew cask install google-chrome ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ Atom ------------"
read -p "Atomをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    brew cask install atom
    apm install terminal-plus
    apm install atom-runner
    apm install color-picker ;;
  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"


echo " ------------ ITerm2 ------------"
read -p "ITerm2をインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    brew cask install iterm2 ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac

echo " ------------ END ------------"


echo " ------------ 質問コーナー! ------------"


case ${Answer_homebrew} in
  y|Y)
    echo '#Launchpadに表示されないので表示されるように設定'\\n'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc
    source ~/.zshrc ;;
esac
read -p "zshで補完を行いたい？(新入生はあった方がいいと思います) (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    #zshの補完
    brew install zsh-completions
    echo 'fpath=(/path/to/homebrew/share/zsh-completions $fpath)' >> ~/.zshrc
    echo 'autoload -U compinit' >> ~/.zshrc
    echo 'compinit -u' >> ~/.zshrc
    source ~/.zshrc ;;
  n|N)
    echo "スキップしました．" ;;
  esac
echo "以上質問コーナーでした"
echo " ------------ END ------------"

echo "ありがとうございました"
open "https://www.uec-programming.com/"
