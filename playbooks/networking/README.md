# Networking Playbooks

Các playbook cấu hình mạng cho VM.

## Commands

### Set static IP cho VM

```bash
# Set static IP cho tất cả VM trong group vms
podman-compose exec ansible ansible-playbook playbooks/networking/set_static_ip.yml

# Set static IP cho 1 VM cụ thể
podman-compose exec ansible ansible-playbook playbooks/networking/set_static_ip.yml -l k8s-manager
```

## Mô tả

Playbook `set_static_ip.yml` sẽ:
- Detect interface mạng chính động (không hardcode)
- Giữ nguyên IP hiện tại của VM
- Cấu hình gateway
- Cấu hình DNS 8.8.8.8 và 1.1.1.1
- Backup config cũ trước khi thay đổi
- Apply netplan

## Tham số

| Biến | Giá trị | Mô tả |
|------|---------|-------|
| gateway | your gateway | Default gateway |
| dns_servers | 8.8.8.8, 1.1.1.1 | DNS servers |
