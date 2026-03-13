#!/usr/bin/env bash
set -e

cd "$(git rev-parse --show-toplevel)"

echo "=== Git Sync Starting ==="

git status

git add -A

if git diff --cached --quiet; then
    echo "No changes to commit"
else
    git commit -m "${1:-sync: $(date -u +"%Y-%m-%dT%H:%M:%SZ")}"
fi

git pull --rebase origin main
git push origin main

echo "=== Sync Complete ==="
git log -1 --oneline
