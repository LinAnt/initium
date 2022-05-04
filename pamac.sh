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
gsettings set org.gnome.shell enabled-extensions "['pamac-updates@manjaro.org', 'dash-to-dock@micxgx.gmail.com', 'appindicatorsupport@rgcjonas.gmail.com', 'gnome-ui-tune@itstime.tech', 'x11gestures@joseexposito.github.io', 'pop-shell@system76.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.desktop.interface enable-hot-corners false

# Disable the shitty dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

fi
