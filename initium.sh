#!/usr/bin/bash

set -e

pamacPackages=(
    "1password"
    "ansible"
    "checksec"
    "chezmoi"
    "chromium-bypass-paywalls-clean-git"
    "chromium-bypass-paywalls"
    "chromium-extension-ublock-origin"
    "chromium"
    "code"
    "deno"
    "docker-compose"
    "docker"
    "dropbox"
    "etcher"
    "flatpak"
    "ghidra"
    "github-cli"
    "gnome-passwordsafe"
    "gnome-shell-extension-audio-output-switcher-git"
    "gnome-shell-extension-clipboard-history"
    "gnome-shell-extension-pop-shell"
    "go"
    "helm"
    "krew-bin"
    "kubectl"
    "kubectx"
    "kustomize"
    "logo-ls"
    "masscan"
    "navi"
    "neovim"
    "nerd-fonts-go-mono"
    "nerd-fonts-jetbrains-mono"
    "nmap"
    "plocate"
    "pwndbg"
    "rocketchat-client-bin"
    "ropgadget"
    "ropper"
    "seclists"
    "shellcheck"
    "signal-desktop"
    "slack-desktop"
    "telegram-desktop"
    "tmux-plugin-manager"
    "tor-browser"
    "wl-clipboard"
    "xdg-desktop-portal-wlr"
    "youtube-dl"
    "fluent-reader-bin"
    "zoom"
    "zsh"
    "prettier"
    )

/usr/bin/pamac install "${pamacPackages[@]}"

# Flatpaks
flatpak install org.videolan.VLC

if /usr/bin/gnome-shell --version
then
# Dump using `dconf watch /`
echo "Configuring gnome"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
gsettings set org.gnome.shell enabled-extensions "['pamac-updates@manjaro.org', 'dash-to-dock@micxgx.gmail.com', 'appindicatorsupport@rgcjonas.gmail.com', 'gnome-ui-tune@itstime.tech', 'x11gestures@joseexposito.github.io', 'pop-shell@system76.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'audio-output-switcher@anduchs', 'clipboard-history@alexsaveau.dev']"
gsettings set org.gnome.shell disabled-extensions "['x11gestures@joseexposito.github.io']"
gsettings set org.gnome.desktop.interface enable-hot-corners false

# Hotkeys
gsettings set org.gnome.shell.extensions.pop-shell pop-workspace-down "['<Shift><Super>j']"
gsettings set org.gnome.shell.extensions.pop-shell pop-workspace-up "['<Shift><Super>k']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>m']"

# Disable the shitty dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

fi

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh || echo "Oh-my-zsh is already installed"
git -C ~/.oh-my-zsh/custom/themes clone --depth=1 https://github.com/romkatv/powerlevel10k.git || echo "p10k is already installed"

extlist=(
"ms-python.python"
"vscodevim.vim"
"eamodio.gitlens"
"vscode-icons-team.vscode-icons"
"github.github-vscode-theme"
"esbenp.prettier-vscode"
"davidanson.vscode-markdownlint"
"golang.Go"
"ms-kubernetes-tools.vscode-kubernetes-tools"
"ms-azuretools.vscode-docker"
"timonwong.shellcheck"
"EditorConfig.EditorConfig"
"hashicorp.terraform"
"redhat.java"
)

for i in "${extlist[@]}"; do
  code --install-extension "$i" --force
done


# Install krew plugins

krewPlugins=(
    "deprecations"
    "df-pv"
    "doctor"
    "istiolog"
    "node-shell"
    "prune-unused"
    "sniff"
    "unused-volumes"
    "view-utilization"
    "viewnode"
    "view-secret"
    )

/usr/bin/kubectl krew install "${krewPlugins[@]}"
