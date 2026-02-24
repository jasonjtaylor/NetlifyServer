#!/usr/bin/env bash
# Start a Cloudflare quick tunnel to your TAK server so it's reachable from the internet.
# Keep this running while you want the server accessible.
# Copy the https://....trycloudflare.com URL it prints and put it in netlify.toml (redirect "to"), then push.

set -e
echo "Starting tunnel to https://192.168.2.1:8446 ..."
echo "Copy the URL it prints below into netlify.toml (redirect 'to'), then 'git push'."
echo ""
cloudflared tunnel --url https://192.168.2.1:8446
