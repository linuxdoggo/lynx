#!/bin/bash

set -ouex pipefail

### Install packages

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
dnf5 -y install matugen 
dnf5 -y copr disable zirconium/packages

# this installs a package from fedora repos
dnf5 install -y \
    google-roboto-fonts \
    gdm \
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
    greetd-selinux \
    greetd \
    tuigreet \
    pipewire \
    xwayland-satellite \
    xdg-user-dirs \
    wireplumber \
    cava

rm -rf /usr/share/doc/just

systemctl enable greetd
systemctl enable firewalld
    
    
