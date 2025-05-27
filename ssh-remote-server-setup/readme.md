# 🚀 Remote Linux Server Setup with SSH Access

This project is part of my DevOps learning journey and focuses on setting up a remote Linux server with secure SSH access. It also includes configuring multiple SSH keys and optionally securing the server with `fail2ban` to prevent brute-force attacks.

> ✅ Project from [roadmap.sh DevOps Projects – SSH Remote Server Setup](https://roadmap.sh/projects)

---

## 📌 Goal

* Provision a remote Linux server.
* Generate and configure **two** SSH key pairs.
* Connect to the server using both keys.
* Configure SSH client shortcuts via `~/.ssh/config`.
* (Optional) Harden the server using `fail2ban`.

---

## 🖥️ Environment

* **Server Provider:** DigitalOcean (you may also use AWS, Linode, etc.)
* **Server OS:** Ubuntu 22.04 LTS
* **Local OS:** macOS/Linux (any Unix-like terminal)
* **SSH Keys Used:** RSA 4096-bit

---

## ✅ Steps Taken

### 1. Create a Remote Linux Server

1. Sign up at your VPS provider (I used [DigitalOcean](https://www.digitalocean.com/)).
2. Launch a droplet:

   * Image: Ubuntu 22.04 LTS
   * Plan: Basic shared CPU
   * Authentication: Use your first SSH public key or start with a password

📌 **Note your server’s public IP address** and default username (e.g., `root` for DigitalOcean).

---

### 2. Generate Two SSH Key Pairs

On your local machine:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/key1 -C "Key 1 for my server"
ssh-keygen -t rsa -b 4096 -f ~/.ssh/key2 -C "Key 2 for my server"
```

This creates:

* `~/.ssh/key1` and `~/.ssh/key1.pub`
* `~/.ssh/key2` and `~/.ssh/key2.pub`

---

### 3. Add Both Keys to the Server

Use one of the following methods to add both **public keys** to the server.

#### Option A: Use `ssh-copy-id`

```bash
ssh-copy-id -i ~/.ssh/key1.pub user@server-ip
ssh-copy-id -i ~/.ssh/key2.pub user@server-ip
```

#### Option B: Manual Method

1. SSH into the server using password or existing key:

```bash
ssh user@server-ip
```

2. On the server:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Append both public keys
echo "PASTE CONTENT OF key1.pub" >> ~/.ssh/authorized_keys
echo "PASTE CONTENT OF key2.pub" >> ~/.ssh/authorized_keys

chmod 600 ~/.ssh/authorized_keys
```

---

### 4. Connect to Server Using Both Keys

On your local machine:

```bash
ssh -i ~/.ssh/key1 user@server-ip
ssh -i ~/.ssh/key2 user@server-ip
```

✅ You should be able to connect successfully using either private key.

---

### 5. Configure SSH Aliases for Simpler Access

Edit your SSH config:

```bash
nano ~/.ssh/config
```

Add:

```
Host myserver-key1
    HostName server-ip
    User user
    IdentityFile ~/.ssh/key1

Host myserver-key2
    HostName server-ip
    User user
    IdentityFile ~/.ssh/key2
```

✅ You can now connect with:

```bash
ssh myserver-key1
ssh myserver-key2
```

---

## 🔐 (Optional) Stretch Goal: Install and Configure Fail2ban

This helps secure your server from brute-force attacks.

### 1. Install `fail2ban`

```bash
sudo apt update
sudo apt install fail2ban -y
```

### 2. Create Local Jail Config

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Edit the jail configuration:

```bash
sudo nano /etc/fail2ban/jail.local
```

Add or modify the following:

```
[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log
backend = systemd
maxretry = 5
bantime = 600
findtime = 600
```

### 3. Restart and Enable `fail2ban`

```bash
sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
```

### 4. Verify It's Working

```bash
sudo fail2ban-client status sshd
```

✅ This should show active bans after failed login attempts.

---

## ⚠️ Security Note

**DO NOT** commit your private key files to any repository.
Ensure your `.gitignore` includes:

```
*.pem
*.key
*.pub
*.crt
*.ssh
```

---

## 🧠 What I Learned

* Provisioning and configuring a basic Linux server
* SSH key generation and access control
* Custom SSH aliases for productivity
* Basic server security hardening with `fail2ban`

---

## 📫 Contact

Feel free to reach out if you want to collaborate or have questions!

**Mercy**
📧 [mercysam299@gmail.com](mailto:mercysam299@gmail.com)

