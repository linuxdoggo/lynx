#/bin/bash
sed -i -f - /usr/lib/os-release << EOF
s|^NAME=.*|NAME=\"Lynx\"|
s|^PRETTY_NAME=.*|PRETTY_NAME=\"Lynx\"|
s|^VERSION_CODENAME=.*|VERSION_CODENAME=\"Feline\"|
EOF

mkdir -p /etc/flatpak/remotes.d/
curl --retry 3 -Lo /etc/flatpak/remotes.d/flathub.flatpakrepo https://dl.flathub.org/repo/flathub.flatpakrepo

#begone fedora flatpak repo
rm -rf /usr/lib/systemd/system/flatpak-add-fedora-repos.service
systemctl enable flatpak-add-flathub-repos.service
