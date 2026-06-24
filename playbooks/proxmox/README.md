# Proxmox Playbooks

Các playbook quản lý VM trên Proxmox.

## Commands

### Tạo VM mới

```bash
# Tạo VM với tham số mặc định (2GB RAM, 2 cores, 20GB disk)
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=101 -e vm_name=ubuntu-server

# Tạo VM với tham số tùy chỉnh
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=102 -e vm_name=big-vm -e vm_memory=8192 -e vm_cores=4 -e vm_disk_size=50

# Tạo VM với ISO khác
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=103 -e vm_name=custom-vm -e vm_iso=custom-ubuntu.iso
```

### List tất cả VM

```bash
podman-compose exec ansible ansible-playbook playbooks/proxmox/list_vms.yml
```

### Xóa VM

```bash
podman-compose exec ansible ansible-playbook playbooks/proxmox/delete_vm.yml -e vm_id=101
```

## Tham số

| Biến | Mặc định | Mô tả |
|------|----------|-------|
| vm_id | (bắt buộc) | ID của VM |
| vm_name | (bắt buộc) | Tên VM |
| vm_memory | 2048 | RAM (MB) |
| vm_cores | 2 | Số cores |
| vm_disk_size | 20 | Disk (GB, chỉ số) |
| vm_iso | ubuntu-24.04.3-live-server-amd64.iso | File ISO trên storage local |
