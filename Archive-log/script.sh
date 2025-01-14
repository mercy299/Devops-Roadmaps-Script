#!/bin/bash

[ -z "$1" ] && { echo "USAGE: log-archive <log-dir>"; exit 1; }
[ ! -d "$1" ] && { echo "$1 doesn't exist"; exit 1; }
[ ! -r "$1" ] && { echo "No permission to read $1"; exit 1; }

archive_name="$(basename "$1")_archive_$(date +'%Y%m%d_%H%M%S').tar.gz"
tar -czf "$archive_name" "$1" && echo "Created archive: $archive_name"
