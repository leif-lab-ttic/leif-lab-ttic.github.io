#!/usr/bin/env bash
# Runs the test suite, then commits and pushes to main so GitHub Pages rebuilds the site.
set -euo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$BRANCH" != "main" ]]; then
  echo "Refusing to deploy from branch '$BRANCH'. Switch to 'main' first." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree has uncommitted changes:" >&2
  git status --short >&2
  echo "Commit or stash them before deploying." >&2
  exit 1
fi

echo "Running tests..."
"$REPO_ROOT/scripts/test.sh"

echo "Pushing to origin/main..."
git push origin main

echo "Pushed. GitHub Pages will rebuild the site automatically in a minute or two."
