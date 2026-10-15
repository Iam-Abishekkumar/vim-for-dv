# 10 · Macro: connect an instance

**Level:** Harder
**Practises:** `qa ... q` `yw` `p` `A` `a` `I` `@a`

Connect every port of the FIFO by name. Eight lines that differ only in the name: a job for a macro that copies the name with `yw` and pastes it with `p`.

## Start

```bash
./play.sh 10
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. On `clk`, record a macro that turns the line into `    .clk(clk),` and moves down one line. Copy the name with `yw` and paste it inside the brackets with `p`.
2. Play it on the other 7 names.
3. Remove the comma after the last connection.

<details>
<summary>Hints (open only if stuck)</summary>

- After `A(` and `Esc`, the cursor sits on the `(`, and `p` pastes right after it.

</details>

## Done?

- `./check.sh 10` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
