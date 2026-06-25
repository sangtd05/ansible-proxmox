# Traefik Ingress Controller

Install Traefik as the ingress controller for the Kubernetes cluster.

## Install

```bash
podman-compose exec ansible ansible-playbook playbooks/traefik/install.yml
```

## Access

After installation, Traefik is exposed via NodePort:

- **HTTP**: Port 31501 (may vary)
- **Dashboard**: http://IP:31501/dashboard/

## Configuration

The playbook installs Traefik with:
- Replicas: 1
- Service type: NodePort
- Dashboard: enabled
- Published service: enabled (for Ingress)

## Management

### Check status

```bash
kubectl get pods -n traefik
kubectl get svc -n traefik
```

### View logs

```bash
kubectl logs -n traefik deployment/traefik
```

### Upgrade

Re-run the playbook — Helm will upgrade the existing release.

### Uninstall

```bash
helm uninstall traefik -n traefik
kubectl delete namespace traefik
```

## Notes

- Traefik is installed via Helm chart version 28.0.0
- Dashboard is enabled by default — disable by editing values
- NodePort may change on reinstall — check with `kubectl get svc -n traefik`
