# brissypubchess.com.au

The public website for Brissy Pub Chess: weekly blitz chess at Sea Legs Brewing Co, Kangaroo Point.

Plain HTML5 and CSS. No build step, no JavaScript, no tracking. Upload the files as they are to any web host.

## What's where

| Path | What it is |
| --- | --- |
| `index.html` | Main page: About, Coming up, FAQ, Links |
| `the-pony/index.html` | The Pony comics, newest first |
| `css/style.css` | All styling. Phone first, widened for bigger screens |
| `fonts/` | Lora (the logo's typeface), served from the site itself. `OFL.txt` is its licence |
| `images/` | Logo, browser-tab icon and the comics |

The logo and full-size comics live in [brissy-pub-chess-artwork](https://github.com/MockingBirdInvestor/brissy-pub-chess-artwork). This repo keeps only the copies the site uses.

## Previewing it

The links use folder addresses (`the-pony/`), which need a web server rather than double-clicking the file. From this folder:

```
npx serve .
```

Then open the address it prints.

## Adding a Pony comic

1. Add the full-size original to the artwork repo as `the-pony/the-pony-N.png`.
2. Make two web copies in `images/the-pony/`: one 640 pixels wide, and one 1024 wide (or the original's width if it's narrower). With ImageMagick installed:

   ```
   magick the-pony-N.png -resize 640x -quality 82 the-pony-N-640.webp
   magick the-pony-N.png -resize 1024x -quality 82 the-pony-N-1024.webp
   ```

3. In `the-pony/index.html`, copy the top `<figure>` block, put it above the others, and change the number, the image size and the description. Remove `loading="lazy"` from the new top one and add it to the one below, so the newest comic loads straight away.

## Adding an event

In `index.html`, add an `<li>` under the "Every Wednesday" one in the Coming up list.
