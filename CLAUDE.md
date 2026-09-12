# LEIF Lab Website — Project Guide

**Owner:** Will Merrill, Assistant Professor at TTIC  
**Deployed at:** merrill-lab.github.io (GitHub Pages, Jekyll)

## Project goal

Lightweight static website for Will's research group. Clean, minimal, academic in feel — not flashy or metric-heavy. Human-maintainable with or without an agent.

## Style

- Clean and minimal, more academic than techy
- Subtle idiosyncratic flair is welcome: Viking imagery, theoretical CS references, etc.
- Reference sites: aroraresearch-princeton.github.io, surbhigoel.com/group, rycolab.io, caplabnyu.github.io

## Content

- **Home** (`pages/index.html`): hero with lab name + acronym expansion in footer; lab overview paragraph + group photo; research interest cards; navbar title "LEIF Lab @ TTIC" links here
- **People** (`pages/people.html`): rendered from `_data/people.yml` — name, headshot, title per person
- **Publications** (`pages/publications.html`): rendered from `_data/publications.yml` — structured by year, then list of publications. Each pub has `title`, `link` (arXiv URL, used as title link), `authors` (list with `lab: true` to bold lab members, `et_al: true` for italic et al.), and `buttons` (list with `name`, `href`, `highlight: true` for dark blue accent button)
- **Teaching** (`pages/teaching.html`): stub
- **Blog** (`pages/blog.html`): stub

## Style notes

- All h1/h2/h3 headings render in `--brand-dark` (TTIC blue `#005494`)
- Publication titles are blue links (arXiv); no underline; lightens on hover
- Lab member authors are **bold** (not underlined, not blue)
- Year column is bold muted gray

## Technical

- Static HTML5 via Jekyll; deployed to GitHub Pages
- Keep it maintainable — a human should be able to update content quickly
- Test locally with `bundle exec jekyll serve`; deploy by pushing to `main`
- Brand colors configured in `_config.yml` (`brand_color`, `brand_color_dark`) and exposed as CSS vars `--brand` / `--brand-dark`
