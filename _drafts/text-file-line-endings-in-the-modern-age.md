---
layout: post
title: Text File Line Endings in the Modern Age
tags: Coder
---

I've been contributing what time and cognitive effort I can to the [Rubocop][rubocop] project and, consequently, also the [Ruby Style Guide][style]. [An interesting discussion][discussion] came up around the admonition in the style guide to [use Unix-style line endings in all Ruby source code files][endings]. I wanted to talk about the things I found interesting in my investigation of this divisive issue.

Let's define the problem. All files have a logical structure of a series of zero or more bytes. Text files further refine this by having a logical structure of a series of zero or more lines, each made up of zero or more characters^1 and each line ends with a character intended to mark the end-of-line or `EOL`.^2 The problem is that different operating systems define how to encode the `EOL` character differently. Unix-based systems^3 encode the `EOL` character as the single byte `0A` representing the Line Feed or LF value in ASCII or Unicode. Windows encodes the `EOL` character as a pair of bytes `0D 0A`, the Carriage Return or CR value in ASCII or Unicode, followed by LF.^4 This fundamental disagreement in how to mark the logical separation between lines makes sharing text files between Unix-based systems and Windows systems problematic.

It had been a long time since I had looked at this at all and I had never worried about portability between Windows and Unix. So I decided to write a simple program and run some tests to determine how the different systems behaved. I wrote a program that opens itself for reading, reads all the lines, and prints the list of bytes making up each line to the screen:

{% gist 5745075 test.rb %}

I saved two versions of this program, one with Unix line endings and the other with Windows line endings, and ran each program on both Windows and OS X. What I found interesting is that on Windows, while the file stored on disk had `CRLF` at the end of each line, the stream of bytes emitted by the program only had `LF` at the end of each line. This means that Windows specifically strips the `CR` byte as it is reading in the file but leaves the `LF` byte intact. Could Windows' natural decoded representation of a text file be identical to the Unix system of encoding a text file?

I wanted to eliminate Ruby, with its Unix origins, as a source of possible error or misunderstanding. So I wrote and ran some PowerShell^5 code:

{% gist 5745075 gistfile1.ps1 %}

This script also emitted the same stream of bytes for both files, specifically stripping the `CR` character from each line.

-----

1. The distinction between characters and bytes is an important one. [Joel Spolsky explained it best][unicode].
1. It is also referred to as a "newline" character and is often represented in many programming languages as `\n`.
1. Unix-based systems include BSD Unix, Linux and OS X.
1. Often referred to collectively as `CRLF` and sometimes pronounced `/ker'l*f/`.
1. PowerShell is Microsoft's modern shell and scripting language for Windows.

[discussion]: https://github.com/bbatsov/rubocop/issues/250
[endings]: https://github.com/bbatsov/ruby-style-guide#source-code-layout
[rubocop]: https://github.com/bbatsov/rubocop
[style]: https://github.com/bbatsov/ruby-style-guide
[unicode]: http://www.joelonsoftware.com/articles/Unicode.html
