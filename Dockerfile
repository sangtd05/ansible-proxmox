FROM python:3.12-slim

RUN pip install --no-cache-dir \
    ansible==10.7.0 \
    proxmoxer==2.2.0 \
    && apt-get update \
    && apt-get install -y --no-install-recommends openssh-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ansible
