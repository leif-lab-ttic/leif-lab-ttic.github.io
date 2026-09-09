# Scripts

Helper scripts for working on the site locally and shipping changes. Run all of them from the
repository root (or anywhere — each script `cd`s to the repo root itself).

## `serve.sh`

Starts a local Jekyll dev server with live reload.

```sh
./scripts/serve.sh          # http://localhost:4000
./scripts/serve.sh 3000     # custom port
```

Installs gems via `bundle install` automatically on first run (needs Ruby + Bundler:
`gem install bundler`).

## `test.sh`

Builds the site and runs [html-proofer](https://github.com/gjtorikian/html-proofer) over the
output to catch broken internal links, missing images/scripts, and invalid HTML. External links
are not checked (no network calls), so this is fast and safe to run offline.

```sh
./scripts/test.sh
```

Run this before deploying, or any time you want to sanity-check an edit.

## `deploy.sh`

Publishes the site by pushing to `main`. This repo is a `<user>.github.io` repo, so GitHub Pages
builds and serves the Jekyll site straight from `main` — there's no separate build/publish branch.

```sh
./scripts/deploy.sh
```

The script refuses to run if:
- you're not on the `main` branch, or
- you have uncommitted changes (commit or stash first).

It then runs `test.sh` and, if that passes, pushes to `origin/main`. GitHub rebuilds the live site
automatically within a minute or two of the push.
