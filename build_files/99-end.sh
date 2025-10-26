#/bin/bash
sed -i -f - /usr/lib/os-release << EOF
s|^NAME=.*|NAME=\"Lynx\"|
s|^PRETTY_NAME=.*|PRETTY_NAME=\"Lynx\"|
s|^VERSION_CODENAME=.*|VERSION_CODENAME=\"Feline\"|
EOF
