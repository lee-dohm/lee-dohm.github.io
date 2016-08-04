---
layout: post
title: Files Are an Implementation Detail
tags: Coder Geeky
date: 2010-08-08 08:46:00.000000000 -07:00
redirect_from: /2010/08/08/files-are-an-implementation-detail.html
---

John C. Dvorak recently wrote that [the desktop gets no respect, and it should](http://www.pcmag.com/article2/0,2817,2367202,00.asp).  This column has been a source of discussion and disagreement between my friends since it made the rounds.  Leaving aside the whole "licensing" issue, what Mr. Dvorak nearly captures is the divide between what most people need to use computers for and what professionals need to use computers for.  He claims that the desktop can do things that appliances can't.  I disagree, one only needs to look at the [TiVo](http://en.wikipedia.org/wiki/TiVo) to see an example of an appliance that does things that one would once have needed a desktop computer to do or had to do manually.  But let me start by defining my terms ...

An [appliance](http://en.wikipedia.org/wiki/appliance), for the purposes of our discussion, is a device that performs a task or set of related tasks in a way that a user can learn to operate it by intuition or usage and hides most if not all implementation details from the user.  A refrigerator is an appliance because you don't need to know how it works in order to keep your food cold, you just open the door, stick something in and a few hours later it is cold.

A desktop computer is not an appliance because you need to learn aspects of how it operates in order to properly use it.  You need to know about files, folders, networks, programs and a whole lot more.  And the more the computer can do, the more you have to learn.  A desktop computer does not hide its implementation details.  As a matter of fact, its job is more to piece together various things that let you use the implementation details without hiding them.  Yes, you can plug in to a network nowadays without needing to know much about [TCP/IP](http://en.wikipedia.org/wiki/Tcp/ip), network protocols or the [OSI stack](http://en.wikipedia.org/wiki/OSI_stack).  But it doesn't keep that stuff from you either.  A refrigerator doesn't give you access to its compressor and let you tweak it.[^compressor]

Here's another point where I disagree with Mr. Dvorak.  The modern automobile *is* an appliance.  I don't need to know anything about how a car works in order to operate it.  I don't need to know about the transmission, the engine, or the brakes.  I just need to know that putting the car in `D` and pushing the accelerator makes it go.  I take my car to a mechanic to fix it, just like I have a professional come and fix the refrigerator if its broken.  It is only the American love affair with the automobile that has kept it so the average person still can get access to the engine and other internals.  And while I know more than many about how an automobile works, I have only the most basic grasp of newer automotive technology like anti-lock brakes and traction control.  Those are things that I have decided I don't need to understand, they just work.  That's the magic of an appliance, I don't need to know in order for it to work.

So let's take a look at what I believe computers are and should be evolving into, the modern photo camera.[^photo-vs-video]  You have the [point-and-shoot camera](http://en.wikipedia.org/wiki/Point-and-shoot_camera) for consumers and you have the [SLR](http://en.wikipedia.org/wiki/Single-lens_reflex_camera) camera for enthusiasts and professionals.  With the point-and-shoot camera, I don't need to know about [white balance](http://en.wikipedia.org/wiki/White_balance), [f-stop](http://en.wikipedia.org/wiki/F-stop) or any of a bunch of other technical aspects of photography.  I simply point it at what I want to take a picture of and click the button.  On the other end of the spectrum, there are the SLR cameras where I may not need to know those things in order to take a picture ... but it doesn't hide those things from me either.  The point-and-shoot camera is an appliance.  The SLR camera is not.

What does a general computing appliance look like?  Simply enough, it looks like the iPhone or iPad as far as the way it operates.  With these devices, you don't need to know about files or folders or networks.  You turn it on, download an app and perform a task.  Everything else is taken care of for you.  Does this mean you can't "calculate, with accuracy, the trajectory of a rocket shot to the moon, and the amount of fuel it needs to get there"?  Of course not, but you do need an app for that ... which someone else must have made for you.  Does it mean that you can't connect a Wacom tablet and do cool, unspecified things with Adobe Illustrator?  Well, for now, yes ... but the concept of a general computing appliance doesn't preclude this.  A general computing appliance is something for consumers and will hide the implementation details of how the computer works, but that doesn't mean it can't do powerful things or allow one to attach peripherals such as a Wacom tablet or a keyboard.

And here's where we get to files, the big argument amongst my friends was that files are the glue between applications that are never perfect.  A file allows one to take data that was created by one application that does part of the task I want to another application that allows me to finish the task.  The implicit fear is that on a general computing appliance, apps will turn into data islands that do not allow me to perform this kind of assembly-line workflow that the desktop PC has enabled since its inception.  If you look at the iPhone, this is mostly the case.  One app's data is not shared to any other apps, with the exception of some built-in applications like the camera and the photos app.

On Android, it is a different story.  Android has a system whereby one application can serve up its data to the rest of the device via a content provider system.  This allows any application on the device to integrate with the built-in contacts application, or the photo gallery application.  It allows new applications to serve new kinds of data and control how that data can be accessed or changed.  This system also does not resort to sharing files.  It is an OS-controlled communication protocol that allows an application to have its own data strongly protected but also affords sharing.  This type of system is what will allow for files and folders to truly become an implementation detail on consumer-level general computing appliances.

This is my idea of what the general computing appliance nirvana looks like from the user's perspective:

* A way to download, install and uninstall applications.
* A means of launching an application.
* A system whereby installed applications can notify the user of events.
* A means of switching between running applications and controlling what applications are running.
* A system of configuring the settings of applications.

Additionally, a general computing appliance should afford the following without the user having to be involved:

* Sharing of data between applications.
* Access to the device's peripherals.
* Other integration points between applications (a la Intents in Android).

And that's about it as far as a consumer is concerned.  This is the genius behind the iPhone and why I believe it will be considered revolutionary in the years to come.  It was the first true general computing appliance.

Where does this leave the desktop PC?  Should it get more respect or should it become the computing world's [Rodney Dangerfield](http://en.wikipedia.org/wiki/Rodney_Dangerfield)?  I partially agree with Mr. Dvorak here.  The traditional desktop PC will continue to have its place in the computing future.  But it will belong to enthusiasts and professionals, not to the consumer.  The people who are writing apps for consumer devices will use a desktop PC (or the future's version of it).  The people who are doing more free-form computing tasks will likely use a desktop PC, perhaps engineers or scientists or data miners, people who aren't performing the same task all the time.  I believe though that over time the set of people that use what we now call the desktop PC environment will shrink slowly but inevitably.  As operating systems evolve and developers begin to understand more of what people actually use computers for, we will be able to simplify more tasks to the level of an appliance.  It does not mean the end of the enthusiast or the professional, simply that one does not have to be an enthusiast or professional to get the benefit of the technology.

This is not something to be reviled, but something to be considered natural.  It is the march of progress.

[^compressor]: Other than the knob that just has some mysterious single-digit numbers on it or the never-explained "cold" and "colder" labels.
[^photo-vs-video]: As opposed to a camera used for video, which I feel still tend to be less on the appliance side.
