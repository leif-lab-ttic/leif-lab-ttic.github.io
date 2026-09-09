# Guide for Agents

I am Will Merrill, an Assistant Professor at TTIC. Your task is to build and maintain a lightweight website for my research group at TTIC. It will be deployed on GitHub pages at merrill-lab.github.io. Generally, it should be a static website written in clean but minimal HTML 5. It should be maintainable so that a human can quickly update the contents, with or without an agent assistant.

Some static website generators go through a Markdown layer that gets rendered as HTML. Let's try something different. I will provide some vague specifications about content below under "Website Content" as well as through chat sessions. You can update the "Agents Log" below that as an immutable log of changes and other useful context.

Regarding style, I want it to be pretty clean and minimal, but more academic than techy. For example, no bolded numbers or showy contents on the main page. In subtle ways, you can incorporate some idiosyncratic flair like my interest for Vikings or theoretical computer science. Here are some good references for the kind of thing I'm looking for:
- https://aroraresearch-princeton.github.io/
- https://www.surbhigoel.com/group
- https://rycolab.io/
- https://caplabnyu.github.io/

The website should be easy to locally test and deploy to GitHub. If needed, this could be with a script that can be run.

## Website Content

Website should be pretty static and bare bones, with a simple navbar that lists each page:
- The main navbar title "Merrill Lab @ TTIC" is a link to index.html, which has a paragraph giving an overview of the lab's research and has a picture of the lab.
- A navbar entry "People" links to a minimal people page. For each person there is a name, headshot, and title.
- Also add a "Publications" page with a list of publications from the group.
- Also add a "Teaching" page stub
- Also add a "Blog" page stub

## Agents Log
- 2026-09-08: Created a minimal static website template for the Merrill Lab with a landing page, about page, people page, and shared styling to match the TTIC lab aesthetic and satisfy the lightweight GitHub Pages requirements.
- 2026-09-08: Reorganized the project into separate directories for HTML, CSS/JS/image assets, and scripts; refined the landing page to keep the tone academic and minimal rather than flashy or metric-heavy.