# Ansible Proxmox

Quản lý hạ tầng Proxmox bằng Ansible chạy trong Docker.

## Setup

```bash
cp .env.example .env
# Sửa .env với thông tin Proxmox thực tế
```

## Sử dụng

Tạo VM:
```bash
docker compose run --rm ansible playbooks/create_vm.yml \
  -e vm_id=100 -e vm_name=test-vm -e vm_memory=4096 -e vm_cores=2
```

List VM:
```bash
docker compose run --rm ansible playbooks/list_vms.yml
```

## Cấu trúc

```
.
├── docker-compose.yml
├── Dockerfile
├── ansible.cfg
├── inventory/
│   └── hosts.yml
├── playbooks/
│   ├── create_vm.yml
│   └── list_vms.yml
├── group_vars/
│   └── proxmox.yml
└── roles/
```
