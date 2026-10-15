# 14 · Fix one bug in three files

**Level:** Medium
**Practises:** `:ls` `:bn` `:bp` `:b N` `:%s` `:wa` `:wqa`

Code review found a real bug: `rst_n` is active low, but every block resets on `posedge rst_n`. It must be `negedge rst_n`, in all three files.

## Start

```bash
./play.sh 14
```

This copies `start_arb.sv`, `start_dec.sv`, `start_fifo.sv` to `answer_arb.sv`, `answer_dec.sv`, `answer_fifo.sv` and opens them in Vim. When you quit Vim, your answer is checked against `target_arb.sv`, `target_dec.sv`, `target_fifo.sv`.

## Tasks

1. `./play.sh 14` opens all three answer files at once, as buffers. List them with `:ls`.
2. Fix the bug in the current file with `:%s`, then go to the next buffer with `:bn` and fix it there. Repeat for the third file. If `:bn` says `E37: No write since last change`, save first with `:w` (or run `:set hidden` once).
3. Save every file at once with `:wa`, then quit with `:qa` (or both in one go: `:wqa`).

<details>
<summary>Hints (open only if stuck)</summary>

- Bonus: fix all buffers with one command: `:bufdo %s/old/new/ge | update`.
- `:b 2` jumps straight to buffer 2 from the `:ls` list; `:bp` goes back one.

</details>

## Done?

- `./check.sh 14` should say **PASS**. Not yet? `vimdiff answer_arb.sv target_arb.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
