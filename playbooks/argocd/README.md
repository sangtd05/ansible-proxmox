# ArgoCD

Cài đặt ArgoCD để quản lý GitOps cho Kubernetes cluster.

## Cài đặt

```bash
podman-compose exec ansible ansible-playbook playbooks/argocd/install.yml
```

## Thông tin truy cập

Sau khi cài đặt, ArgoCD sẽ expose qua NodePort:

- **UI**: https://192.168.2.139:32136
- **Username**: admin
- **Password**: (hiển thị trong output của playbook)

**Lưu ý**: ArgoCD dùng self-signed certificate, cần chấp nhận khi truy cập lần đầu.

## Lấy lại password

Nếu cần lấy lại password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Các bước tiếp theo

Sau khi cài đặt ArgoCD, anh có thể:

1. **Truy cập UI**: Mở https://192.168.2.139:32136 và đăng nhập
2. **Add Git Repository**: Vào Settings → Repositories → Connect Repo
3. **Tạo Application**: Tạo Application để sync từ Git repo
4. **Cấu hình GitOps**: ArgoCD sẽ tự động sync và quản lý resources

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| argocd_namespace | argocd | Namespace cài đặt ArgoCD |
| argocd_version | v2.9.3 | Version ArgoCD |

## Quản lý

### Kiểm tra status

```bash
kubectl get pods -n argocd
kubectl get svc -n argocd
```

### Xem logs

```bash
kubectl logs -n argocd deployment/argocd-server
```

### Uninstall

```bash
kubectl delete namespace argocd
```

## Notes

- ArgoCD được cài từ manifest chính thức
- Server được expose qua NodePort
- Password được tạo tự động và lưu trong secret `argocd-initial-admin-secret`
