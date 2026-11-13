# LEIF Lab Website — Project Guide

**Owner:** Will Merrill, Assistant Professor at TTIC  
**Deployed at:** leif-lab-ttic.github.io (GitHub Pages, Jekyll)

## Project goal

Lightweight static website for Will's research group. Clean, minimal, academic in feel — not flashy or metric-heavy. Human-maintainable with or without an agent.

## Style

- Clean and minimal, more academic than techy. Think manuscript, not SaaS landing page.
- Subtle idiosyncratic flair is welcome: Viking imagery, theoretical CS references, etc. — but the identity should come from typography, color, and the logo, not extra ornament.
- Reference sites: aroraresearch-princeton.github.io, surbhigoel.com/group, rycolab.io, caplabnyu.github.io

### Design rules (from the Nov 2026 redesign)

- **No template chrome:** no cards/boxes with shadows, no pill buttons, no hover lifts, no tracked all-caps "eyebrow" labels, no CTA buttons, no sticky/blurred navbar. One heading per page (e.g. "People", not "People / Meet the group").
- **Typography:** a single serif family, Alegreya, for everything (body 1.125rem, line-height 1.65); Alegreya SC for true small caps (navbar title, acronym line, "See" labels). Fonts load from Google Fonts in `_includes/head.html`.
- **Color (illuminated-manuscript palette):** near-black ink for body text; TTIC blue (`--brand` / `--brand-dark`) as the "lapis" for headings and links; red `--rubric` (`#7f2a23`) used *sparingly* — only for publication year labels and the drop cap. Cream background `#f7f4ef`.
- **Single bold moments, used once each:** the red two-line drop cap on the home-page lede (`.lede::first-letter`), and the blue knotwork band in the middle of the footer bar (`assets/images/knotwork.png`, cropped/straightened from the logo).
- **Logo vocabulary:** the sail glyphs (λ, tree, descending curve) are reused as inline SVG emblems for the three research interests (`_includes/emblems/{lambda,tree,plot}.svg`, colored via `currentColor`). Prefer reusing these over adding new ornament.

## Content

- **Home** (`pages/index.html`): logo + h1 "LEIF Lab" with the acronym expansion underneath in small caps; short lede (drop cap); group photo (`photo`, `photo_alt` in front matter — alt text should name the people); research interests as plain rows defined in the front-matter `interests` list (`title`, `emblem`, `text`, `papers` — link one or two representative papers). Navbar title "LEIF Lab @ TTIC" links here.
- **People** (`pages/people.html`): rendered from `_data/people.yml` via `_includes/person.html`. PI + students are shown first with no heading (arch-topped portrait, name, short `role`, optional `interests` line) on the page background — no boxes. Collaborators and alumni are plain text lists (toggle `abbreviate_*` in front matter to show them with photos).
- **Publications** (`pages/publications.html`): rendered from `_data/publications.yml`, grouped by year (year is a red marginal label). Each pub has `title`, `link` (arXiv; the title links here), `authors` (list with `lab: true` to bold lab members, `et_al: true` for italic et al.), optional `venue` (`{name: "ICML 2024", href: OpenReview}` — rendered italic), `links` (e.g. code, blog — don't repeat the arXiv link), `coverage` (press, e.g. Quanta — appended to the same " · " link list), and `figure` (thumbnail in a 200px left column; ~560px-wide PNG in `assets/images/papers/`, cropped from the paper) + `figure_alt`, or `emblem` (lambda/tree/plot) as a faded placeholder when there's no figure. Figures use `mix-blend-mode: multiply` so their white backgrounds blend into the cream page. Schema is documented at the top of the YAML file.
- **Teaching** (`pages/teaching.html`) and **Blog** (`pages/blog.html`): unpublished stubs (`published: false`).

## Style notes

- All h1/h2/h3 headings render in `--brand-dark` (TTIC blue `#005494`), except publication years (`--rubric`).
- Publication titles are blue links (arXiv); no underline; lightens on hover.
- Lab member authors are **bold** (not underlined, not blue).
- Venue/code/blog links are plain text separated by " · ", not buttons.

## Technical

- Static HTML5 via Jekyll; deployed to GitHub Pages.
- Keep it maintainable — a human should be able to update content quickly.
- `<head>` markup (meta, Open Graph tags, fonts, favicons) lives once in `_includes/head.html`; both layouts include it. Social preview image: `og_image` in `_config.yml` (`assets/images/og-image.jpg`, 1200×630).
- Brand colors configured in `_config.yml` (`brand_color`, `brand_color_dark`) and exposed as CSS vars `--brand` / `--brand-dark`. Other palette vars are at the top of `assets/css/styles.css`.
- `CLAUDE.md` and `scripts/` are in `exclude` in `_config.yml` so they aren't published — keep it that way for any new internal files.
- **Images:** keep page weight small. Headshots: square JPEG ~320px (`magick in -auto-orient -gravity center -resize 320x320^ -extent 320x320 -strip -quality 82 out.jpg`). Photos: ≤1400px wide JPEG. The full-res master logo lives at `scripts/logo-editing/ship-logo-master.png` (not published).
- Test locally with `bundle exec jekyll serve` (or `./scripts/serve.sh`); `./scripts/test.sh` runs html-proofer; deploy by pushing to `main` (`./scripts/deploy.sh`).
