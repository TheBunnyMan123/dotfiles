#!/bin/bash

TMPDIR=$(mktemp -d /tmp/configs_XXXXXX)

mkdir -p ~/.tmux/plugins/tpm

yes "" | sudo pacman -Syu --needed keepassxc noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra alacritty file-roller dotnet-sdk-8.0 jdk17-openjdk git tmux neovim nerd-fonts firefox-developer-edition -y

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/TheBunnyMan123/dotfiles.git $TMPDIR
ls $TMPDIR
cp -r -v $TMPDIR/ $HOME/

cd "$(mktemp -d /tmp/yayXXXXXX)"

sudo pacman -S --needed git base-devel -y
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
yes | makepkg -si

yes "" | yay -Syu peazip
