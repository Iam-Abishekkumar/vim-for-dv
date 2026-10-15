# 09 · Macro: port list from a spec

**Level:** Harder
**Practises:** `qa ... q` `7@a` `I` `e` `a` `A` `$x`

The spec gives ports as `in`/`out` plus a name. Turn them into a SystemVerilog port list by recording one macro and replaying it.

## Start

```bash
./play.sh 09
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. On the `in clk` line, record a macro into register a (`qa` ... `q`) that turns it into `  input logic clk,` and moves down one line.
2. Play it on the other 7 port lines with `7@a`.
3. The last port must not end with a comma: remove it (`$x`).

<details>
<summary>Hints (open only if stuck)</summary>

- `in` and `out` both become the full word by adding the same three letters at the end.
- Play the macro on exactly the 8 port lines. If it runs on `);` too, undo with `u`.

</details>

## Done?

- `./check.sh 09` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
