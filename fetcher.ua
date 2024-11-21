#!/usr/bin/env uiua

# ReqText ? Url
# MakeReqFor ← $"GET / HTTP/1.1\nHost: _\nConnection: close"
# 
# &args
# =3⊸⧻
# ⍤"Usage: fetcher.ua YEAR DAY\nExample: uiua run fetcher.ua 2024 1"
# 
# ⍣(∩◇⋕°⊟)"Year and day must both be numbers" ↘1
# $"https://adventofcode.com/_/day/_/input"
# 
# ⍜(&tlsc MakeReqFor|&rs∞⊸&w:)

#$ GET / HTTP/1.1
#$ Host: example.com
#$ Connection: close
#$ 
#$ 
#⍜(&tlsc "www.uiua.org/docs:443"|&rs∞⊸&w:)

#"https://adventofcode.com/2023/day/2/input"

"GET /2023/day/2/input HTTP/1.1\r\nHost: adventofcode.com\r\nConnection: close\r\n\r\n"
"adventofcode.com:443"
⍜&tlsc(&rs∞ ⊸&w:)

&p
