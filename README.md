# Ansible Role Consul

This role installs [Hashicorp Nomad](https://www.nomadproject.io/).

## Requirements

- Version of the ansible for installation: >=2.8
- Supported OS:
  - Ubuntu
    - 18.04
    - 20.04

## Role Variables

- defaults:
  - `NOMAD_VERSION` \
    Version to install. Defualt: `1.1.4`
  - `NOMAD_DOWNLOAD_PATH` \
    Nomad download URL. Default: `https://releases.hashicorp.com/nomad/{{ NOMAD_VERSION }}/nomad_{{ NOMAD_VERSION }}_linux_amd64.zip`

## Example Playbook

```yaml
- name: Converge
  hosts: nomad
  roles:
    - role: ansible-nomad
```

## License

BSD

## Author Information

- René Gärtner
