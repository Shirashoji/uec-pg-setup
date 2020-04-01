#!/bin/sh

echo " ------------ Set Password ------------"
# パスワードを記憶
read -sp "このMacにログインした際のパスワードを入力してください: " __pass;
echo "\n ------------ END ------------"

echo " ------------ XCode ------------"
echo "Command Line Toolsが無いと，Homebrewなどを入れられません．また，既に入っているのでなければインストールをお勧めします."
read -p "Command Line Toolsをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    echo "Start Install Homebrew..."
    xcode-select --install
    echo "Install Homebrew is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac


echo " ------------ Homebrew ------------"
echo "Homebrewは後々あると便利です．既に入っているのでなければインストールをお勧めします."
read -p "Homebrewをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    echo "Start Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew update --force && brew upgrade
    echo "Install Homebrew is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac
