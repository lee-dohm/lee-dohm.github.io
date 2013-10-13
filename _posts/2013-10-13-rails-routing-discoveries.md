---
layout: post
title: Rails Routing Discoveries
tags: Coder
date: 2013-10-13 09:33:09.504334000 -07:00
---

I've been working on a project using [Rails v4][rails] and ran into an interesting question about which there seems to be a lot of confusion. Rails has convenient helper functions for generating REST-style links: `*_path` and `*_url`. It seems everyone is clear on the fact that the `_path` version gives a relative path, whereas the `_url` version gives an absolute URL. The confusion lies in when is it appropriate to use which one? The general guidance is to use paths in views and urls in controllers ... but there isn't really an explanation for why. I found a [StackOverflow question][question] and [answer][answer] that seems to answer the question, but it didn't sound like a very confident answer and seemed to be based a bit on hearsay. So I decided to dig in and look at the various specifications and documentation and see if I couldn't figure it out for myself ...

From [this article][article] I found the guidance that there are two situations where one needs to use the absolute URL:

1. When redirecting to another page
1. When switching to or from SSL (`https` to `http` or vice versa)

Other than those two cases, using the relative path is fine. I'm going to skip over the SSL one because there seems to be plenty of agreement on that one.

In my earlier investigation I had already looked into the [HTTP protocol specification][specification] and found the [relevant section on redirects][redirects] and [the definition of the Location field][definition]. The specification does explicitly say that an absolute URI should be used. Most people seem to be hand-waving this away saying that "modern browsers understand" if you use a relative path, which is fine for them I guess. I don't like making a potential bug for myself later on by using undocumented features if I don't have to. So I kept looking to see if I couldn't find a definitive answer.

That's when I looked specifically at [the documentation for the Rails `redirect_to` method][redirect_to]. It states that the first parameter can take one of a few forms. There are actually two entries in that list regarding `String` objects:

* `String` starting with `protocol://` (like `http://`) or a protocol relative reference (like `//`) is passed straight through as the target for redirection
* `String` not containing a protocol - The current protocol and host is prepended to the string

And there is our answer. The Rails `redirect_to` method automatically converts our relative paths into absolute urls for the Location field in the redirect response.[^1] So we only need to use an absolute URL when changing protocols or when an absolute URL is truly needed (like a link in an email or something).

[^1]: As long as in your configuration the URL is just the path with the protocol and host prepended, but this is the default configuration so it will be the common case.

[answer]: http://stackoverflow.com/a/2350837/1954
[article]: http://viget.com/extend/rails-named-routes-path-vs-url
[definition]: http://tools.ietf.org/html/rfc2616#section-14.30
[question]: http://stackoverflow.com/q/2350539/1954
[rails]: http://rubyonrails.org/
[redirects]: http://tools.ietf.org/html/rfc2616#page-61
[redirect_to]: http://api.rubyonrails.org/classes/ActionController/Redirecting.html#method-i-redirect_to
[specification]: http://tools.ietf.org/html/rfc2616
