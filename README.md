# Ansible Heno

Infrastructure automation for a Proxmox-based homelab. Ansible runs inside a Podman container (via podman-compose) and manages VMs over SSH.

## Setup

```bash
cp .env.example .env
# Edit .env with actual Proxmox credentials
podman-compose up -d
```

## Usage

Exec into the container and run playbooks:

```bash
podman-compose exec ansible ansible-playbook playbooks/<category>/<playbook>.yml
```

Each directory under `playbooks/` has its own README with detailed instructions.

## GitOps

Kubernetes workloads (cert-manager, Traefik, metrics-server, Rancher) are managed via ArgoCD from a separate [gitops-heno](https://github.com/sangtd05/gitops) repository.

## Structure

```
.
├── docker-compose.yml
├── ansible.cfg
├── .env.example
├── inventory/
│   └── hosts.yml
└── playbooks/
    ├── ...
```
