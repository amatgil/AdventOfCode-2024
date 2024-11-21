#!/usr/bin/env uiua

&args
=3⊸⧻
⍤"Usage: fetcher.ua YEAR DAY\nExample: uiua run fetcher.ua 2024 1"
# '2024' '1'
⍣(∩◇⋕°⊟)"Year and day must both be numbers" ↘1
$"https://adventofcode.com/_/day/_/input"
