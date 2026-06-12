#!/bin/bash
# Installiert K3s ohne Standard-Netzwerkkomponenten
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Bitte als root ausführen."
  exit 1
fi

echo "--- Installiere K3s ---"
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s - \
  --disable traefik \
  --disable servicelb \
  --flannel-backend=none \
  --disable-network-policy
