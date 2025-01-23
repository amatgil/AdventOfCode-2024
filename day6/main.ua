# Experimental!
~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 6

# ====== Shared ======
# "eboard" means "empty board"(no guard)
Guards      ← |0 "^>v<"                           # ?
GuardPos    ← |1 ⊢⊚∊Guards                        # pos ? board
DeltaOf     ← |1 ⍣(¯1_0°@^|0_¯1°@<|1_0°@v|0_1°@>) # delta ? guard
RemoveGuard ← |2 ⍜⊡⋅@.                            # board ? pos board
RotGuard    ← |1 ⍜(⊗:Guards|◿₄+₁)                 # rotguard ? guard
UnRotGuard  ← |1 ⍜(⊗:Guards|◿₄-₁)                 # rotguard ? guard
UndoAdv     ← |2.2 -: ⊙⊸DeltaOf
# WhatNext    ← ⨬(2|⍣(⊗:".#"⊡|2)) ⊸(≥₀/×)         # ? pos board, 0=normal, 1=obs, 2=oob

SetSubtr ← ▽⊸(¬∊) ¤ # A-B ? A B

# pos dir ? pos dir eboard
NextFrame ← |3.2 (
  +⊙⊸DeltaOf   # possiblepos dir eboard
  ◡(≍ @# ⊡ ⊙◌) # Should we rotate?
  ⨬(∘|⊃(⊙◌UndoAdv|⋅RotGuard))
  ⊙⊙◌ # delete eboard
)

# ====== PART 1 ======
Part₁ ← (
  ⊜∘⊸≠@\n
  ⟜⊃(⊡|RemoveGuard) ⊸GuardPos             # pos dir eboard
  ⊙⊙⊙1                                    # "keep going?"
  [⋅⋅⋅⋅◌⍢(⍣(⤚∩₄∘ ⊸NextFrame|⊙⊙⊙⋅0)|⋅⋅⋅∘)] # pos dir eboard kg
  ⧻◴
)

# ====== PART 2 ======

# ====== TESTS =======
# Input here
$ ....#.....
$ .........#
$ ..........
$ ..#.......
$ .......#..
$ ..........
$ .#..^.....
$ ........#.
$ #.........
$ ......#...
Part₁
# ⍤⤙≍ 41
# ⍤⤙≍ 6 Part₂

# ======== RUNNING ========
# 𝄈$"Part one solution is: '_' (_s)" ⍜nowPart₁ Input

# $"Part two solution is: '_'" Part₂ Input
