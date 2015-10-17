---
layout: post
title: "Common Testing Mistakes: Testing Code That Isn't Yours"
date: 2015-10-16 22:42:31.824694000 -07:00
---

A phase that it seems all people learning to write tests for their code go through, myself included at one point, is "falling down the test rabbit hole". During this phase the new tester believes that the only truly valid test is a test that validates that absolutely everything happens the way that it is expected. There are a couple problems with this approach, one is that you're doing work with no reward and the other is that it can make your tests more brittle, in other words less resilient in the face of change. So the rabbit-hole tester creates tests that have no benefit and yet can have a significant cost in maintenance.

Let's take for example that we have a typical web application that performs your standard CRUD[^1] actions on database records of some sort. We need to test that when someone goes to the website, presses the "New Record" button, fills in the form and presses "Save" that the appropriate new record is created. The rabbit-hole tester might suggest that we need to test:

* That the table in the database has a new record
* That the new record in the database has the expected ID
* That the new record in the database has the expected values in the expected columns

This is testing code that isn't yours because you're no longer verifying that your code works, you're verifying that the database works.[^2] The problem with the three rabbit-hole tests above is that it tests things that:

1. We don't actually care about
1. If the implementation details change, our tests will break until they are updated for the new implementation

So how do we properly test this? We test that the *application* behaves the way we expect:

* That we can query for the record and find it
* That the record we find has the values we expect

The key is to perform your verifications at the same level of abstraction as the component that you're testing. [Sandi Metz][metz] has a [great presentation about this][magic-tricks-of-testing] that describes simple rules to know when you are testing at the correct level.

When one first starts testing, it seems like the right thing to do is to test everything. This doesn't achieve the real goal of tests, to allow one to confidently change things and know that you aren't breaking them. When you test everything, you make it so nothing can be changed without breaking some test. Testing only your code and not anyone else's helps your tests ensure your code's reliability and also its flexibility.

[^1]: CRUD is an acronym for "Create, Read, Update, and Delete", the standard set of database actions.
[^2]: And that isn't your job. Testing that the database works is the database developer's job.

[magic-tricks-of-testing]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf
[metz]: http://www.sandimetz.com/
