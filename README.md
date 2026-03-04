# ansible-playbooks

We want to share our ~recipes~ ansible playbooks, but not our sensitive data.

This repository `main` branch comes from the cleanup branch of our [private and archived repository](https://github.com/ISC-HEI/ansible-playbooks-archive).
The configuration part (inventory, users, passwords, files, keys, sensitive data) have been moved into *private* repository.

1. Install `ansible` (tested with v2.20)
1. clone the repository
1. copy setup.cfg.sample into setup.cfg
   * CONF_REPO_URL <- URL to be cloned for the configuration
   * VAULT_PASSWORD_FILE <- PATH to a file containing the vault password
1. configure setup.cfg
1. run ./_setup_playbooks.sh
1. add ssh host keys, after each inventory change: `ansible-playbook add_ssh_host_keys.yml`

## `conf`
`conf` is documented in [ansible-playbooks-sim](https://github.com/ISC-HEI/ansible-playbooks-sim?tab=readme-ov-file#conf-documentation).

## Usage
* When not specified, the playbooks are run against all host from the inventory. This can be changed using the extra variable `h`.

   `ansible-playbooks -e 'h=VALUE_OF_HOSTS_VARIABLE`, see the [ansible doc](https://docs.ansible.com/projects/ansible/latest/inventory_guide/intro_patterns.html#common-patterns).

* When not specified, the configuration directory is `./conf`. This can be changed using the extra variable `conf_dir`.

   `ansible-playbooks -e 'conf_dir=/somewhere/else`


* Playbooks:
  * `full.yml` : Do all standard configuration
  * `add_ssh_host_keys.yml` : Add ssh hosts keys to known hosts, should be run when a machine is added to the inventory.
  * `check_inventory_and_users.yml` : run a sanity check on `$conf_dir/users` and `$conf_dir/inventory`
  * `motd.yml` setup motd.
  * `test_today.yml` the WIP playbook.
