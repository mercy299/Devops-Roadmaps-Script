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


# Replace your-ssh-username and your-server-ip-or-domain with your actual server SSH username and IP or domain.

# The --delete flag ensures any files deleted locally are also removed from the server.

# You can uncomment the last line to reload Nginx after deploying (if necessary).