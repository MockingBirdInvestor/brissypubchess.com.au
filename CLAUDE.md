# Brissy Pub Chess website

Instructions for Claude when changing this site. The README covers what the site is and how to preview and host it.

## Rules

- Plain HTML5 and CSS only. No build step, no JavaScript, no frameworks, no extra tooling unless Nicho asks for it.
- Every link points at an actual file (`the-pony/index.html`, not `the-pony/`), so the site works by double-clicking `index.html`. The exception is `404.html`, whose links start from the site root because it can be shown at any address.
- Plain Australian English. Say "Register", never "Rego". Never invent jokes, facts or events.
- Brand green is `#014425`; typeface is Lora, served from `fonts/`.
- The `Makefile`'s `install` target lists the files the site serves (`FILES` and `DIRS`). A new top-level file or folder must be added there, or it won't be installed.
- Check every change with `npx html-validate index.html the-pony/index.html 404.html`, and look at it at phone width (about 375px) and computer width.
- Commits use Nicho's details: Nicho Cornish <n.k.cornish@gmail.com>. Work on a branch and open a pull request; merge only when Nicho says to.

## Changing the details

Most details appear in more than one place, all in `index.html`. Change every place, or the site will contradict itself.

| Detail | Where it appears |
| --- | --- |
| Night (Wednesday) | `description` and `og:description` at the top; About; Coming up; FAQ "When and where?" |
| Venue and suburb | `<title>` and `og:title`; both descriptions; the line under the logo (suburb and city only); About; Coming up; FAQ "When and where?" |
| Venue website link | About; Coming up; FAQ "When and where?" |
| Street address | Coming up and FAQ "When and where?", in the link text and in the map link's `query=` |
| Times | Coming up; FAQ "When and where?" |
| Price | FAQ "How much?" |
| Facebook event | Coming up |

Map links use Google's documented format, `https://www.google.com/maps/search/?api=1&query=...`, with spaces as `+` and commas as `%2C`.

## Adding a Pony comic

Nicho makes a new comic and hands over the image. Add it to both repos in one go:

1. **Artwork repo** (`MockingBirdInvestor/brissy-pub-chess-artwork`): add the original, unchanged, as `the-pony/the-pony-N.png`.
2. **This repo:** make two WebP copies in `images/the-pony/`, at quality 82:
   - `the-pony-N-640.webp`, 640 pixels wide;
   - a larger copy 1024 wide, or the original's own width if it's narrower (never enlarge). Name it after its real width: #4 is 825 wide, so it's `the-pony-4-825.webp`.
3. In `the-pony/index.html`, copy the top `<figure>` block and put the copy above the others. In the copy, set:
   - both file names in `src` and `srcset`, with each `w` number matching that file's real width;
   - `width` and `height` to the larger copy's size;
   - `alt` to a plain description of the comic, including all its words;
   - the number in `<figcaption>`.
4. Remove `loading="lazy"` from the new top comic and add it to the one that used to be on top, so the newest loads straight away.

## One-off events

The site lists only the weekly night, plus a link to the Facebook event for week-by-week details. Add a one-off entry only when Nicho asks for one: an `<li>` under "Every Wednesday" in Coming up, in the same form, with the date written out (e.g. "Wednesday 24 December 2026"). Remove it once the date has passed.
