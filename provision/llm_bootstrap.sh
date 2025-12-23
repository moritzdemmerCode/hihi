#!/bin/bash
set -euo pipefail

# =============================================================================
# Bootstrap für LLM Provision (GLM-4.5-Air-Derestricted)
# =============================================================================
# Lädt das Provisioning-Script aus dem privaten Repo und führt es aus.
# =============================================================================

# Cache-Bust: append ?v=X to force fresh download
RAW_URL="https://raw.githubusercontent.com/moritzdemmerCode/no/main/provision/llm_provision.sh?v=4"

if [[ -z "${GH_TOKEN:-}" ]]; then
  echo "ERROR: GH_TOKEN fehlt (GitHub PAT mit read-only auf moritzdemmerCode/no)"; exit 1
fi

echo "==> Lade LLM Provisioning-Script ..."
curl -fsSL -H "Authorization: Bearer ${GH_TOKEN}" -L "$RAW_URL" -o /tmp/llm_provision.sh

chmod +x /tmp/llm_provision.sh
exec /bin/bash /tmp/llm_provision.sh
