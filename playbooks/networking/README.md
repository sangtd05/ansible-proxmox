# Networking Playbooks

Network configuration playbooks for VMs.

## Commands

### Set static IP

```bash
# Set static IP for all VMs in the vms group
podman-compose exec ansible ansible-playbook playbooks/networking/set_static_ip.yml

# Set static IP for a specific VM
podman-compose exec ansible ansible-playbook playbooks/networking/set_static_ip.yml -l k8s-manager
```

## Description

The `set_static_ip.yml` playbook will:
- Auto-detect the primary network interface (no hardcoding)
- Preserve the VM's current IP
- Configure the gateway
- Configure DNS (8.8.8.8 and 1.1.1.1)
- Back up the existing config before making changes
- Apply netplan

## Parameters

| Variable | Default | Description |
|----------|---------|-------------|
| gateway | your gateway | Default gateway |
| dns_servers | 8.8.8.8, 1.1.1.1 | DNS servers |
