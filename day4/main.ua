# Experimental!
~ "git: github.com/amatgil/steal-gift" ~ AoCGet

# ====== INPUTS ======
Input ← AoCGet 2024 4

# ====== Shared ======

# ====== PART 1 ======
F               ← |1 >0+⊃(>0⌕"XMAS"|>0⌕"SAMX")
Diags           ← |1 ⌅(≡(⌝⤸ 0_0 ≡↻) ⊃(⇡⧻|¤)|⍥₅₉Diags)
FilterTrueDiags ← ≡(⨬(@\s|∘))⊞≥.⇡⊸⧻ ⇌↻1

Part₁ ← (
  ⊜∘ ⊸(≠@\n)
  ⊸(>0+++⊃(
      ⍜⍉F                            # Vertical
    | F                              # Horizontal
    | ⍜(Diags|F FilterTrueDiags)     # Major Diags
    | ⍜(Diags≡⇌|?F FilterTrueDiags?) # Minor Diags
    ))
  ⊃(◌≡(⨬(@.◌|∘)))(/+/+)
)

# ====== PART 2 ======
Part₂ ← 4◌

# ====== TESTS =======
$ MMMSXXMASM
$ MSAMXMSMSA
$ AMXSXMAAMM
$ MSAMASMSMX
$ XMASAMXAMM
$ XXAMMXXAMA
$ SMSMSASXSS
$ SAXAMASAAA
$ MAMMMXMMMM
$ MXMXAXMASX
⍤⤙≍ 18 Part₁
# ⍤⤙≍ "testout2" Part₂

# ======== RUNNING ========
# $"Part one solution is: '_'" Part₁ Input

# $"Part two solution is: '_'" Part₂ Input
