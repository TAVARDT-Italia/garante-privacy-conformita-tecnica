#!/usr/bin/env bash
set -euo pipefail

DOMINIO="${2:-}"
if [[ -z "$DOMINIO" ]]; then
    echo "Uso: $0 --dominio <azienda.it>"
    exit 1
fi

echo "[TAVARDT Italia] Avvio dell'audit tecnico per: ${DOMINIO}"

echo "[*] Verifica intestazioni di sicurezza HTTP..."
curl -s -I "https://${DOMINIO}" | grep -Ei "^(strict-transport-security|content-security-policy|x-content-type-options|x-frame-options)" || true

echo "[*] Scansione file sensibili esposti..."
for path in ".env" ".git/HEAD" "database.sql"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://${DOMINIO}/${path}" || echo "000")
    if [[ "$code" == "200" ]]; then
        echo "  [PERICOLO] File esposto: /${path} (HTTP 200)"
    else
        echo "  [SICURO] /${path} (HTTP ${code})"
    fi
done

echo "[TAVARDT Italia] Verifica completata. Report avanzato su https://tools.tavardt.com/it/"
