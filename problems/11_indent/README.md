# 11 · Fix the indentation of a module

**Level:** Medium
**Practises:** `:set shiftwidth=2 expandtab` `V` `>` `<` `>>` `<<` `.`

Someone pasted an always block in without any indentation. Shift it into shape, one level (2 spaces) at a time.

## Start

```bash
./play.sh 11
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. First type `:set shiftwidth=2 expandtab`, so one indent level is 2 spaces.
2. Select the whole `always_ff` block (lines 9 to 15) with `V` and press `>`.
3. Indent its inside (lines 10 to 14) one more level, then the two `trig_q <=` lines one more level. `>>` indents just the current line; `.` repeats.
4. The `assign` line is indented too far: move it back with `<<` until it lines up with `logic trig_q;`.

<details>
<summary>Hints (open only if stuck)</summary>

- Your notes have `gg=G`, which re-indents a whole file at once. Its result depends on your Vim version and filetype settings, so this problem uses `>` and `<`, which give the same result everywhere.
- Bonus, not checked: run `gg=G` on a copy and compare with `vimdiff copy.sv target.sv`.

</details>

## Done?

- `./check.sh 11` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
