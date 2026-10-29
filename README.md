# brissypubchess.com.au

The public website for Brissy Pub Chess: weekly blitz chess at Sea Legs Brewing Co, Kangaroo Point.

Plain HTML5 and CSS. No build step, no JavaScript, no tracking.

## What's where

| Path | What it is |
| --- | --- |
| `index.html` | Main page: About, Coming up, FAQ, Contact |
| `the-pony/index.html` | The Pony comic, newest first |
| `404.html` | Shown when someone goes to an address that doesn't exist |
| `css/style.css` | All styling. Phone first, widened for bigger screens |
| `fonts/` | Lora (the logo's typeface), served from the site itself. `OFL.txt` is its licence |
| `images/` | Logo, browser-tab icon, the comics, the photo of a chess night (`chess-night-*.webp`), and `share.jpg` (the picture shown when someone shares a link to the site) |
| `Makefile` | `make install` copies the site into a web server's folder (see below) |

The logo and full-size comics live in [brissy-pub-chess-artwork](https://github.com/MockingBirdInvestor/brissy-pub-chess-artwork). This repo keeps only the copies the site uses.

## Previewing it

Double-click `index.html` to open it in a browser. Every link points at an actual file, so the whole site works straight from the folder, with no web server needed. The one exception is `404.html`, which only does its job on a real host.

## Putting it online

On a server with `make` and `rsync`, install from a checkout with:

```
make install WEBROOT=/path/to/web/folder
```

It copies only the files the site serves (`index.html`, `404.html`, and the `the-pony`, `css`, `fonts` and `images` folders), so `.git`, `README.md`, `CLAUDE.md` and the `Makefile` never reach the web server. Files removed from the site are removed from the web folder too. Keep the checkout itself outside the web folder.

Without `make`, upload those same files and folders by hand, keeping the folder layout.

GitHub Pages, Netlify and Cloudflare Pages can also publish straight from this repo, updating the site every time `main` changes ([GitHub](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site), [Netlify](https://docs.netlify.com/build/git-workflows/overview/), [Cloudflare](https://developers.cloudflare.com/pages/configuration/git-integration/)). GitHub Pages needs a paid GitHub plan while the repo is private.

GitHub Pages, Netlify and Cloudflare Pages all show a root `404.html` for missing pages with no extra setup ([GitHub](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-custom-404-page-for-your-github-pages-site), [Netlify](https://docs.netlify.com/manage/routing/redirects/redirect-options/), [Cloudflare](https://developers.cloudflare.com/pages/configuration/serving-pages/)). Other hosts may need it set up.

The pages assume the site's address is `https://brissypubchess.com.au/` (https, no www). It's written into the `canonical` and `og:` tags at the top of `index.html` and `the-pony/index.html`. If the host uses a different address, change it in both files.

## Making changes

Changes are made by Claude, following [CLAUDE.md](CLAUDE.md). That file lists where each detail lives on the page and how to add a new Pony comic.
