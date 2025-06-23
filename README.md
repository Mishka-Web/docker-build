# 🚀 Dev Stack: Docker Template for WordPress & Bitrix

Professional local development environment powered by Docker.

## 🧩 Features
- PHP 8.1 + FPM
- Nginx + MySQL + phpMyAdmin
- Xdebug + Composer preinstalled
- Bitrix & WordPress quick setup scripts
- Makefile + GitHub Actions CI

## 📁 Structure
See `.env`, `Makefile`, and `/scripts` folder

## 🧪 Quick Start

```bash
make install-wp
make up
```

Access: http://localhost:8000 (site), http://localhost:8081 (phpMyAdmin)

---

## 🪟 Windows Support

### Option 1: Run with Git Bash

```bash
./scripts/install-wordpress.sh
make up
```

### Option 2: Use CMD / PowerShell

```cmd
scripts\install-wordpress.bat
make install-wp
make up
```
