# 02 · Jump around a FIFO

**Level:** Easy
**Practises:** `:se nu` `gg` `G` `16G` `0` `$` `%` `w` `gd`

Review comments land all over a file. Get to each spot with a jump, not by holding the arrow keys.

## Start

```bash
./play.sh 02
```

This copies `start.sv` to `answer.sv` and opens it in Vim. When you quit Vim, your answer is checked against `target.sv`.

## Tasks

1. Turn on line numbers: `:se nu`.
2. Go to the first line with `gg` and append ` - reviewed` to it.
3. Line 16 is indented 4 spaces instead of 2. Jump there with `16G`, go to column 0 with `0`, and delete two spaces with `x`.
4. Line 5 ends with `(`. Go there (`5G`, then `$`) and press `%` to land on the matching `)`. Append ` // port list` to that line.
5. On line 21, put the cursor on the word `full` (hop with `w`) and press `gd` to jump to where `full` is declared. Append ` // set when count == DEPTH` to the declaration.
6. Go to the last line with `G` and add `// end of file` below it.

<details>
<summary>Hints (open only if stuck)</summary>

- Lost after a jump? `''` (two single quotes) takes you back to where you were.
- Bonus, not checked: before task 5, set a mark with `ma`; afterwards return with `'a`.

</details>

## Done?

- `./check.sh 02` should say **PASS**. Not yet? `vimdiff answer.sv target.sv` shows what is still different.
- Write the keys you used in [keys.md](keys.md), then commit.
