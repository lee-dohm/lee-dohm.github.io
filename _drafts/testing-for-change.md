---
layout: post
title: Testing For Change
tags: Coder Tester
---

Recently, [Blizzard's][blizzard] [Diablo III][d3] in-game economy suffered a huge malfunction that was caused, presumably, by [an integer overflow bug][bug]. The basic rundown of the bug is this:

1. Create an auction of 6 billion gold.
1. Auction shows up as 1,705,032,704 gold with only that much deducted from your account.
1. Cancel the auction.
1. Find 6 billion gold refunded to your account.

And, as the meme goes, PROFIT!

[blizzard]: http://us.blizzard.com/en-us/
[bug]: http://pastebin.com/YYPM4uQK
[d3]: http://us.blizzard.com/en-us/games/d3/
