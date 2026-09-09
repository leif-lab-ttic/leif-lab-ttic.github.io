#!/usr/bin/env bash
# Builds the site and checks it for broken links, missing images, and HTML errors.
set -euo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler is required. Install it with: gem install bundler" >&2
  exit 1
fi

if [[ ! -f Gemfile.lock ]]; then
  bundle install
fi

DEST="_site_test"
rm -rf "$DEST"

echo "Building site..."
bundle exec jekyll build --destination "$DEST"

echo "Checking links, images, and HTML..."
bundle exec htmlproofer "$DEST" \
  --disable-external \
  --allow-hash-href \
  --ignore-urls "/^http/"

rm -rf "$DEST"
echo "All checks passed."
