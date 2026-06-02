#!/bin/bash
# Render Build Script — runs before the app is served
# Set SUPABASE_URL and SUPABASE_KEY in Render → Environment Variables
# This script replaces the placeholders in the HTML with the real values.

set -e

echo "Injecting Supabase credentials..."

if [ -z "$SUPABASE_URL" ]; then
  echo "WARNING: SUPABASE_URL is not set. App will run in localStorage-only mode."
else
  sed -i "s|SUPABASE_URL_PLACEHOLDER|${SUPABASE_URL}|g" index.html
  echo "SUPABASE_URL injected."
fi

if [ -z "$SUPABASE_KEY" ]; then
  echo "WARNING: SUPABASE_KEY is not set. App will run in localStorage-only mode."
else
  sed -i "s|SUPABASE_KEY_PLACEHOLDER|${SUPABASE_KEY}|g" index.html
  echo "SUPABASE_KEY injected."
fi

echo "Build complete."
