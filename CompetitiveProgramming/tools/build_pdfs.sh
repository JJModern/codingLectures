#!/usr/bin/env bash
# Export every lecture's slides.md and notes.md to PDF (slides.pdf / notes.pdf, side by side).
# Requires: Node (npx @marp-team/marp-cli), pandoc, and a Chromium/Chrome binary.
# Usage: CHROME_PATH=/path/to/chrome ./build_pdfs.sh [lecture-dir ...]
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/.." && pwd)"
CHROME_PATH="${CHROME_PATH:-$(command -v chromium || command -v google-chrome || true)}"
export CHROME_PATH
MARP="${MARP:-npx --yes @marp-team/marp-cli@4.1.2}"

if [ "$#" -gt 0 ]; then dirs=("$@"); else
  mapfile -t dirs < <(find "$root" -mindepth 2 -maxdepth 2 -type d -path '*/0[1-4]-*/*' | sort)
fi

tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
for d in "${dirs[@]}"; do
  [ -f "$d/slides.md" ] && $MARP "$d/slides.md" --pdf --allow-local-files -o "$d/slides.pdf" </dev/null >/dev/null 2>&1 \
    && echo "slides: $d" || echo "FAILED slides: $d" >&2
  if [ -f "$d/notes.md" ]; then
    title="$(grep -m1 '^# ' "$d/notes.md" | sed 's/^# //')"
    pandoc "$d/notes.md" -f gfm -t html5 -s --metadata pagetitle="$title" \
      -H <(printf '<style>\n%s\n</style>\n' "$(cat "$here/notes.css")") \
      --highlight-style=tango -o "$tmp/notes.html"
    "$CHROME_PATH" --headless --no-sandbox --disable-gpu --no-pdf-header-footer \
      --print-to-pdf="$d/notes.pdf" "file://$tmp/notes.html" </dev/null >/dev/null 2>&1 \
      && echo "notes:  $d" || echo "FAILED notes: $d" >&2
  fi
done
