# Vim for Design Verification

[![check](https://github.com/Iam-Abishekkumar/vim-for-dv/actions/workflows/check.yml/badge.svg)](https://github.com/Iam-Abishekkumar/vim-for-dv/actions/workflows/check.yml)

15 Vim editing problems built on the files a DV engineer works with every day: SystemVerilog RTL, testbenches,
UVM components, assertions and simulation logs. Each one is solved in Vim and **checked automatically against a
target file**, the same way a regression checks a design against its reference.

RTL and testbench work happens on remote Linux servers and simulation farms, often over SSH with no GUI.
Vim is always there, and editing fast in it (macros, block edits, search and replace) saves real time when
a regression fails at night.

## How it works

```text
 start.sv ──► you, in Vim ──► answer.sv ──┐
                                          ├──► check.sh ──► PASS / FAIL
                        target.sv ────────┘
```

| File | What it is |
|---|---|
| `start.*` | The file as it arrives. Never edited. |
| `answer.*` | Your copy, made by `play.sh`. This is what you edit and commit. |
| `target.*` | What your answer must look like, byte for byte. |
| `keys.md` | The keystrokes you used, so the solution shows *how*, not just the result. |

## Quick start

```bash
git clone https://github.com/Iam-Abishekkumar/vim-for-dv.git
cd vim-for-dv
./play.sh 01        # opens problem 01 in Vim, checks it when you quit
./check.sh          # scoreboard for every problem
```

## Problems

<!-- progress -->**Progress: 12 / 15 solved**<!-- /progress -->

| # | Problem | Practises | Level | Status |
|---|---|---|---|---|
| 01 | [Fix a testbench header](problems/01_insert_modes/) | `i` `a` `A` `o` `O` | Easy | ✅ solved |
| 02 | [Jump around a FIFO](problems/02_navigation/) | `:se nu` `gg` `G` `16G` `0` | Easy | ✅ solved |
| 03 | [Clean debug code out of a test](problems/03_delete/) | `dd` `5dd` `:N,Md` `:g/pattern/d` `D` | Easy | ✅ solved |
| 04 | [Add a read agent to a UVM env](problems/04_copy_paste/) | `yy` `p` `ddp` `cw` `:s on one line` | Easy | ✅ solved |
| 05 | [Old Verilog types to logic](problems/05_change_repeat/) | `/\<word\>` `cw` `n` `.` `u` | Medium | ✅ solved |
| 06 | [Switch assertions on and off](problems/06_visual_block/) | `Ctrl+v` `I` `$ A` `d` `j` | Medium | ✅ solved |
| 07 | [Rename a signal safely](problems/07_rename_signal/) | `:%s` `\< \>` `\C` `n flag` | Medium | ✅ solved |
| 08 | [Replace inside one module only](problems/08_range_replace/) | `:se nu` `:N,Ms` `V then :` `:'<,'>s` | Medium | ✅ solved |
| 09 | [Macro: port list from a spec](problems/09_macro_ports/) | `qa ... q` `7@a` `I` `e` `a` | Harder | ✅ solved |
| 10 | [Macro: connect an instance](problems/10_macro_instance/) | `qa ... q` `yw` `p` `A` `a` | Harder | ✅ solved |
| 11 | [Fix the indentation of a module](problems/11_indent/) | `:set shiftwidth=2 expandtab` `V` `>` `<` `>>` | Medium | ✅ solved |
| 12 | [Triage a UVM log in Vim](problems/12_log_triage/) | `:v/pattern/d` `:g` `:%s#a#b#` `\S\+` `dd` | Harder | ✅ solved |
| 13 | [Copy signals across a split](problems/13_split_windows/) | `:vsp` `Ctrl+w w` `V` `y` `V then p` | Medium | ⬜ to do |
| 14 | [Fix one bug in three files](problems/14_buffers/) | `:ls` `:bn` `:bp` `:b N` `:%s` | Medium | ⬜ to do |
| 15 | [Final challenge: spec table to SV package](problems/15_final_regmap/) | `dd` `:%s/^/` `:%s#,#` `gg O` `G o` | Harder | ⬜ to do |

The status column is refreshed by `./play.sh` (or `./check.sh --readme`). GitHub Actions runs `./check.sh` on every push:
unsolved problems are fine, but a wrong answer turns the badge red.

## Rules

1. Edit only in Vim. No other editor, no `sed` from the shell.
2. `target.*` is there to compare against, not to copy from.
3. When a problem passes, write your keystrokes in its `keys.md`, then commit:
   ```bash
   git add problems/05_*/ README.md
   git commit -m "Solve 05: change and repeat"
   git push
   ```
4. Found a shorter way later? Update `keys.md`. Fewer keystrokes is the real score in Vim.

## Notes

My organised Vim notes, with every command checked in Vim 9.1, are in [docs/Vim_Notes.pdf](docs/Vim_Notes.pdf).
See also: [Linux CLI for DV](https://github.com/Iam-Abishekkumar/linux-cli-for-dv).

## Requirements

`bash`, `vim` and `diff`. Any Linux machine, macOS, or WSL.
