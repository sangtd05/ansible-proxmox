# Kubernetes Cluster Setup

Setup Kubernetes cluster 1 master + 1 worker bằng kubeadm.

## Architecture

- **Master**: k8s-manager
- **Worker**: k8s-worker
- **Kubernetes version**: 1.31
- **CNI**: Flannel
- **Pod CIDR**: 10.244.0.0/16
- **Service CIDR**: 10.96.0.0/12

## Commands

```bash
# 1. Chuẩn bị tất cả nodes (tắt swap, cài kubeadm/kubelet/kubectl)
podman-compose exec ansible ansible-playbook playbooks/k8s/prepare.yml

# 2. Khởi tạo master node
podman-compose exec ansible ansible-playbook playbooks/k8s/init-master.yml

# 3. Join worker vào cluster
podman-compose exec ansible ansible-playbook playbooks/k8s/join-worker.yml
```

## Verify

```bash
# SSH vào master
ssh user@host

# Kiểm tra nodes
kubectl get nodes

# Kiểm tra pods
kubectl get pods -A
```

## Notes

- Swap đã được tắt tự động
- Kernel modules (overlay, br_netfilter) được load
- Sysctl parameters được set cho networking
- Kubeconfig được copy vào /home/heno/.kube/config
