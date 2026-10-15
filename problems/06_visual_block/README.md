# 06 · Switch assertions on and off

**Level:** Medium
**Practises:** `Ctrl+v` `I` `$ A` `d` `j`

Some assertions are ready, some are still being debugged, and some covers were fixed. Change several lines at once with Visual Block mode.

## Start

```bash
./play.sh 06
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. The 3 assertions under `// Checks that are ready` are missing the `;`. Add it to all three at once: `Ctrl+v`, select down, `$`, `A`, `;`, `Esc`.
2. Comment out the 2 assertions under `// Checks still being debugged`: `Ctrl+v` on the `a` of the first `assert`, `j`, `I`, type `// `, `Esc`.
3. Uncomment the 3 `cover` lines: select the `// ` columns as a block and delete them with `d`.

<details>
<summary>Hints (open only if stuck)</summary>

- While typing after `I` or `A`, only the first line shows the text. It is copied to the other lines when you press `Esc`.

</details>

## Done?

- `./check.sh 06` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
