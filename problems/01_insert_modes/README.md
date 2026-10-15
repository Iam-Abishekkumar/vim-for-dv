# 01 · Fix a testbench header

**Level:** Easy
**Practises:** `i` `a` `A` `o` `O` `x` `:wq`

A new testbench file came from a teammate with a sloppy header. Fix it using the right insert command for each spot.

## Start

```bash
./play.sh 01
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Line 2: add `dv_team` after `Author  :` (use `A`).
2. Line 3: fix the spelling `synchronus` to `synchronous` (use `i` or `a`).
3. Add a new line `// Status  : draft` under line 3 (use `o`).
4. Add `` `timescale 1ns/1ps `` on a new line above `module` (use `O`).
5. The `module` line is missing its `;` at the end (use `A`).
6. `logic  clk;` has one space too many: delete it (use `x`).
7. Save and quit with `:wq`.

<details>
<summary>Hints (open only if stuck)</summary>

- If pressing `o` on a comment line types `// ` for you (some Vim setups do this), don't type it again.
- `a` inserts after the cursor, `i` before it: put the cursor on the `n` of `synchronus` and use `a`.

</details>

## Done?

- `./check.sh 01` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
