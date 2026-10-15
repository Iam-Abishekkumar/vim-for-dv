# 13 · Copy signals across a split

**Level:** Medium
**Practises:** `:vsp` `Ctrl+w w` `V` `y` `V then p` `Ctrl+w o` `:only`

The testbench needs the same signals the interface declares. Open both files side by side and copy across.

## Start

```bash
./play.sh 13
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`. `fifo_if.sv` is a source file for this problem; don't edit it.

## Tasks

1. Open the interface next to your answer: `:vsp fifo_if.sv`.
2. Copy its 7 signal declarations (`V`, `j` to extend the selection, `y`).
3. Jump back to `answer.sv` with `Ctrl+w w` and replace the `// TODO` line with them.
4. Close the other window with `Ctrl+w o` (or `:only`), then save and quit with `:wq`.

<details>
<summary>Hints (open only if stuck)</summary>

- Select the TODO line with `V` and press `p`: the selection is replaced by what you copied.
- Don't edit `fifo_if.sv`; it's only the source.

</details>

## Done?

- `./check.sh 13` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
