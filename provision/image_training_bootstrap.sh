#!/bin/bash
set -euo pipefail

# =============================================================================
# Bootstrap für Image Training Provision (VLM Captioning)
# =============================================================================
# Lädt das Provisioning-Script aus dem privaten Repo und führt es aus.
# =============================================================================

RAW_URL="https://raw.githubusercontent.com/moritzdemmerCode/no/main/provision/image_training_provision.sh"

if [[ -z "${GH_TOKEN:-}" ]]; then
  echo "ERROR: GH_TOKEN fehlt (GitHub PAT mit read-only auf moritzdemmerCode/no)"; exit 1
fi

echo "==> Lade Image Training Provisioning-Script ..."
curl -fsSL -H "Authorization: Bearer ${GH_TOKEN}" -L "$RAW_URL" -o /tmp/image_training_provision.sh

chmod +x /tmp/image_training_provision.sh
exec /bin/bash /tmp/image_training_provision.sh
