---
layout: post
title: My Backup System
date: 2019-10-11 14:20:50.869992000 -07:00
---

When [macOS Catalina][catalina] was released the other day, I set about backing up my main machine in preparation. Talking about it with coworkers, I mentioned the various layers of backups I have for my computers. They mentioned to me that they were impressed and confessed that they didn't have a similar system. The thing is, having the recommended system of backups isn't nearly as hard as it used to be and it can be, for the most part, completely automated.

Let's start with what the recommended set of backups is:

* **Three** copies of any piece of data
* On **two** different devices or media locally
* And **one** copy off-site

For example, if you have a file `test.txt` on your computer then you could:

* Back it up with macOS [Time Machine][time-machine] to an external drive
* Back it up to the cloud with a service like [Backblaze][backblaze]

This would give you three copies: the primary one, the Time Machine backup, and the Backblaze backup. The primary copy and the Time Machine copy would be on two separate devices, so if your computer dies, the external drive should still be good. But if your house burns down, you still have a copy on Backblaze.

I go one extra step further because I not only want to protect my data, but also get back up-and-running as quickly as possible if my computer dies. So my setup is:

* Time Machine to an external drive
* [SuperDuper!][super-duper] to create a clone of the entire drive to a different external drive
* Backblaze to back everything up offsite (including the SuperDuper clone)

Backblaze and Time Machine are automated by default. And SuperDuper has [a scheduling system][scheduling] that I use to schedule a complete backup starting at 3am on Saturday mornings.

In this way, I have everything backed up automatically so that I don't have to worry about it. The only time I have to do anything is when one of my backup systems notifies me of a problem, which is quite rare.

I hope this helps you keep your data safe!

[backblaze]: https://www.backblaze.com
[catalina]: https://www.apple.com/macos/catalina/
[scheduling]: https://s3.amazonaws.com/com.shirtpocket/SuperDuper/graphics/SuperDuper-Scheduling.png
[super-duper]: https://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html
[time-machine]: https://www.youtube.com/watch?v=geJiTXOb37w
