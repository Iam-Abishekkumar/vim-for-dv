# 07 · Rename a signal safely

**Level:** Medium
**Practises:** `:%s` `\< \>` `\C` `n flag`

Review asked for the write-data input to be called `wdata`, not `data`. A careless replace would also break `data_valid`, `data_q`, `mem_data` and `rdata`.

## Start

```bash
./play.sh 07
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Count first: `:%s/\<data\>//gn` reports how many matches there are without changing anything. You should get 3.
2. Rename `data` to `wdata` with **one** `:%s` command.
3. `data_valid`, `data_q`, `mem_data`, `rdata` and the word `Data` in the first comment must not change.

<details>
<summary>Hints (open only if stuck)</summary>

- `\<` and `\>` mark the start and end of a word.
- Got 4 matches instead of 3? Your Vim ignores case (`:set ignorecase`), so `Data` matches too. Add `\C` to the pattern to force case-sensitive matching.

</details>

## Done?

- `./check.sh 07` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
