# ArgoCD

Install ArgoCD for GitOps management of the Kubernetes cluster.

## Install

```bash
podman-compose exec ansible ansible-playbook playbooks/argocd/install.yml
```

## Access

After installation, ArgoCD is exposed via NodePort:

- **UI**: https://your-host:32136
- **Username**: admin
- **Password**: (shown in playbook output)

**Note**: ArgoCD uses a self-signed certificate — accept it on first access.

## Retrieve password

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Next steps

1. **Access UI**: Open https://your-host:32136 and log in
2. **Add Git Repository**: Settings → Repositories → Connect Repo
3. **Create Application**: Create an Application to sync from the Git repo
4. **Configure GitOps**: ArgoCD will automatically sync and manage resources

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| argocd_namespace | argocd | Namespace for ArgoCD |
| argocd_version | v2.9.3 | ArgoCD version |

## Management

### Check status

```bash
kubectl get pods -n argocd
kubectl get svc -n argocd
```

### View logs

```bash
kubectl logs -n argocd deployment/argocd-server
```

### Uninstall

```bash
kubectl delete namespace argocd
```

## Notes

- ArgoCD is installed from the official manifest
- Server is exposed via NodePort
- Password is auto-generated and stored in secret `argocd-initial-admin-secret`
