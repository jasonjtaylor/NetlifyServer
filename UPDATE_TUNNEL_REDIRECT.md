# Update Netlify redirect when you get a new tunnel URL

**When:** You ran `./start-tunnel.sh` and have a new `https://...trycloudflare.com` URL (e.g. after restarting the tunnel).

**Option 1 – Composer (Cmd + I)**  
Paste this prompt and replace the bracketed part with your actual URL:

```
I need to update my Netlify redirect to use a new Cloudflare tunnel URL. Please perform these steps:

Open netlify.toml.
Find the [[redirects]] block. Remove any existing comments (#) so it is active.
Set the to field to [PASTE YOUR CLOUDFLARE URL HERE].
Add force = true to that redirect block if it isn't there.
After the file is saved, please commit this change with the message 'update tunnel redirect' and push it to the main branch.
```

**Option 2 – Manual**  
1. Open `netlify.toml`.  
2. Uncomment the `[[redirects]]` block (remove the `#` from the four lines).  
3. Set `to = "https://your-actual-url.trycloudflare.com/"`.  
4. Run: `git add netlify.toml && git commit -m "update tunnel redirect" && git push`

---

**Note:** We use `status = 302` (redirect). The user’s browser is sent to the tunnel URL; the address bar changes to the Cloudflare URL. `force = true` makes Netlify apply the redirect even when `index.html` exists.
