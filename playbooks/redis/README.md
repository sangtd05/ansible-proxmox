# Redis 7.4 Deployment

Deploy Redis 7.4 trên Docker.

## Commands

```bash
# Deploy Redis
podman-compose exec ansible ansible-playbook playbooks/redis/deploy.yml

# Deploy với custom config
podman-compose exec ansible ansible-playbook playbooks/redis/deploy.yml \
  -e redis_password=custom_pass \
  -e redis_maxmemory=2gb
```

## Thông tin kết nối

- **Host**: IP:6379
- **Password**: redis123
- **Max memory**: 1gb
- **Data directory**: /opt/redis/data
- **Config file**: /opt/redis/conf/redis.conf

## Kết nối từ xa

```bash
# Redis CLI
redis-cli -h IP -p 6379 -a redis123

# Hoặc dùng docker exec trên redis host
ssh user@IP
docker exec -it redis redis-cli -a redis123
```

## Cấu hình

Redis được cấu hình với:
- **bind**: 0.0.0.0 (cho phép kết nối từ xa)
- **requirepass**: redis123
- **maxmemory**: 1gb
- **maxmemory-policy**: allkeys-lru (evict khi đầy memory)
- **appendonly**: yes (AOF persistence)
- **appendfsync**: everysec

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| redis_password | redis123 | Redis password |
| redis_port | 6379 | Port mapping |
| redis_maxmemory | 1gb | Max memory |
| redis_data_dir | /opt/redis/data | Data volume path |
| redis_config_dir | /opt/redis/conf | Config directory |
| redis_image | redis:7.4 | Docker image |
