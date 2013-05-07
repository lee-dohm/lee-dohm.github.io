---
layout: post
title: Test Case 'Asplode
tags: Coder
published: false
---

In my day job as a tester, in a meeting I was recently asked by the Dev Manager what I would concentrate on testing of a new feature that had a bunch of developer tests already written.  The developers were confident that it was pretty well tested and I had confidence in the skills of the developers on the job.  I was certain that they had done a decent job of making sure that the code worked.  But that's not what testers get paid to do.  I told them I would concentrate on failure modes first and then work my way back to success cases.  At first, the developers were incredulous.  Why would I spend most of my time on making sure that the code didn't work?  I answered simply that I was pretty comfortable that they had done a good job of testing most if not all of the ways the code could work, but it was often the ways that the code that could break that a developer didn't test.

And let me tell you, code can break in many more ways than it can work ...

But first, let me start by showing how even seemingly simple code can have more test cases than most people not trained or experienced as testers typically imagine.  This is actually a favorite interview question of a colleague of mine and was used to put me through the wringer when I interviewed for my first job as a tester after working for over a decade as a developer.  Simply put:

> Write as many test cases as you can for the following C function:

```c
int copyFile(char *source, char *dest);
```

> The function copies the file from the path passed in the source parameter to the path supplied in the dest parameter.  It returns one on success and zero on failure.

Let's see how many we can find ...

So the obvious test case that hopefully everyone would test is that the source and destination are valid, the file gets copied and a one is returned.  But what about if source or destination aren't valid?  How many ways could they not be valid?  Well the easy ones are:

* Empty string
* NULL pointer
* String that is not NULL terminated
* Improperly allocated pointer

Already we have, if we are to count exhaustively, twenty-five test cases.  This is one test case for every possible combination of the five possibilities we've identified for each of the two parameters.  Of course, as an experienced software developer would point out, we probably don't need to test all twenty five because if the source parameter is invalid then it shouldn't matter what we supply for the destination parameter, the function should fail, gracefully.  But this still makes nine test cases, one test case for each invalid parameter type per parameter and one successful test case where both parameters are valid.

Let's go a little further.  Let's say that real strings are passed.  Can they still be invalid parameters to this function?  You betcha ...

* Path contains an invalid character
* Path is too long
* Path does not exist
* Path contains a sequence of characters that are invalid (for example, two colons on Windows)

This gives us another eight test cases, bringing the total to seventeen.  Fine, let's say that we're passing real strings with valid contents.  What about then?

* File permissions (reading from a file we don't have read permission, writing to a file we don't have write permission)
* Read-only media (CD-ROM, write-protected floppy)
* Disk is full
* Removable media is removed* (was never in the drive to begin with, not mounted, unmounted or removed while the copy is in process, etc)

This brings us to at least twenty-two test cases.  And all we've really done is just check various combinations of parameters for success or failure.  Also, I've extremely simplified some of these test cases.  Depending on how low-level this function is, I might need to test various combinations of file permissions such as the combination of user- versus group-level permissions or admin-level permissions that override simple read- or write-permissions.

-----

* Depending on how your operating system handles these error cases, any of these may or may not be a distinct test case from the "Path does not exist" test case.
