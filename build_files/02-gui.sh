#!/bin/bash

set -ouex pipefail

### Install packages

install -d /usr/share/lynx
install -d /etc/niri

dnf -y install 'dnf5-command(config-manager)'

dnf5 -y copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo
dnf5 -y install niri
dnf5 -y copr disable yalter/niri-git
rm -rf /usr/share/doc/niri

dnf5 -y copr enable brycensranch/gpu-screen-recorder-git
dnf5 -y install gpu-screen-recorder-ui
dnf5 -y copr disable brycensranch/gpu-screen-recorder-git

dnf5 -y copr enable errornointernet/quickshell
dnf5 -y install quickshell-git
dnf5 -y copr disable errornointernet/quickshell

dnf5 -y copr enable zirconium/packages
dnf5 -y install matugen cliphist
dnf5 -y copr disable zirconium/packages

dnf5 -y copr enable rivenirvana/ghostty
dnf5 -y install ghostty
dnf5 -y copr disable rivenirvana/ghostty

dnf5 -y copr enable atim/starship 
dnf5 -y install starship 
dnf5 -y copr disable atim/starship


dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# this installs a package from fedora repos
dnf5 install -y \
    google-roboto-fonts \
    brightnessctl \
    alacritty \
    rsms-inter-fonts \
    just \
    flatpak \
    fastfetch \
    nautilus \
    gnome-keyring \
    steam \
    wl-clipboard \
    gdm \
    tuigreet \
    pipewire \
    xwayland-satellite \
    xdg-user-dirs \
    wireplumber \
    xdg-desktop-portal \
    wlsunset \
    nvim \
    bluetoothctl \
    ddcutil \
    cava \
    lxappearance \
    gnome-system-monitor \
    papirus-icon-theme

dnf5 install -y \
    default-fonts-core-emoji \
    google-noto-color-emoji-fonts \
    google-noto-emoji-fonts \
    glibc-all-langpacks \
    default-fonts

rm -rf /usr/share/doc/just
systemctl enable firewalld

rsync -rvK /ctx/system_files/ /

git clone "https://github.com/noctalia-dev/noctalia-shell.git" /usr/share/lynx/noctalia-shell
    
    
