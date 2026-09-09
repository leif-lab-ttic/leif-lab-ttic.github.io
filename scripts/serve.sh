#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-4000}"
REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO_ROOT"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler is required. Install it with: gem install bundler" >&2
  exit 1
fi

if [[ ! -f Gemfile.lock ]]; then
  bundle install
fi

printf 'Starting local Jekyll server at http://localhost:%s\n' "$PORT"
bundle exec jekyll serve --livereload --port "$PORT"
