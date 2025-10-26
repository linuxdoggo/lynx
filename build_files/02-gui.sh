#!/bin/bash

set -ouex pipefail

### Install packages

dnf copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

dnf copr enable brycensranch/gpu-screen-recorder-git

dnf copr enable errornointernet/quickshell

dnf copr enable zirconium/packages

# this installs a package from fedora repos
dnf5 install -y \
    google-roboto-fonts
    niri \
    sddm \
    alacritty \
    quickshell-git \
    rsms-inter-fonts \
    matugen \
    gpu-screen-recorder-ui
    
    
