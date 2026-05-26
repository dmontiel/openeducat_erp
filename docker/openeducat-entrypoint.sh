#!/bin/bash
set -euo pipefail

: "${ODOO_MASTER_PASSWORD:?Set ODOO_MASTER_PASSWORD}"

runtime_config=/tmp/odoo.conf
cp /etc/odoo/odoo.conf "$runtime_config"
printf "\nadmin_passwd = %s\n" "$ODOO_MASTER_PASSWORD" >> "$runtime_config"

exec /entrypoint.sh "$@" --config="$runtime_config"
