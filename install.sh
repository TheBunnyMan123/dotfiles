#!/bin/bash

mkdir -p ~/.tmux/plugins/tpm
mkdir -p ~/.config/nvim
mkdir -p ~/.config/fontconfig
mkdir -p ~/.config/alacritty

TMPDIR=$(mktemp -d /tmp/XXXXXX)

yes "" | sudo pacman -Syu --needed keepassxc noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra alacritty file-roller dotnet-sdk-8.0 jdk17-openjdk git tmux neovim nerd-fonts firefox-developer-edition -y
git clone https://github.com/TheBunnyMan123/dotfiles $TMPDIR
rm -fr $TMPDIR/.git*
cd $TMPDIR
cp -R . ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml

cd "$(mktemp -d /tmp/yayXXXXXX)"

sudo pacman -S --needed git base-devel -y
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
yes | makepkg -si

cd "$(mktemp -d /tmp/bunny-prompt_XXXXXX)"
curl -L https://github.com/TheBunnyMan123/bunny-prompt/releases/latest/download/PKGBUILD -o PKGBUILD
yes | makepkg -si

yes "" | yay -Syu peazip

yes | sudo pacman -R gnome-terminal
yes | sudo pacman -R gnome-console

sudo mkdir -p /usr/local/share/gnome-terminal-symlink/
sudo curl https://gist.githubusercontent.com/TheBunnyMan123/08d10eeea24a00fec46c926aaa484482/raw/gterm-alacritty.sh -o /usr/local/share/gnome-terminal-symlink/gterm-alacritty.sh
sudo ln /usr/local/share/gnome-terminal-symlink/gterm-alacritty.sh /usr/local/bin/gnome-terminal
sudo chmod 755 /usr/share/gnome-terminal-symlink/gterm-alacritty.sh
sudo chmod 755 /usr/bin/gnome-terminal
