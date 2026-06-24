# Ansible Heno

Quản lý hạ tầng Proxmox và các service bằng Ansible chạy trong podman-compose.

## Setup

```bash
cp .env.example .env
# Sửa .env với thông tin Proxmox thực tế
podman-compose up -d
```

## Sử dụng

Exec vào container để chạy playbook:

```bash
podman-compose exec ansible ansible-playbook playbooks/<category>/<playbook>.yml
```

Mỗi thư mục trong `playbooks/` có README riêng với hướng dẫn chi tiết.

## Playbooks

- **proxmox/** - Quản lý VM trên Proxmox (tạo, xóa, list)
- **networking/** - Cấu hình static IP cho VMs
- **docker/** - Cài đặt Docker CE
- **mariadb/** - Deploy MariaDB trên Docker
- **redis/** - Deploy Redis trên Docker
- **k8s/** - Setup Kubernetes cluster (kubeadm)
- **traefik/** - Cài đặt Traefik Ingress Controller
- **argocd/** - Cài đặt ArgoCD cho GitOps

## Cấu trúc

```
.
├── docker-compose.yml
├── ansible.cfg
├── .env.example
├── inventory/
│   └── hosts.yml
└── playbooks/
    ├── proxmox/
    ├── networking/
    ├── docker/
    ├── mariadb/
    ├── redis/
    ├── k8s/
    ├── traefik/
    └── argocd/
```
