# De Medley — Strain Showcase

A self-contained slideshow menu for an in-store screen. Opens in any browser, loops forever, runs fully offline. Portrait 9:16 (primary), also adapts to landscape.

- **Photo · name · genetics (cross) · type** per strain.
- **De Medley** logo (presenter) in the corner — adapts to dark/light.
- The **Holigram** mark rotates huge and faint in the background.
- **Dark** theme by default + a **light** toggle.
- Per-strain accent colour, lineage-tree diagram, editorial meta (index, `INDOOR · NL`, `Nieuw` badge), drifting frost particles.

> This is an **in-store menu** shown to customers inside the shop — not advertising and not holigram.nl. Keep copy factual (name + genetics).

---

## Run it

- **Easiest:** double-click `index.html`, then press **F** for fullscreen.
- **Shop kiosk (macOS):** double-click `start-kiosk.command` (opens Chrome fullscreen).
- **Portrait preview on a landscape Mac:** double-click `preview-portrait.command` (opens a 9:16 window).
- **Via a server (optional):**
  ```bash
  cd holigram-coffeeshop-slideshow
  python3 -m http.server 8080
  # open http://localhost:8080
  ```

> ⚠️ It must run in a **real browser**. A local file opened in a *preview* (Finder Quick Look, a messenger/mail preview) will **not** run the slideshow — only the static background shows. Open it in Chrome/Safari, or host it (see below).

## Controls

| Key | Action |
|---|---|
| ← / → | previous / next strain |
| Space | pause / play |
| **F** | fullscreen |
| **T** | dark ⇄ light theme |

Touch screens: tap the left/right third to navigate, the centre to pause.

## URL parameters

```
index.html?theme=light     # start in light theme
index.html?i=3             # start on the 3rd strain
index.html?dur=11000       # 11s per strain (default 9000)
index.html?thc=1           # show a THC% tag
index.html?terps=1         # show dominant terpenes
```

---

## Edit the strains

Everything lives in the **`STRAINS`** array inside `index.html` (bottom, in `<script>`). One object = one slide:

```js
{
  name: 'Vanilla Noir',                 // big title
  reg: true,                            // (opt.) adds ® after the name
  aka: 'voorheen “Pink Drip”',          // (opt.) small italic sub-line under the name
  type: 'Indica',                       // drives the chip dot meaning
  typeLabel: 'Indica-dominant',         // chip text
  cross: ['Oreoz', 'Vanilla White'],    // ← the CROSS shown as the lineage tree (A ✕ B)
  lineage: 'Oreoz (...) × Vanilla White (...)',  // deep lineage (only shown if CONFIG.showLineage)
  accent: '#9B79C2',                    // per-strain accent colour (glow, brace, ✕, badge, index)
  badge: 'Nieuw',                       // (opt.) status badge near the index ('Terug op voorraad', etc.)
  hideCross: false,                     // true = hide the genetics tree for this strain
  thc: '26,18%',                        // only shown if CONFIG.showThc
  terpenes: 'Nerolidol · Caryofylleen', // only shown if CONFIG.showTerpenes
  photo: 'assets/photos/vanilla-noir.jpg',
}
```

Array order = display order. Add a strain by adding an object.

## Swap a photo

Drop a file into `assets/photos/` and point `photo:` at it. Portrait shots (e.g. 9:16) fill the screen best. The current photos were pulled from the Shopify store.

## Exact De Medley logo (raster)

The logo is currently drawn as a theme-adaptive vector. To use the **exact original** instead:
1. Put a file (ideally a transparent PNG) in `assets/brand/`, e.g. `de-medley.png`.
2. In `CONFIG`, set `shopLogo: 'assets/brand/de-medley.png'`.

## CONFIG (in `index.html`)

```js
slideDuration: 9000,   // ms per strain
startTheme: 'dark',    // 'dark' | 'light'
showThc: false,        // THC% tag
showTerpenes: false,   // terpenes line
showLineage: false,    // deep-lineage fine print under the tree
strainAccents: true,   // per-strain accent colour
particles: true,       // drifting frost sparkles
metaTag: 'Indoor · NL',
shopName: 'DE MEDLEY',
shopLogo: '',          // raster logo path (overrides the vector)
eyebrow: 'Wietsoort',
shuffle: false,        // randomise order each load
```

---

## Open it on a phone / share it

A phone needs a **link** (a real browser), not a local file. To get one:

- **Host it free:** drag the folder (or `dist-web.html`) onto a static host — GitHub Pages, **Netlify** (with a free account; the anonymous drop expires after 1h), Cloudflare Pages, Vercel. Send the link; it works on any phone, and portrait phones get the 9:16 layout automatically.
- `index-standalone.html` and `dist-web.html` are **single self-contained files** (fonts + photos embedded) — handy for hosting or sending as one file. `dist-web.html` uses lighter images for faster mobile loading.

---

## Structure

```
holigram-coffeeshop-slideshow/
├── index.html              ← the slideshow (markup + styles + logic + data)
├── index-standalone.html   ← single file, everything embedded (full-res)
├── dist-web.html           ← single file, lighter images (for web/mobile)
├── start-kiosk.command     ← launch fullscreen kiosk (macOS)
├── preview-portrait.command← preview in a 9:16 window (macOS)
├── README.md
└── assets/
    ├── photos/             ← 5 strain photos
    ├── fonts/              ← Ubuntu / Larken / Kabal (self-hosted)
    └── brand/              ← Holigram mark (background) + De Medley logo slot
```

Fonts and colours come from the holigram.nl brand system (`tokens.css`): orange `#BE541C`, green `#294634`, cream `#F3EEE6`.
