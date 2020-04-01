#!/bin/sh

echo " ------------ Set Password ------------"
# パスワードを記憶
read -sp "このMacにログインした際のパスワードを入力してください: " __pass;
echo "\n ------------ END ------------"

echo "既に入っている物に関してはnを入力してください"
echo " ------------ XCode ------------"
echo "新入生は入ってなければy"
read -p "Command Line Toolsをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    echo "Start Install Command Line Tools..."
    xcode-select --install
    echo "Install Command Line Tools is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac


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

echo "新入生は入ってなければy"
read -p "Anacondaをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    brew cask install anaconda ;;
  n|N)
      echo "インストールをスキップしました" ;;
  esac


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

read -p "zsh?新入生は多分zshなのでyを入力してください (y/n)" q_zsh < /dev/tty
case ${q_zsh} in
  y|Y)
    case ${Answer_homebrew} in
      y|Y)
        echo '#Launchpadに表示されないので表示されるように設定'\\n'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc
        source ~/.zshrc
    esac
    read -p "zshで補完を行いますか？新入生はあった方がいいと思います (y/n)" Answer < /dev/tty
    case ${Answer} in
      y|Y)
        #zshの補完
        brew install zsh-completions
        echo 'fpath=(/path/to/homebrew/share/zsh-completions $fpath)' >> ~/.zshrc
        echo 'autoload -U compinit' >> ~/.zshrc
        echo 'compinit -u' >> ~/.zshrc
        source ~/.zshrc ;;
      n|N)
        echo "#zshの補完はありません" ;;
    esac
esac

echo "ありがとうございました"
