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
    "zoom"
    )

/usr/bin/pamac install "${pamacPackages[@]}"

# Flatpaks
flatpak install org.videolan.VLC

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

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh || echo "Oh-my-zsh is already installed"
git -C ~/.oh-my-zsh/custom/themes clone --depth=1 https://github.com/romkatv/powerlevel10k.git || echo "p10k is already installed"

extlist=(
ms-python.python
vscodevim.vim
eamodio.gitlens
vscode-icons-team.vscode-icons
github.github-vscode-theme
esbenp.prettier-vscode
davidanson.vscode-markdownlint
golang.Go
ms-kubernetes-tools.vscode-kubernetes-tools
ms-azuretools.vscode-docker
timonwong.shellcheck
)

for i in "${extlist[@]}"; do
  code --install-extension "$i"
done