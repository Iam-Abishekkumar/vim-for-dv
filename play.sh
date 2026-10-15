#!/usr/bin/env bash
# play.sh: open a problem in Vim, then check it when you quit.
#
#   ./play.sh 05           start (or continue) problem 05
#   ./play.sh 05 --reset   throw away your answer and start again from start.*
#
# The first time, each start.* file is copied to answer.* and Vim opens the answer.
# Your start and target files are never changed.

set -u
ROOT=$(cd "$(dirname "$0")" && pwd)
[ $# -ge 1 ] || { sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'; exit 1; }
[[ "$1" =~ ^[0-9]+$ ]] || { echo "Not a problem number: $1"; exit 2; }
num=$(printf '%02d' "$((10#$1))")
RESET=0; [ "${2:-}" = "--reset" ] && RESET=1

dir=$(ls -d "$ROOT"/problems/"$num"_*/ 2>/dev/null | head -n 1)
[ -n "$dir" ] || { echo "No problem $num in problems/"; exit 2; }
command -v vim >/dev/null || { echo "vim is not installed (sudo apt install vim)"; exit 1; }

cd "$dir"
answers=()
for s in start*; do
  a="answer${s#start}"
  if [ ! -f "$a" ] || [ "$RESET" -eq 1 ]; then
    cp "$s" "$a"
    echo "created $a from $s"
  fi
  answers+=("$a")
done

echo "Opening ${answers[*]} in Vim. Tasks: problems/$(basename "$dir")/README.md"
vim "${answers[@]}"

cd "$ROOT"
echo
./check.sh "$num"; rc=$?
./check.sh --readme >/dev/null 2>&1
exit $rc
