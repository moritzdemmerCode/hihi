#!/bin/bash
set -euo pipefail

# 👉 Für reproduzierbare Setups lieber auf einen festen Commit pinnen:
RAW_URL="https://raw.githubusercontent.com/moritzdemmerCode/no/main/provision/provision.sh"

if [[ -z "${GH_TOKEN:-}" ]]; then
  echo "ERROR: GH_TOKEN fehlt (GitHub PAT mit read-only auf moritzdemmerCode/no)"; exit 1
fi

echo "==> Lade privates Provisioning-Script ..."
curl -fsSL -H "Authorization: Bearer ${GH_TOKEN}" -L "$RAW_URL" -o /tmp/provision.sh

chmod +x /tmp/provision.sh
exec /bin/bash /tmp/provision.sh

