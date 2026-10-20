#!/usr/bin/env bash
# fresh_start.sh: start all 15 problems from zero in YOUR copy of vim-for-dv.
#
#   ./fresh_start.sh
#
# Deletes the previous solver's answer files, resets every keys.md to the empty template,
# points the README badge at your own GitHub repo, and refreshes the progress table.

set -euo pipefail
ROOT=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT"

n=$(find problems -mindepth 2 -maxdepth 2 -type f -name 'answer*' | wc -l)
read -r -p "This deletes $n answer files and resets every keys.md. Continue? [y/N] " ok
case "$ok" in y|Y|yes) ;; *) echo "Nothing changed."; exit 0 ;; esac

rm -f problems/*/answer*

for d in problems/*/; do
  title=$(sed -n '1s/^# //p' "$d/README.md")
  cat > "$d/keys.md" <<EOF
# $title: my keystrokes

TODO: write your keystrokes here, one step per line, then delete this line.

Example of the format:

    /\<wire\>  Enter     search for the whole word wire
    cw logic Esc         change it to logic
    n .                  next match, repeat the change

## What I learned

EOF
done

# Point the CI badge and links at your own repo (taken from git's origin URL).
owner=$(git remote get-url origin 2>/dev/null | sed -n 's#.*github\.com[:/]\([^/]*\)/.*#\1#p')
old=$(sed -n 's#.*github\.com/\([^/]*\)/vim-for-dv/actions.*#\1#p' README.md | head -n 1)
if [ -n "$owner" ] && [ -n "$old" ] && [ "$owner" != "$old" ]; then
  sed -i "s#github.com/$old/vim-for-dv#github.com/$owner/vim-for-dv#g" README.md
fi

./check.sh --readme >/dev/null 2>&1 || true
echo "Fresh start: all 15 problems are TODO now. Begin with:  ./play.sh 01"
echo "Save your progress:  git add -A && git commit -m \"Fresh start\" && git push"
