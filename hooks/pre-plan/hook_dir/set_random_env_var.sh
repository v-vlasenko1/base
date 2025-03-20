#!/bin/bash

set -e

chmod -R +x $SCALR_HOOK_DIR
cd "/opt/data/hook-v0ona2717ua3ljb4e"
chmod +x set_random_env_var.sh
chmod +x export_env_vars_to_file.sh
chmod +x ./nested/install_jq_and_parse_response.sh
./set_random_env_var.sh
cd "/opt/workdir"

# Generate a random value (1 or 0)
export ALLOW_RUN=$((RANDOM % 2))

echo "Pre-plan hook: Setting ALLOW_RUN=$ALLOW_RUN"

echo "Calling $SCALR_HOOK_DIR/export_env_vars_to_file.sh..."
"$SCALR_HOOK_DIR/export_env_vars_to_files.sh"
