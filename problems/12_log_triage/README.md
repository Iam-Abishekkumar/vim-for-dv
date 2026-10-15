# 12 · Triage a UVM log in Vim

**Level:** Harder
**Practises:** `:v/pattern/d` `:g` `:%s#a#b#` `\S\+` `dd` `gg` `P`

A regression failed. Cut the log down to just the errors, make them readable, and put the root cause first.

## Start

```bash
./play.sh 12
```

This copies `start.log` to `answer.log` and opens it in Vim. When you quit Vim, your answer is checked against `target.log`.

## Tasks

1. Delete every line that is not an error message. `:v/pattern/d` deletes every line that does **not** match the pattern. Careful: the summary line `UVM_ERROR :    3` is not a message.
2. Remove the file path and line number from each line, for example `/home/dv/tb/env/fifo_sb.sv(102) ` (with its trailing space).
3. The `DRV_TIMEOUT` error is the root cause: move it to the top (`dd`, `gg`, `P`).

<details>
<summary>Hints (open only if stuck)</summary>

- `:g/pattern/d` is the opposite of `:v`: it deletes the lines that do match.
- `\S\+` matches a run of non-space characters. Use `#` as the separator (`:%s#old#new#`) so the `/` in the path doesn't need escaping.

</details>

## Done?

- `./check.sh 12` should say **PASS**. Not yet? `vimdiff answer.log target.log` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
