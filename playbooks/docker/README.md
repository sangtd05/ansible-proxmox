# Docker Installation

Cài đặt Docker CE trên các VM.

## Commands

```bash
# Cài Docker cho mariadb và redis
podman-compose exec ansible ansible-playbook playbooks/docker/install.yml

# Cài Docker cho 1 host cụ thể
podman-compose exec ansible ansible-playbook playbooks/docker/install.yml -l mariadb
```

## Mô tả

Playbook sẽ:
- Gỡ Docker cũ nếu có (docker.io, docker-engine, etc.)
- Cài đặt dependencies
- Thêm Docker GPG key và repository chính thức
- Cài Docker CE, CLI, containerd, buildx, compose plugin
- Enable Docker service
- Thêm user `heno` vào group `docker`

## Target hosts

Group `docker_hosts` trong inventory (hiện tại: mariadb, redis).
