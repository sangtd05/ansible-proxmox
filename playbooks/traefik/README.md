# Traefik Ingress Controller

Cài đặt Traefik làm ingress controller cho Kubernetes cluster.

## Cài đặt

```bash
podman-compose exec ansible ansible-playbook playbooks/traefik/install.yml
```

## Thông tin truy cập

Sau khi cài đặt, Traefik sẽ expose qua NodePort:

- **HTTP**: Port 31501 (có thể thay đổi)
- **Dashboard**: http://IP:31501/dashboard/

## Cấu hình

Playbook cài Traefik với các setting:
- Replicas: 1
- Service type: NodePort
- Dashboard: enabled
- Published service: enabled (cho Ingress)

## Quản lý

### Kiểm tra status
```bash
kubectl get pods -n traefik
kubectl get svc -n traefik
```

### Xem logs
```bash
kubectl logs -n traefik deployment/traefik
```

### Upgrade
Chạy lại playbook, Helm sẽ upgrade release hiện tại.

### Uninstall
```bash
helm uninstall traefik -n traefik
kubectl delete namespace traefik
```

## Notes

- Traefik được cài bằng Helm chart version 28.0.0
- Dashboard mặc định enabled, có thể disable bằng cách sửa values
- NodePort có thể thay đổi mỗi lần reinstall, check lại bằng `kubectl get svc -n traefik`
