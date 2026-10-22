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

The logo and full-size comics live in [brissy-pub-chess-artwork](https://github.com/MockingBirdInvestor/brissy-pub-chess-artwork). This repo keeps only the copies the site uses.

## Previewing it

Double-click `index.html` to open it in a browser. Every link points at an actual file, so the whole site works straight from the folder, with no web server needed. The one exception is `404.html`, which only does its job on a real host.

## Putting it online

Upload these to the host, keeping the folder layout: `index.html`, `404.html`, and the `the-pony`, `css`, `fonts` and `images` folders. Leave out `README.md` and the `.git` folder.

GitHub Pages, Netlify and Cloudflare Pages all show a root `404.html` for missing pages with no extra setup ([GitHub](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-custom-404-page-for-your-github-pages-site), [Netlify](https://docs.netlify.com/manage/routing/redirects/redirect-options/), [Cloudflare](https://developers.cloudflare.com/pages/configuration/serving-pages/)). Other hosts may need it set up.

The pages assume the site's address is `https://brissypubchess.com.au/` (https, no www). It's written into the `canonical` and `og:` tags at the top of `index.html` and `the-pony/index.html`. If the host uses a different address, change it in both files.

## Changing the details

Most details appear in more than one place. Change every place, or the site will contradict itself. All of these are in `index.html`.

| Detail | Where it appears |
| --- | --- |
| Night (Wednesday) | Search and link-preview descriptions (`description`, `og:description`) at the top; About; Coming up; FAQ "When and where?" |
| Venue and suburb | Page title and `og:title`; both descriptions; About; Coming up; FAQ "When and where?" |
| Street address | Coming up and FAQ "When and where?", in the link text and in the map link's `query=` |
| Times | Coming up; FAQ "When and where?" |
| Price | FAQ "How much?" |
| Facebook event | Coming up |

In the map link, spaces are written `+` and commas `%2C`, so "89 Main St, Kangaroo Point" becomes `89+Main+St%2C+Kangaroo+Point`.

## Adding a Pony comic

1. Add the full-size original to the artwork repo as `the-pony/the-pony-N.png`.
2. Make two web copies in `images/the-pony/`: one 640 pixels wide, and one 1024 wide. This needs [ImageMagick](https://imagemagick.org/) installed. The `>` stops it enlarging an original that is narrower than 1024; the quotes stop Windows reading `>` as "save the output to a file".

   ```
   magick the-pony-N.png -resize 640x -quality 82 the-pony-N-640.webp
   magick the-pony-N.png -resize "1024x>" -quality 82 the-pony-N-1024.webp
   ```

   To see a file's actual size, run `magick identify the-pony-N-1024.webp` (it prints width x height). If the original was narrower than 1024, rename the second copy after its real width: #4 is 825 wide, so its copies are `the-pony-4-640.webp` and `the-pony-4-825.webp`.
3. In `the-pony/index.html`, copy the top `<figure>` block and put the copy above the others. In the copy, change:
   - both file names in `src` and `srcset`, and the number after each name in `srcset` (`640w`, `1024w`), which must be that file's real width;
   - `width` and `height`, to the larger copy's size;
   - the `alt` text, which describes the comic for people who can't see it;
   - the number in the `<figcaption>`.
4. Remove `loading="lazy"` from the new top comic, and add it to the one that used to be on top, so the newest loads straight away.

## Adding a one-off event

In `index.html`, add an `<li>` under the "Every Wednesday" one in the Coming up list, in the same form. For example:

```html
<li>
  <strong>Wednesday 24 December 2026</strong>
  No chess this week.
</li>
```

Delete it once the date has passed. Nothing removes it automatically.
