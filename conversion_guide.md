# Conversion Guide: Rosetta Stone → Match-Up Puzzles

## Overview

This guide describes how to convert a Rosetta Stone (RS) linguistics puzzle into a Match-Up (MU) puzzle. The detailed procedure is in the LREC paper; this document is a practical quick-reference for converters.

## Step-by-Step Procedure

### 1. Read the Rosetta Stone puzzle
Identify:
- The **context** (parallel data, examples, word lists, etc.)
- The **questions** (what the solver is asked to do)
- The **solutions** (correct answers)

### 2. Determine convertibility
A puzzle is **convertible** if its questions involve matching or translating items between two lists. A puzzle is **not convertible** if:
- It requires free-form grammatical explanation (no matching structure)
- It is not truly a Rosetta Stone puzzle (e.g., Yodaspeak — word reordering within one language)
- The puzzle structure is too open-ended to reduce to a finite matching problem

If the puzzle cannot be converted, create a `puzzle_XX_SKIP.md` file explaining why.

### 3. Build the Match-Up table
Using **both the context and the questions + solutions**:
- Create a **numbered list** (1, 2, 3, …) on one side (e.g., phrases in the target language)
- Create a **lettered list** (a, b, c, …) on the other side (e.g., English translations)
- The correct matching is the solution

**Important:** You do NOT need to shuffle/randomize the lists. Just create the table with correct pairings visible. Neh will apply the randomization procedure later.

### 4. Handle partial conversions
Not all questions from a single RS puzzle may be convertible. For example:
- **Nhanda example**: Some questions asked for translations (convertible), others asked for grammatical rules (not convertible). Only the translation questions were converted.

Convert what you can; skip what you can't. Note any skipped questions in your file.

## File Format

### Convertible puzzle
```markdown
# Puzzle XX — [Language Name]

Source: [URL or reference to original puzzle]

## Match-Up Table

| # | Target Language | Letter | English |
|---|----------------|--------|---------|
| 1 | [phrase]        | a      | [translation] |
| 2 | [phrase]        | b      | [translation] |
| 3 | [phrase]        | c      | [translation] |
...

## Notes
[Any comments on the conversion, partial skips, or unusual decisions]
```

### Non-convertible puzzle
```markdown
# Puzzle XX — [Language/Name] [SKIP]

Source: [URL or reference]

## Reason for skipping
[Brief explanation of why this puzzle cannot be meaningfully converted to Match-Up format]
```

## File Naming

- Convertible: `puzzle_XX_<language>.md`
- Skipped: `puzzle_XX_SKIP.md`

Place files in your assigned folder under `conversions/`.

## Reference Examples

See the `Rosetta_to_MatchUpManyProblems_examples` file in the shared Google Drive for worked examples with commentary.
