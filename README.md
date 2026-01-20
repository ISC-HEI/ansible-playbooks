# ansible-playbooks

So we want to share our ~recipes~ ansible playbooks, but not our sensitive data.

This repository `main` branch comes from the cleanup branch of our [private and archived repository](https://github.com/ISC-HEI/ansible-playbooks-archive).
The configuration part (inventory, users, passwords, files, keys, sensitive data ) have been moved into *private* repository.

The expected format of the configuration will be documented here, until #1 is fixed.

1. clone the repo
1. copy setup.cfg.sample into setup.cfg
  * CONF_REPO_URL <- URL to be cloned for the configuration
  * VAULT_PASSWORD_FILE <- PATH to a file containing the vault password
1. configure setup.cfg
1. run ./setup.sh
