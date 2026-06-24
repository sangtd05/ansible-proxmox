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
    └── k8s/
```
