# 08 · Replace inside one module only

**Level:** Medium
**Practises:** `:se nu` `:N,Ms` `V then :` `:'<,'>s`

The file keeps the old synchronizer for reference. Only `sync_new` should move to SystemVerilog types.

## Start

```bash
./play.sh 08
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Find the line numbers of `module sync_new` and its `endmodule` (`:se nu`).
2. In that range only, change `wire` to `logic`, `reg` to `logic`, and `always @` to `always_ff @`. Use `:N,Ms/old/new/g`.
3. `sync_old` must stay exactly as it is.

<details>
<summary>Hints (open only if stuck)</summary>

- Instead of typing line numbers: select the module with `V`, then press `:`. Vim fills in `:'<,'>` (the selected lines) for you.

</details>

## Done?

- `./check.sh 08` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
