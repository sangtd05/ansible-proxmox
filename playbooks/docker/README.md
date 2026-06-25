# Docker Installation

Install Docker CE on target VMs.

## Commands

```bash
# Install Docker on all docker_hosts (mariadb, redis)
podman-compose exec ansible ansible-playbook playbooks/docker/install.yml

# Install Docker on a specific host
podman-compose exec ansible ansible-playbook playbooks/docker/install.yml -l mariadb
```

## Description

The playbook will:
- Remove old Docker packages if present (docker.io, docker-engine, etc.)
- Install dependencies
- Add Docker GPG key and official repository
- Install Docker CE, CLI, containerd, buildx, and compose plugin
- Enable Docker service
- Add user `heno` to the `docker` group

## Target hosts

Group `docker_hosts` in inventory (currently: mariadb, redis).
