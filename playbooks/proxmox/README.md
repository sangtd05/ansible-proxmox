# Proxmox Playbooks

Manage VMs on Proxmox.

## Commands

### Create a new VM

```bash
# Create VM with default parameters (2GB RAM, 2 cores, 20GB disk)
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=101 -e vm_name=ubuntu-server

# Create VM with custom parameters
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=102 -e vm_name=big-vm -e vm_memory=8192 -e vm_cores=4 -e vm_disk_size=50

# Create VM with a different ISO
podman-compose exec ansible ansible-playbook playbooks/proxmox/create_vm.yml \
  -e vm_id=103 -e vm_name=custom-vm -e vm_iso=custom-ubuntu.iso
```

### List all VMs

```bash
podman-compose exec ansible ansible-playbook playbooks/proxmox/list_vms.yml
```

### Delete a VM

```bash
podman-compose exec ansible ansible-playbook playbooks/proxmox/delete_vm.yml -e vm_id=101
```

## Parameters

| Variable | Default | Description |
|----------|---------|-------------|
| vm_id | (required) | VM ID |
| vm_name | (required) | VM name |
| vm_memory | 2048 | RAM (MB) |
| vm_cores | 2 | Number of cores |
| vm_disk_size | 20 | Disk size (GB) |
| vm_iso | ubuntu-24.04.3-live-server-amd64.iso | ISO file on local storage |
