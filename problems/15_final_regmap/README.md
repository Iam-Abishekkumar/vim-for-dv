# 15 · Final challenge: spec table to SV package

**Level:** Harder
**Practises:** `dd` `:%s/^/` `:%s#,#` `gg O` `G o` `macros (optional)`

The register spec arrived as a CSV table pasted into a file. Turn it into a SystemVerilog package with address constants, using anything from your notes.

## Start

```bash
./play.sh 15
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Delete the header line `name,offset,access`.
2. Start every line with `  localparam logic [7:0] ` (two spaces first). In `:%s`, `^` matches the start of each line.
3. Turn `,0x` into `_ADDR = 8'h`.
4. Turn the remaining comma into `; // ` so the access type becomes a comment.
5. Add `package fifo_regs_pkg;` above the first line and `endpackage` below the last.

<details>
<summary>Hints (open only if stuck)</summary>

- For step 4, use `#` as the separator (`:%s#,#; // #`), so the `//` needs no escaping.
- If Vim indents a new line for you (after `O` or `o`), remove the spaces with `0` and `x`: `check.sh` only passes when the spaces match too.

</details>

## Done?

- `./check.sh 15` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
