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

dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty
dnf5 -y copr disable scottames/ghostty

dnf5 -y copr enable atim/starship 
dnf5 -y install starship 
dnf5 -y copr disable atim/starship

#dnf5 -y copr enable ublue-os/packages  
#dnf5 -y install ublue-os-flatpak
#dnf5 -y copr disable ublue-os/packages 


dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# this installs a package from fedora repos
dnf5 install -y \
    google-roboto-fonts \
    flatpak \
    brightnessctl \
    alacritty \
    rsms-inter-fonts \
    just \
    fastfetch \
    nautilus \
    gnome-keyring \
    steam \
    wl-clipboard \
    gdm \
    pipewire \
    xwayland-satellite \
    xdg-user-dirs \
    wireplumber \
    xdg-desktop-portal \
    wlsunset \
    nvim \
    bluetoothctl \
    NetworkManager \
    ddcutil \
    cava \
    lxappearance \
    gnome-system-monitor \
    papirus-icon-theme \
    fzf \
    qt6ct \
    glycin-thumbnailer \
    ffmpegthumbnailer \
    xfce-polkit \
    chezmoi

# qemu and virt-manager stuffs

dnf5 install -y \
    qemu \
    libvirt \
    virsh 

dnf5 install -y \
    default-fonts-core-emoji \
    google-noto-color-emoji-fonts \
    google-noto-emoji-fonts \
    glibc-all-langpacks \
    default-fonts

dnf -y copr enable ublue-os/flatpak-test
dnf -y copr disable ublue-os/flatpak-test
dnf -y --repo=copr:copr.fedorainfracloud.org:ublue-os:flatpak-test swap flatpak flatpak
dnf -y --repo=copr:copr.fedorainfracloud.org:ublue-os:flatpak-test swap flatpak-libs flatpak-libs
dnf -y --repo=copr:copr.fedorainfracloud.org:ublue-os:flatpak-test swap flatpak-session-helper flatpak-session-helper
rpm -q flatpak --qf "%{NAME} %{VENDOR}\n" | grep ublue-os

rm -rf /usr/share/doc/just
systemctl enable firewalld

rsync -rvK /ctx/system_files/ /

git clone "https://github.com/noctalia-dev/noctalia-shell.git" /usr/share/lynx/noctalia-shell

cp "/usr/share/backgrounds/SH2-284.jpg" /usr/share/lynx/noctalia-shell/Assets/Wallpaper/noctalia.png

git clone "https://github.com/linuxdoggo/lynx-dots.git" /usr/share/lynx/lynx-dots

git clone "https://github.com/simtrami/posy-improved-cursor-linux" /usr/share/lynx/cursors
cp -r /usr/share/lynx/cursors/Posy_Cursor_Black /usr/share/icons/

systemctl enable flatpak-preinstall.service
systemctl enable --global noctalia.service
systemctl enable --global chezmoi.service
systemctl enable --global chezmoi-update.timer
#systemctl enable --global plasma-polkit-agent.service
systemctl preset --global chezmoi
systemctl preset --global chezmoi-update
#systemctl preset --global plasma-polkit-agent.service
    
