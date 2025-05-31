
# 🌐 Static Website Deployment with Nginx & Rsync

This project walks through setting up a basic **web server using Nginx** to serve a **static website**, and using **rsync** to deploy updates from your local machine to a remote Linux server.

> ✅ **Goal**: Learn the basics of web server configuration, static site serving, and deployment using `rsync`.

---

## ✅ Project Requirements

### 1. 🖥️ Provision a Remote Linux Server

- Registered a VPS with **[provider name]** (e.g., DigitalOcean or AWS). N/B. We'd be using AWS

Register and setup a remote Linux server on AWS
Log in to your AWS account.

Go to the EC2 dashboard.

Click "Launch Instance."

Assign a name e.g. devops-project

Choose an Amazon Linux 2023 AMI or Amazon Linux 2 AMI (both free tier eligible).

Select t2.micro instance type (free tier eligible).

Create a new key pair, download it, and keep it safe.

Configure instance details (use default settings for now).

Configure security group:

Allow SSH (port 22) from your IP address.

Add storage (default 8GB is fine for this project).

Add tags (optional, but good practice).

Launch instance.


- Connected via SSH:

```bash
ssh -i key-name.pem ec2-user@your-instance-ip
````

---

### 2. 🔧 Install and Configure Nginx

Installed Nginx on the server:


```bash
sudo apt update
sudo apt install nginx -y
```

Verified Nginx is running:

```bash
sudo systemctl status nginx
```

Configured Nginx to serve a custom static site:

```bash
sudo nano /etc/nginx/sites-available/default
```

Updated the root path to point to the static site:

```nginx
server {
    listen 80 default_server;
    server_name _;

    root /var/www/html/static-site;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Reloaded Nginx:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

---

### 3. 💻 Create a Static Website Locally

Created a simple website in a `static-site/` folder:

```plaintext
static-site/
├── index.html
├── styles.css
└── images/
    └── banner.jpg
```

Example `index.html`:

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Static Site</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <h1>Welcome to My Static Site!</h1>
  <img src="images/banner.jpg" alt="Banner">
</body>
</html>
```

---

### 4. 🔁 Deploy with Rsync

Installed `rsync` (if not already available):

```bash
sudo apt install rsync
```

Created a deployment script `deploy.sh`:

```bash
#!/bin/bash

# Configuration
USER="your-ssh-username"
HOST="your-server-ip-or-domain"
REMOTE_DIR="/var/www/html/static-site"
LOCAL_DIR="./static-site"

# Deploy using rsync
echo "🚀 Deploying static site to $USER@$HOST..."
rsync -avz --delete "$LOCAL_DIR/" "$USER@$HOST:$REMOTE_DIR"

# Optional: reload nginx if needed (uncomment if required)
# ssh $USER@$HOST 'sudo systemctl reload nginx'

echo "✅ Deployment complete!"
```

Make the script executable:

```bash
chmod +x deploy.sh
```

Deploy your site:

```bash
./deploy.sh
```

---

### 5. 🌍 Optional: Domain Configuration

* If using a domain name:

  * Pointed domain’s **A record** to the server’s public IP via DNS settings.
  * Updated `server_name` in the Nginx config to match the domain.

Otherwise, the site is accessible via:

```
http://your-server-ip
```

---

## 📦 Folder Structure

```plaintext
.
├── static-site/
│   ├── index.html
│   ├── styles.css
│   └── images/
│       └── banner.jpg
└── deploy.sh
```

---

## ✅ What I Learned

* How to install and configure Nginx to serve static content.
* How to connect to and manage a remote Linux server via SSH.
* How to automate file deployment using `rsync`.
* How to optionally map a custom domain to a web server.

---