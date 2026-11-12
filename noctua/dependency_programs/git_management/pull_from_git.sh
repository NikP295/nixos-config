#!/usr/bin/env bash
set -euo pipefail

cd /etc/nixos

echo "Syncing nixos config..."

git fetch origin
git reset --hard origin/main

echo "Big W!"


