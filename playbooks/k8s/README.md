# Kubernetes Cluster Setup

Bootstrap a Kubernetes cluster (1 master + 1 worker) using kubeadm.

## Architecture

- **Master**: k8s-manager
- **Worker**: k8s-worker
- **Kubernetes version**: 1.31
- **CNI**: Flannel
- **Pod CIDR**: 10.244.0.0/16
- **Service CIDR**: 10.96.0.0/12

## Commands

```bash
# 1. Prepare all nodes (disable swap, install kubeadm/kubelet/kubectl)
podman-compose exec ansible ansible-playbook playbooks/k8s/prepare.yml

# 2. Initialize the master node
podman-compose exec ansible ansible-playbook playbooks/k8s/init-master.yml

# 3. Join the worker to the cluster
podman-compose exec ansible ansible-playbook playbooks/k8s/join-worker.yml
```

## Verify

```bash
# SSH into master
ssh user@host

# Check nodes
kubectl get nodes

# Check pods
kubectl get pods -A
```

## Notes

- Swap is disabled automatically
- Kernel modules (overlay, br_netfilter) are loaded
- Sysctl parameters are set for networking
- Kubeconfig is copied to /home/heno/.kube/config
