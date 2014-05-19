---
layout: post
title: Better Pairing Through Technology
tags: Coder
---

I've been hearing a lot about pair coding in general and remote pairing in specific. While I haven't had the chance to do it very much myself[^1], it is something I'm actually quite interested in and believe can be very useful. But one thing has always bugged me. When I hear other people talk about all the work that goes in to getting set up to pair and negotiating out what editor or editor configuration to use, keyboard layouts[^2] and other minutia, I figure there has to be a better way. So I figured I'd try to spec out what that better way looks like.

I think it should work essentially like the [Collabedit website][collabedit] where each person connected to the session can edit the document as they please and the server keeps track of it all. Other than slight network delays, it works really well in my experience. What I would like to see is some sort of server with an API that editors could write plugins against to allow for easy pairing no matter what editor, keyboard, operating system or other options the various participants choose. The API should offer:

* Authentication
    * SSH
    * OAuth
    * ID/Password?
* View Management
    * Synced &mdash; So all participants have the same position from the same file on screen at all times
    * Free &mdash; Different participants can work on different positions in the same file or different files, but with a "Jump To" option that will allow them to jump to the location of another participant
* Editing
    * Shared Copy/Paste/Undo &mdash; Might be a challenge to sync between editors that offer clipboard-style and editors that offer kill-ring-style copy/paste
    * Inserting and Deleting text
    * Selections &mdash; Should offer multiple selection support

But even if all we get is some sort of synchronized buffer and view without the shared clipboard or selections, I think this could be a huge improvement for pairing.

[^1]: Other than in a couple classes and other situations set up specifically for the purpose of learning how to pair.
[^2]: [Qwerty][qwerty] vs. [Dvorak][dvorak] vs. [Colemak][colemak]

[colemak]: https://en.wikipedia.org/wiki/Colemak#Colemak
[collabedit]: http://collabedit.com/
[dvorak]: https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard
[qwerty]: https://en.wikipedia.org/wiki/Qwerty
