#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 -y install 'dnf5-command(config-manager)'

setsebool -P domain_kernel_load_modules on

#dnf5 -y copr enable bieszczaders/kernel-cachyos
#dnf5 -y install kernel-cachyos-rt kernel-cachyos-rt-devel-matched
#dnf5 -y remove kernel kernel-devel
#dnf5 -y copr disable bieszczaders/kernel-cachyos

dnf -y install \
    NetworkManager-wifi \
    atheros-firmware \
    brcmfmac-firmware \
    iwlegacy-firmware \
    iwlwifi-dvm-firmware \
    iwlwifi-mvm-firmware \
    mt7xxx-firmware \
    nxpwireless-firmware \
    realtek-firmware \
    tiwilink-firmware \
    firewalld

# this installs a package from fedora repos
dnf5 install -y \
  plymouth \
  plymouth-system-theme \
  git \
  unzip \
  tuned \
  tuned-ppd \
  rsync \
  rclone \
  glibc-locale-source

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable bootc-fetch-apply-updates

tee /usr/lib/systemd/zram-generator.conf <<'EOF'
[zram0]
zram-size = min(ram, 8192)
EOF
