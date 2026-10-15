# 03 · Clean debug code out of a test

**Level:** Easy
**Practises:** `dd` `5dd` `:N,Md` `:g/pattern/d` `D` `dw` `dG`

The test passes now. Before review, strip out everything that was only there for debugging.

## Start

```bash
./play.sh 03
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Delete the 4 `$display("DEBUG...` lines. Try `dd` on one, then `:g/DEBUG/d` to remove the rest in one go.
2. Delete the old stimulus: the comment `// old stimulus...` and the 4 commented lines under it (5 lines) with one command: `5dd`, or `:N,Md` using the line numbers.
3. On the `initial begin` line, delete the old comment after `begin`: put the cursor on the space after `begin` and press `D`.
4. `wait wait` has the word twice: delete one with `dw`.
5. Everything after `endmodule` is scratch notes. Put the cursor on the first scratch line and delete to the end of the file with `dG`.

<details>
<summary>Hints (open only if stuck)</summary>

- `:se nu` shows line numbers, so you can read them off for `:N,Md`. They change after every delete.

</details>

## Done?

- `./check.sh 03` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
