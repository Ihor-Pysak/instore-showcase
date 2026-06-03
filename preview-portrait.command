#!/bin/bash
# Double-click to preview the slideshow in a true 9:16 PORTRAIT window
# (exactly how it will look on the vertical TV in the shop).
# It opens a chromeless 506×900 app window. Close with Cmd+W.
DIR="$(cd "$(dirname "$0")" && pwd)"
URL="file://$DIR/index.html?theme=dark"

if [ -d "/Applications/Google Chrome.app" ]; then
  open -na "Google Chrome" --args \
    --app="$URL" \
    --window-size=506,900 --window-position=140,40 \
    --user-data-dir="$DIR/.chrome-preview"
else
  open "$URL"
fi
