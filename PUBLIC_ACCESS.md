# Making the TAK server reachable for visitors off your network

Netlify can only redirect to a **public** URL. Your server at `192.168.2.1:8446` is on your local network, so you need one of these:

---

## Option A: Cloudflare Tunnel (no router config)

1. **Install:** `brew install cloudflared`
2. **Run a quick tunnel** (run this on your Mac when the TAK server is running):
   ```bash
   cloudflared tunnel --url https://192.168.2.1:8446
   ```
   Or if the TAK server runs on this Mac: `cloudflared tunnel --url https://localhost:8446`
3. **Copy the URL** it prints (e.g. `https://xxxx-xx-xx.trycloudflare.com`).
4. **Give that URL** so it can be set in the Netlify redirect.  
   Note: Quick-tunnel URLs change each time you start the tunnel. For a stable URL, use a [named Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/).

---

## Option B: DuckDNS + port forwarding (stable hostname)

1. **Sign up** at [duckdns.org](https://www.duckdns.org), create a subdomain (e.g. `37sigs.duckdns.org`).
2. **Point it at your public IP** using their update script or a DDNS client so the hostname always points to your home IP.
3. **On your router:** Forward external port **8446** (TCP) to **192.168.2.1:8446** (or your Mac’s IP if the server is on the Mac).
4. **Your public URL:** `https://37sigs.duckdns.org:8446` — share this so it can be set in the Netlify redirect.

---

Once you have a public URL, it gets added to `netlify.toml` and the site will redirect visitors there.
