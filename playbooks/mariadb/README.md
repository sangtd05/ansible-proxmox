# MariaDB 11.8 Deployment

Deploy MariaDB 11.8 trên Docker.

## Commands

```bash
# Deploy MariaDB
podman-compose exec ansible ansible-playbook playbooks/mariadb/deploy.yml

# Deploy với custom password
podman-compose exec ansible ansible-playbook playbooks/mariadb/deploy.yml \
  -e mariadb_root_password=custom_root_pass \
  -e mariadb_password=custom_user_pass
```

## Thông tin kết nối

- **Host**: 192.168.2.141:3306
- **Root password**: mariadb123
- **Database**: app_db
- **User**: app_user
- **User password**: appuser123
- **Data directory**: /opt/mariadb/data

## Kết nối từ xa

```bash
mysql -h 192.168.2.141 -u app_user -p app_db
# hoặc root
mysql -h 192.168.2.141 -u root -p
```

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| mariadb_root_password | mariadb123 | Root password |
| mariadb_database | app_db | Database name |
| mariadb_user | app_user | Database user |
| mariadb_password | appuser123 | User password |
| mariadb_port | 3306 | Port mapping |
| mariadb_data_dir | /opt/mariadb/data | Data volume path |
| mariadb_image | mariadb:11.8 | Docker image |
