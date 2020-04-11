#!/bin/sh

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
    echo '#Launchpadに表示されないので表示されるように設定'\\n'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc
    source ~/.zshrc
    echo "Install Homebrew is Complete!" ;;

  n|N)
    echo "インストールをスキップしました" ;;
esac
echo " ------------ END ------------"

echo " ------------ anyenv ------------"
echo "pyenv(anyenvを使用します)を使う方法とpyenvを使わずにAnacondaのみをインストールする方法があります"
read -p "anyenvをインストールしますか？ (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    brew install anyenv
    echo '#anyenvを動かすために必要'\\n'export PATH="$HOME/.anyenv/bin:$PATH"'\\n'eval "$(anyenv init -)"' >> ~/.zshrc
    source ~/.zshrc
    anyenv install --init
    echo " ------------ anyenv installed ------------"
    echo " ------------ pyenv ------------"
    echo "Anyenvを使用する場合pyenvを使用することを推奨します"
    read -p "pyenvをインストールしますか？ (y/n)" Answer_pyenv < /dev/tty
    case ${Answer_pyenv} in
      y|Y)
        anyenv install pyenv
        source ~/.zshrc
        echo " ------------ Anaconda ------------"
        echo "Anacondaを使用することを推奨します"
        read -p "Anacondaをインストールしますか？ (y/n)" Answer_pyenv_anaconda < /dev/tty
        case ${Answer_pyenv_anaconda} in
          y|Y)
            pyenv install $(pyenv install -l | grep 'anaconda3-' | grep -e '\s3*' | tail -1)
            source ~/.zshrc ;;
          n|N)
            echo "Anacondaのインストールをキャンセルしました"
            echo " ------------ Python3 最新安定版 ------------"
            echo "中級•上級者はデフォルトのPython3を使用することを推奨します"
            read -p "Python3をインストールしますか？ (y/n)" Answer_pyenv_new < /dev/tty
            case ${Answer_pyenv_new} in
              y|Y)
                pyenv install $(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
                source ~/.zshrc ;;
              n|N)
                echo "最新安定版のインストールをキャンセルしました" ;;
            esac ;;
        esac ;;
    esac ;;
  n|N)
    echo "anyenvのインストールをスキップしました．"\\n"続いてAnacodaのインストールに進みます"
    read -p "Anacondaのみをインストールしますか？ (y/n)" Answer_anaconda < /dev/tty
    case ${Answer_anaconda} in
      y|Y)
        brew cask install anaconda
        echo "anacondaのインストールをスキップしました" ;;
    esac ;;
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



read -p "Shell補完を行いたいですか？(新入生はあった方がいいと思います) (y/n)" Answer < /dev/tty
case ${Answer} in
  y|Y)
    #zshの補完
    brew install zsh-completions
    echo '#zshの補完に使用' >> ~/.zshrc
    echo 'fpath=(/path/to/homebrew/share/zsh-completions $fpath)' >> ~/.zshrc
    echo 'autoload -U compinit' >> ~/.zshrc
    echo 'compinit -u' >> ~/.zshrc
    source ~/.zshrc ;;
  n|N)
    echo "スキップしました．" ;;
  esac

echo "ありがとうございました"
open "https://www.uec-programming.com/"
open "http://github.com/Shirashoji/"

chsh -s /bin/zsh
zsh
