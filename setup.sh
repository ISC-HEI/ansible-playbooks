#!/bin/bash
#############################################################################
#
# \brief configure this repository
#
# Copyright (c) 2025 Marc Pignat
# SPDX-License-Identifier:      Apache-2.0
# License-Filename: LICENSE
#
#############################################################################

CONFIG_FILE='setup.cfg'

if [ ! -f "$CONFIG_FILE" ]; then
        >&2 echo "configuration file $CONFIG_FILE not found"
        >&2 echo "here is a sample configuration file : $CONFIG_FILE.sample"
        exit 1
fi

# shellcheck source=/dev/null
source "$CONFIG_FILE"

if [ -z "${CONF_REPO_URL}" ]; then
  >&2 echo "Please configure CONF_REPO_URL in the configuration file $CONFIG_FILE"
  >&2 echo "here is a sample configuration file : $CONFIG_FILE.sample"
  exit 1
fi

if [ -z "${VAULT_PASSWORD_FILE}" ]; then
  >&2 echo "Please configure VAULT_PASSWORD_FILE in the configuration file $CONFIG_FILE"
  >&2 echo "here is a sample configuration file : $CONFIG_FILE.sample"
  exit 1
fi

git clone "$CONF_REPO_URL" conf

cat > ansible.cfg << EOF
[defaults]
inventory=conf/inventory
vault_password_file=$VAULT_PASSWORD_FILE
interpreter_python=auto_silent
EOF
