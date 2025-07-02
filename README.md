# 🐳 Ansible Docker Image

[![Publish Docker Image](https://github.com/thaitype/ansible/actions/workflows/publish-image.yml/badge.svg?branch=latest)](https://github.com/thaitype/ansible/actions/workflows/publish-image.yml)

A lightweight, production-ready Ansible CLI environment built with Python 3.13 and Alpine.  
Supports `ansible` and `pywinrm` out of the box, ready for managing Linux and Windows hosts via SSH or WinRM.

## 📦 Features

- 🔧 Based on `python:3.13-alpine`
- 📦 Bundled tools:
  - [ansible](https://docs.ansible.com/) (via pip)
  - [pywinrm](https://pypi.org/project/pywinrm/) (for Windows remote management)
  - `sshpass`, `openssl`, and common build tools

## 🚀 Getting Started

### 🐙 Pull the Image

```bash
docker pull ghcr.io/thaitype/ansible:latest
````

Or use it directly:

```bash
docker run --rm -it ghcr.io/thaitype/ansible:latest ansible --version
```

## ⚙️ Usage Examples

### Run Ansible Playbook from Current Directory

```bash
docker run --rm -it -v $(pwd):/work -w /work --entrypoint ansible-playbook ghcr.io/thaitype/ansible playbook.yml
```

### Run Against Windows Hosts (via pywinrm)

Ensure your playbook is configured with `connection: winrm` and correct credentials.

## 🧪 Development & CI

### Local Build

To build the image locally:

```bash
docker build . \
  --build-arg ANSIBLE_VERSION=11.7.0 \
  --build-arg PYWINRM_VERSION=0.5.0 \
  --tag thaitype/ansible:dev
```

## 🖥️ Supported Architectures

This image is built and published for the following platforms:

- `linux/amd64` – standard x86_64 machines (most desktops, laptops, and cloud VMs)
- `linux/arm64` – ARM-based systems (e.g., Apple Silicon Macs, Raspberry Pi 4, AWS Graviton)

> Multi-arch support is enabled via Docker Buildx and GitHub Actions.
>
> The appropriate image is pulled automatically based on your host architecture.

### GitHub Actions

This image is built and published automatically using [GitHub Actions](.github/workflows/publish-image.yml) whenever changes are pushed to the `latest` branch.

* ✅ Pushes to [GitHub Container Registry](https://ghcr.io/)
* 🛠 Supports multi-platform builds: `linux/amd64` and `linux/arm64`
* 🔐 Uses versioned `build-args` for repeatable builds

## 📁 File Structure

```
/ansible
│
├── Dockerfile               # Builds the Ansible environment
├── README.md                # You are here!
└── .github/
    └── workflows/
        └── publish-image.yml   # GitHub Actions CI pipeline
```

## 👤 Author

Created and maintained by [Thada Wangthammang (mildronize)](https://github.com/mildronize)

## 📄 License

MIT License — free for personal and commercial use.
