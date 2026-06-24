# Ansible Proxmox

Quản lý hạ tầng Proxmox bằng Ansible chạy trong Docker/Podman.

## Setup

```bash
cp .env.example .env
# Sửa .env với thông tin Proxmox thực tế
```

## Sử dụng

Khởi động container (chỉ cần chạy 1 lần):

```bash
podman-compose up -d
```

Exec vào container để chạy playbook:

```bash
# Tạo VM
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=101 -e vm_name=test-vm -e vm_memory=4096 -e vm_cores=2

# Tạo VM với disk tùy chỉnh (đơn vị GB, không có chữ G)
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=102 -e vm_name=big-vm -e vm_memory=8192 -e vm_cores=4 -e vm_disk_size=50

# List tất cả VM
podman-compose exec ansible ansible-playbook playbooks/proxmox/list_vms.yml

# Xóa VM
podman-compose exec ansible ansible-playbook playbooks/proxmox/delete_vm.yml -e vm_id=101
```

Tắt container khi không dùng:

```bash
podman-compose down
```

## Cấu trúc

```
.
├── docker-compose.yml
├── ansible.cfg
├── .env.example
├── inventory/
│   └── hosts.yml
├── playbooks/
│   ├── proxmox/
│   │   ├── README.md
│   │   ├── create_vm.yml
│   │   ├── list_vms.yml
│   │   └── delete_vm.yml
│   ├── networking/
│   │   ├── README.md
│   │   ├── set_static_ip.yml
│   │   └── templates/
│   │       └── netplan.yaml.j2
│   ├── docker/
│   │   ├── README.md
│   │   └── install.yml
│   └── mariadb/
│       ├── README.md
│       └── deploy.yml
├── group_vars/
└── roles/
```

## Tham số tạo VM

Xem chi tiết tại [playbooks/proxmox/README.md](playbooks/proxmox/README.md)

## Cấu hình mạng

Set static IP cho các VM (giữ nguyên IP hiện tại, gateway 192.168.2.1, DNS 8.8.8.8/1.1.1.1):

```bash
# Tất cả VM
podman-compose exec ansible ansible-playbook playbooks/networking/set_static_ip.yml

# 1 VM cụ thể
podman-compose exec ansible ansible-playbook playbooks/networking/set_static_ip.yml -l k8s-manager
```

Xem chi tiết tại [playbooks/networking/README.md](playbooks/networking/README.md)
