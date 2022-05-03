#!/usr/bin/bash

set -e

pamacPackages=(
    "tmux-plugin-manager"
    "neovim"
    "burpsuite"
    "chromium"
    "docker"
    "docker-compose"
    "kubectl"
    "helm"
    "nerd-fonts-jetbrains-mono"
    "nerd-fonts-go-mono"
    "kubectx"
    "wl-clipboard"
    "flatpak"
    "navi"
    )

pamac install "${pamacPackages[@]}"

if /usr/bin/gnome-shell --version
then
# Dump using `dconf watch /`
echo "Configuring gnome"
# gsettings set org.gnome.desktop.background show-desktop-icons false
fi