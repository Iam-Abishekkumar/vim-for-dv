# 05 · Old Verilog types to logic

**Level:** Medium
**Practises:** `/\<word\>` `cw` `n` `.` `u` `Ctrl+r`

This counter still uses Verilog-2001 `wire` and `reg`. Move it to `logic`, choosing each change yourself. **Don't use `:s` in this problem.**

## Start

```bash
./play.sh 05
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Search for the whole word: `/\<wire\>`. Change the first match with `cw`, type `logic`, press `Esc`.
2. Press `n` to jump to the next match and `.` to repeat the change. Keep going.
3. When `n` lands on the comment `// wire up the outputs`, skip it: press `n` again without `.`.
4. Do the same for `reg` with `/\<reg\>`.

<details>
<summary>Hints (open only if stuck)</summary>

- Made a wrong change? `u` undoes it, `Ctrl+r` redoes it.

</details>

## Done?

- `./check.sh 05` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
