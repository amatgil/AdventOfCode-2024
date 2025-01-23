# Experimental!
~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 6

# ====== Shared ======
Guards           ← "^>v<"
GuardPos         ← |1 ⊢⊚∊Guards                     # pos ? board
DeltaOf          ← ⍣(¯1_0°@^|0_¯1°@<|1_0°@v|0_1°@>) # delta ? guard
RemoveGuard      ← ⍜⊡⋅@.                            # board ? pos board
WhatNext         ← ⨬(2|⍣(⊗:".#"⊡|2)) ⊸(≥₀/×)        # ? pos board, 0=normal, 1=obs, 2=oob
RotatedGuardIcon ← ⍜(⊗:Guards|◿₄ +₁)                # rotguard ? guard
AdvGuard         ← ⍜⊡◌ ⊃(+|⋅⍜⊡⋅@.|⋅⊡)               # ? delta pos board
RotGuard         ← ⍜⊙⊡⊙◌ ◡(RotatedGuardIcon⊡)       # ? pos board
Next ← (
  ⊸GuardPos
  ◡(WhatNext+)◡(DeltaOf⊡)
  ⨬(AdvGuard|RotGuard◌|∞)
)
PushNext    ← ⍜°⊂[⊸Next]                           # [advboards] ? [boards]
HaveRepeats ← ⍣(0◌⊢⊚|1) ≡⌞≍ °⊂                     # ? boards
KeepGoing   ← ↧ HaveRepeats                        # boards keepgoing
DoesItLoop  ← ◌⍢(⍣(PushNext|⊙⋅0)|KeepGoing) ⊙1 [∘] # stack: boards keepgoing
SetSubtr    ← ▽⊸(¬∊) ¤                             # A-B ? A B

Visualize ← ≡(▽⟜≡▽4 layout12) # [imgs] ? [boards]

# ====== PART 1 ======
Part₁ ← /+>₀♭/+≡(∊ Guards) ⇌[◌⍢(⊸Next|¬≍∞)] ⊜∘⊸≠@\n
# Part1View ← Visualize ⇌[◌⍢(⊸Next|¬≍∞)] ⊜∘⊸≠@\n

# ====== PART 2 ======
Part₂ ← (
  ⊜∘⊸≠@\n
  ⊸⊃(GuardPos|♭₋₁⇡△)
  SetSubtr
  /+ ≡(DoesItLoop ⍜⊡⋅@# ?₁) ⊙¤
)

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
# ⍤⤙≍ 41 Part₁ .
⍤⤙≍ 6 Part₂

# ======== RUNNING ========
# 𝄈$"Part one solution is: '_' (_s)" ⍜nowPart₁ Input

$"Part two solution is: '_'" Part₂ Input
