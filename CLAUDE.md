# Merrill Lab Website — Project Guide

**Owner:** Will Merrill, Assistant Professor at TTIC  
**Deployed at:** merrill-lab.github.io (GitHub Pages, Jekyll)

## Project goal

Lightweight static website for Will's research group. Clean, minimal, academic in feel — not flashy or metric-heavy. Human-maintainable with or without an agent.

## Style

- Clean and minimal, more academic than techy
- Subtle idiosyncratic flair is welcome: Viking imagery, theoretical CS references, etc.
- Reference sites: aroraresearch-princeton.github.io, surbhigoel.com/group, rycolab.io, caplabnyu.github.io

## Content

- **Home** (`index.html`): lab overview paragraph + group photo; navbar title "Merrill Lab @ TTIC" links here
- **People**: name, headshot, title per person
- **Publications**: list of group publications
- **Teaching**: stub
- **Blog**: stub

## Technical

- Static HTML5 via Jekyll; deployed to GitHub Pages
- Keep it maintainable — a human should be able to update content quickly
- Test locally with `bundle exec jekyll serve`; deploy by pushing to `main`
