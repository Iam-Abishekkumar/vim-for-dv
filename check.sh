#!/usr/bin/env bash
# check.sh: compare your answer files with the target files.
#
#   ./check.sh            check every problem
#   ./check.sh 05         check one problem
#   ./check.sh --readme   check every problem and refresh the progress table in README.md
#
#   PASS  every answer file matches its target exactly
#   FAIL  an answer file exists but differs (the diff is shown)
#   TODO  no answer file yet (start with ./play.sh NN)
#
# Exits with 1 only if something FAILs, so unsolved problems never break CI.

set -u
export LC_ALL=C
ROOT=$(cd "$(dirname "$0")" && pwd)
UPDATE_README=0; FILTER=""
for arg in "$@"; do
  case "$arg" in
    --readme)  UPDATE_README=1 ;;
    -h|--help) sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) [[ "$arg" =~ ^[0-9]+$ ]] || { echo "Not a problem number: $arg (see --help)"; exit 2; }
       FILTER=$(printf '%02d' "$((10#$arg))") ;;
  esac
done
[ "$UPDATE_README" -eq 1 ] && FILTER=""

if [ -t 1 ] || [ -n "${CI:-}" ]; then G=$'\e[32m'; R=$'\e[31m'; Y=$'\e[33m'; D=$'\e[2m'; B=$'\e[1m'; N=$'\e[0m'
else G=; R=; Y=; D=; B=; N=; fi

explain() {  # $1 = target file, $2 = answer file
  local t=$1 a=$2
  if diff -q --strip-trailing-cr "$t" "$a" >/dev/null 2>&1; then
    echo "    ${Y}hint:${N} only the line endings differ (Windows CRLF). In Vim: :set ff=unix, then :w"
  elif diff -q -w "$t" "$a" >/dev/null 2>&1; then
    echo "    ${Y}hint:${N} only spaces differ (indentation or trailing spaces)"
  fi
  diff -u --label "$(basename "$t")" --label "$(basename "$a")" "$t" "$a" | head -n 40 | sed 's/^/    /'
}

pass=0; fail=0; todo=0; total=0
STATUS_FILE=$(mktemp)
trap 'rm -f "$STATUS_FILE"' EXIT

printf '%s%-28s %s%s\n' "$B" "PROBLEM" "RESULT" "$N"
printf '%s\n' "------------------------------------------"
for dir in "$ROOT"/problems/"${FILTER}"*/; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir"); num=${name%%_*}
  total=$((total + 1))
  have=0; missing=""; report=""
  for tgt in "$dir"target*; do
    base=$(basename "$tgt")
    ans="$dir/answer${base#target}"
    if [ -f "$ans" ]; then
      have=1
      cmp -s "$tgt" "$ans" || report+="$(explain "$tgt" "$ans")"$'\n'
    else
      missing+=" answer${base#target}"
    fi
  done

  if [ "$have" -eq 0 ]; then
    printf '%-28s %sTODO%s  %s./play.sh %s%s\n' "$name" "$D" "$N" "$D" "$num" "$N"
    todo=$((todo + 1)); echo "$num TODO" >> "$STATUS_FILE"
  elif [ -n "$report" ] || [ -n "$missing" ]; then
    printf '%-28s %sFAIL%s\n' "$name" "$R" "$N"
    [ -n "$missing" ] && echo "    missing:$missing (./play.sh $num creates missing answer files)"
    [ -n "$report" ] && printf '%s' "$report"
    fail=$((fail + 1)); echo "$num FAIL" >> "$STATUS_FILE"
  else
    note=""
    if [ ! -f "$dir/keys.md" ] || grep -q "TODO: write your keystrokes" "$dir/keys.md"; then
      note="  ${Y}(now write your keystrokes in keys.md)${N}"
    fi
    printf '%-28s %sPASS%s%s\n' "$name" "$G" "$N" "$note"
    pass=$((pass + 1)); echo "$num PASS" >> "$STATUS_FILE"
  fi
done
printf '%s\n' "------------------------------------------"
[ "$total" -eq 0 ] && { echo "No problem matches '${FILTER}'"; exit 2; }
printf '%sSolved %d / %d%s' "$B" "$pass" "$total" "$N"
[ "$fail" -gt 0 ] && printf '  ·  %s%d failing%s' "$R" "$fail" "$N"
[ "$todo" -gt 0 ] && printf '  ·  %d to do' "$todo"
printf '\n'

if [ "$UPDATE_README" -eq 1 ] && [ -f "$ROOT/README.md" ]; then
  tmp=$(mktemp)
  awk -v sf="$STATUS_FILE" -v solved="$pass" -v total="$total" '
    BEGIN { while ((getline line < sf) > 0) { split(line, a, " "); st[a[1]] = a[2] } }
    /^[|] [0-9][0-9] [|]/ {
      n = substr($0, 3, 2)
      if (n in st) {
        icon = (st[n] == "PASS") ? "✅ solved" : (st[n] == "FAIL") ? "❌ check failed" : "⬜ to do"
        sub(/[|] [^|]*[|]$/, "| " icon " |")
      }
    }
    /<!-- progress -->/ {
      sub(/<!-- progress -->.*<!-- \/progress -->/, "<!-- progress -->**Progress: " solved " / " total " solved**<!-- /progress -->")
    }
    { print }
  ' "$ROOT/README.md" > "$tmp" && cat "$tmp" > "$ROOT/README.md"
  rm -f "$tmp"
  echo "README.md progress table updated."
fi

[ "$fail" -eq 0 ]
