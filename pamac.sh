#!/usr/bin/bash

set -e

pamacPackages=(
    "tmux-plugin-manager"
    "zsh"
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
    "logo-ls"
    "go"
    "dropbox"
    "code"
    "slack-desktop"
    "ansible"
    "1password"
    "gnome-passwordsafe"
    "chromium-extension-ublock-origin"
    "telegram-desktop"
    "signal-desktop"
    "tor-browser"
    "chezmoi"
    "gnome-shell-extension-pop-shell"
    "chromium-bypass-paywalls"
    "chromium-bypass-paywalls-clean-git"
    "gnome-shell-extension-clipboard-history"
    "shellcheck"
    "deno"
    )

/usr/bin/pamac install "${pamacPackages[@]}"

if /usr/bin/gnome-shell --version
then
# Dump using `dconf watch /`
echo "Configuring gnome"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
fi
