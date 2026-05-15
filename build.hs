#!/bin/bash
# Render runs this before deploying your static site.
# It reads SUPABASE_URL and SUPABASE_KEY from Render's Environment Variables
# and injects them into the HTML file — so your keys never live in code.

set -e  # stop if anything errors

echo "🔧 Injecting Supabase config into index.html..."

# Make sure both env vars are set
if [ -z "$SUPABASE_URL" ]; then
  echo "❌ ERROR: SUPABASE_URL environment variable is not set."
  exit 1
fi

if [ -z "$SUPABASE_KEY" ]; then
  echo "❌ ERROR: SUPABASE_KEY environment variable is not set."
  exit 1
fi

# Replace the placeholder tokens with the real values
sed -i "s|__SUPABASE_URL__|${SUPABASE_URL}|g" index.html
sed -i "s|__SUPABASE_KEY__|${SUPABASE_KEY}|g" index.html

echo "✅ Done. Supabase config injected successfully."
