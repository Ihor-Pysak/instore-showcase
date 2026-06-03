#!/bin/bash
# Double-click to launch the strain showcase fullscreen in Chrome (kiosk mode).
# Press Cmd+Q to quit. For a wall screen, set the display to portrait in System Settings → Displays.
DIR="$(cd "$(dirname "$0")" && pwd)"
URL="file://$DIR/index.html?theme=dark"

if [ -d "/Applications/Google Chrome.app" ]; then
  open -na "Google Chrome" --args \
    --kiosk --start-fullscreen --noerrdialogs --disable-infobars \
    --autoplay-policy=no-user-gesture-required \
    --user-data-dir="$DIR/.chrome-kiosk" \
    "$URL"
else
  # fallback: default browser (press F for fullscreen)
  open "$URL"
fi
