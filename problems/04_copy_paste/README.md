# 04 · Add a read agent to a UVM env

**Level:** Easy
**Practises:** `yy` `p` `ddp` `cw` `:s on one line` `"ayy / "ap`

The FIFO env only has a write agent. Add a read agent by copying the write agent's lines, and fix the build order on the way.

## Start

```bash
./play.sh 04
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. In `build_phase`, the scoreboard is created before the agent. Swap those two lines with `ddp`.
2. Copy the `wr_agent` declaration line (`yy`, `p`) and change the copy to `rd_agent` (`cw`).
3. Copy the `wr_agent = ...create(...)` line and change both `wr` to `rd` in the copy.
4. Do the same for the `connect` line in `connect_phase`.

<details>
<summary>Hints (open only if stuck)</summary>

- `:s/wr/rd/g` with no range works on the current line only.
- Bonus: copy into a named register with `"ayy` and paste it with `"ap`.

</details>

## Done?

- `./check.sh 04` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
