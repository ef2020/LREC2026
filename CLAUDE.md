# CLAUDE.md — LREC2026 Project

## Project Overview

This repository supports the preparation of a camera-ready paper and companion corpus for **LREC 2026**. The paper describes a method for converting **Rosetta Stone** linguistics puzzles (from UKLO and similar olympiad sources) into **Match-Up** puzzles. The project has two parallel workstreams:

1. **Paper revisions** — incorporating co-author comments and finalizing the camera-ready submission.
2. **Corpus completion** — converting the remaining 66 Rosetta Stone puzzles into Match-Up format (where feasible), then packaging all puzzle pairs into a unified corpus.

### Key People
- **Elena** — project lead, working on puzzles 51–66, paper finalization
- **Anne** — co-author, working on puzzles 1–25
- **Frank** — co-author, working on puzzles 26–50
- **Neh** — responsible for shuffling/randomization, formatting, and creating the final GitHub corpus

### Key Dates
| Milestone | Date |
|---|---|
| Co-author comments & puzzle conversions due | Feb 27, 2026 |
| Camera-ready submission deadline | Mar 6, 2026 |

## Repository Structure

```
LREC2026/
├── CLAUDE.md              # This file — instructions for Claude Code
├── TODO.md                # Task tracker (source of truth for progress)
├── README.md              # Project README for collaborators
├── conversions/           # Working area for puzzle conversions
│   ├── anne/              # Anne's assigned puzzles (1–25)
│   ├── frank/             # Frank's assigned puzzles (26–50)
│   ├── elena/             # Elena's assigned puzzles (51–66)
│   └── completed/         # Reviewed & finalized conversions
├── corpus/                # Final corpus artifacts
│   ├── rosetta_stone/     # Original Rosetta Stone puzzles (references)
│   └── matchup/           # Converted Match-Up puzzles (final format)
├── docs/                  # Supporting documentation
│   └── conversion_guide.md    # How to convert RS → MU puzzles
├── scripts/               # Utility scripts (shuffling, formatting, etc.)
└── paper/                 # Paper-related files and comments
```

## Workflow & Conventions

### Puzzle Conversion
- Each conversion should have a **single combined Match-Up table** with numbered items on one side and uppercase lettered items (A, B, C, …) on the other. **Do not** split data into a separate context table and match-up table — everything goes in one table.
- The single table should include **both** the context (parallel data / reference examples) from the original RS puzzle **and** the questions + solutions. Number items sequentially (1, 2, 3, …) and letter them (A, B, C, … Z, AA, AB, … if >26 items).
- If a Rosetta Stone puzzle **cannot** be meaningfully converted, create a short file noting why (see Yoda example).
- Not all questions from a Rosetta Stone puzzle need to be converted — use judgment (see Nhanda example).
- Introductory text, linguistic notes, and reference paradigm tables (e.g., pronoun charts, suffix lists) should be kept in the Context section as explanatory text — only the actual language–translation pairs go into the Match-Up table.
- Neh handles shuffling/randomization and final formatting after conversions are submitted.

### File Naming
- Conversion files: `puzzle_XX_<language_or_short_name>.md` (e.g., `puzzle_03_swahili.md`)
- Non-convertible puzzles: `puzzle_XX_<name>_SKIP.md` with a brief explanation inside

### Branching
- `main` — stable, reviewed content only
- `conversions/<name>` — working branches for each converter (anne, frank, elena)
- `paper-edits` — branch for paper revision comments and changes

### Commit Messages
Use conventional style:
- `feat(conversion): add puzzle 12 — Turkish`
- `skip(conversion): puzzle 07 — Yodaspeak (not a true RS puzzle)`
- `docs(paper): add Anne's comments on Section 3`
- `fix(corpus): correct numbering in puzzle 34`

## Important Context

### What is a Rosetta Stone puzzle?
A Rosetta Stone puzzle provides parallel data in an unfamiliar language and a known language. Solvers must deduce the linguistic system to answer translation/analysis questions.

### What is a Match-Up puzzle?
A Match-Up puzzle presents two unordered lists (e.g., phrases in Language A and their translations in Language B) and asks the solver to find the correct pairings.

### Conversion procedure (summary)
The detailed procedure is in the paper. In brief:
1. Take the context (parallel data) from the Rosetta Stone puzzle.
2. Take the questions and their solutions.
3. Combine **all** of these into a **single** Match-Up table with numbered items (1, 2, 3, …) on one side and uppercase lettered items (A, B, C, …) on the other. Context pairs and question/solution pairs should all be in the same table — do not use separate tables.
4. For multi-column context data (e.g., paradigm tables with 3+ columns), flatten each entry into individual pairs for the Match-Up table. Keep the original multi-column table in the Context section only if it serves as a reference paradigm (e.g., pronoun charts, suffix inventories).
5. Some RS questions don't convert well (e.g., questions asking for grammatical explanations rather than translations). Skip those questions.
6. If the entire puzzle doesn't lend itself to conversion (e.g., Yodaspeak — not truly a RS puzzle), mark it as non-convertible with a reason.

### Google Drive Reference
The shared Google Drive folder contains:
- Current paper draft
- Table of existing 31 conversions
- `Rosetta_to_MatchUpManyProblems_examples` — conversion examples with comments
- `LREC_missing_puzzles` — links to the 66 puzzles still needing conversion

Drive link: https://drive.google.com/drive/folders/1_t2nOZvNKS-vgIwJjZwATzPb-qICQdB-?usp=drive_link

## Claude Code Guidelines

### When working on this project:
1. Always check `TODO.md` first to understand current status and priorities.
2. When a task is completed, update `TODO.md` immediately.
3. Do not modify files in `conversions/completed/` without explicit instruction.
4. When creating conversion files, follow the naming convention and format in `docs/conversion_guide.md`.
5. If uncertain whether a puzzle can be converted, flag it in `TODO.md` with a `[REVIEW]` tag rather than making a unilateral decision.
6. Keep the corpus consistent — when adding to `corpus/`, ensure formatting matches existing entries.
7. For paper edits, always work on the `paper-edits` branch and note changes in commit messages.

### Quality checks before committing:
- Each conversion file should have exactly **one** Match-Up table (no separate context table)
- Conversion tables should have matching counts on both sides (N numbered items, N lettered items)
- Letters should be uppercase (A, B, C, … Z, AA, AB, … for tables with >26 items)
- No duplicate entries in conversion tables
- Non-convertible puzzles must have a documented reason
- All file names follow the naming convention
