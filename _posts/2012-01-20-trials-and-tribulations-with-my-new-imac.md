---
layout: post
title: Trials and Tribulations with My New iMac
tags: Geeky
date: 2012-01-20 09:29:00 -0700
---

I recently bought a new [iMac](http://www.apple.com/imac), making my conversion to The Dark Side complete. I got it almost completely tricked out. I was especially glad to get the SSD/HD combination. It's a 240GB SSD for the system drive and then a 1TB HD for whatever. The problem is that the way the system comes configured from the factory you would end up just using the SSD for everything unless you do some wizardry first. So I had to go and teach myself the wizardry through a couple failed attempts before I landed on what I believe, now, to be the proper solution.

### Form 1: Default Configuration

The default configuration from the factory makes the SSD the main drive where everything gets stored.  The system, all the applications, all the user folders, everything.  The problems with this configuration are that I have a 1TB drive that is now useless and the SSD is only 240GB.  This is big enough for a while and may even be big enough if I wanted to really watch my disk usage.  But the whole point is that I don't want to watch my disk usage!

### Form 2: Move /Users to HD

This is more like it!  So now I have the operating system, applications and such on the super-fast (but small) SSD and all my big fat user files like pictures and music and videos on the HD.  This is how I did it:

1. Create a Users directory on the HD (named "Macintosh HD 2" by default).
1. Copy the contents of `/Users` to the new Users directory.
1. Open System Preferences.
1. Select Users & Groups.
1. In the lower-left corner, click the lock to unlock and make changes.  (Authenticating as an administrator also, if necessary.)
1. Right-click on a user and select "Advanced Options...".
1. Where it says "Home Directory" click the Choose button and select the new directory in the new Users folder.  (This would be `/Volumes/Macintosh HD 2/Users/[username]` if everything is still on its defaults.)
1. Click Ok and repeat for the other users.

The problem I ran into with this configuration is that some stuff I use at the command line chokes on a home directory path that has spaces in it.  This led me to ...

### Form 3: Delete /Users and Create a Link

What the link does for you is that anything that looks for `/Users/Foo` gets sent to `/Volumes/Macintosh HD 2/Users/Foo` instead.  But it is all behind the scenes and isn't the wiser ... so it doesn't have a chance to choke on the spaces in the path.  This is how I did it:

1. Delete `/Users`.  (Not a big deal because everything was already pointing to the other drive.)
1. Open Terminal.
1. Type the command: `sudo ln -s /Users /Volumes/Macintosh\ HD\ 2/Users`

The nice thing about this is now `/Users and /Volumes/Macintosh HD 2/Users` were essentially indistinguishable.  But then I read [this article from MacWorld](http://www.macworld.com/article/1164891/keeping_mac_os_and_data_on_separate_drives.html) and learned of a weakness in my plan ...

### Form 4: Abandon the Link and Go Back to Form 2

The problem with this plan is exposed in the final paragraph of the article.  (Good thing I read the whole thing!)  What happens if at some point the HD dies?  The system could still boot because the SSD is working, but it can't because it doesn't have a way to log in as any valid user!  But how do I take the advice and still keep my command line stuff from choking on spaces?  Rename the drives!  I renamed "Macintosh HD" to "System" and "Macintosh HD 2" to "Data".  Then I had to delete the link and recreate the /Users directory.  Here's how I did that:

1. Open Terminal
1. Type the command: `sudo rm /Users`
1. Type the command: `sudo mkdir /Users`

Then I went in and created a new administrator user called `backupadmin` and left their home directory in the default `/Users` location.  Any other real users I create will have to be migrated to the HD by hand, but I think this will work best in the long run.
