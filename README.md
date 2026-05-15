# Galatia's Security Progress Tracker — Deploy Guide

## Files in this repo
| File | Purpose |
|------|---------|
| `index.html` | The full app — contains `__SUPABASE_URL__` and `__SUPABASE_KEY__` placeholders |
| `build.sh` | Render runs this at deploy time to inject your real keys |
| `supabase_setup.sql` | Run once in Supabase SQL Editor to create your tables |

---

## Step 1 — Supabase (already done if you ran the SQL)
1. Go to your Supabase project → **Settings → API**
2. Copy your **Project URL** (e.g. `https://abcxyz.supabase.co`)
3. Copy your **anon / public** key (the `eyJ...` string)

---

## Step 2 — GitHub repo
Push all three files to a GitHub repo (can be private):
```
index.html
build.sh
supabase_setup.sql   ← optional, just for reference
```

---

## Step 3 — Render static site
1. [render.com](https://render.com) → **New +** → **Static Site**
2. Connect your GitHub repo
3. Set these fields:
   - **Branch:** `main`
   - **Build Command:** `bash build.sh`
   - **Publish Directory:** `.`
4. Before clicking Create, scroll to **Environment Variables** and add:
   - `SUPABASE_URL` → your Supabase Project URL
   - `SUPABASE_KEY` → your Supabase anon/public key
5. Click **Create Static Site**

Render injects the keys during build, serves the output — your keys never appear in the deployed file's source.

---

## Updating the app
Push a new `index.html` to GitHub → Render auto-redeploys with keys injected.

## Rotating keys
Update the Environment Variable in Render → **Manual Deploy** → done.
