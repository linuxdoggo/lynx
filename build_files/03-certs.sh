#/bin/bash

set -ouex pipefail

curl -w %{certs} https://auth.beammp.com/userlogin -k > beammp.pem
cp beammp.pem /etc/pki/ca-trust/source/anchors/
update-ca-trust extract
