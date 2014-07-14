---
layout: post
title: Defaults and Options
tags: Coder
---

I've been spending a lot of time working in the community for the [Atom programmer's editor][atom], specifically being one of the moderators for [the official Atom discussion forum][discuss]. There are a couple concepts that come up over and over again in people's posts: "this should be the default" and "there should be an option for that". These discussions always make me a bit wary.

***Disclaimer: I am not an employee of GitHub nor a member of the Atom team. And even if I were, [the opinions I offer here are solely my own.][disclaimer]***

Before we get into what all this means, let me talk a bit about how Atom is constructed. Atom is a very small core of functionality around which one can build nearly any kind of customization you can imagine. In fact, much of the functionality of Atom is built as a series of packages:

<script async class="speakerdeck-embed" data-slide="45" data-id="d0b90260ea75013105d032d94af0cd2c" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

<br/>

All of the packages named there are included in the default installation of Atom. So nobody uses a completely bare installation of Atom with no packages whatsoever.

But Atom is designed to be customized even further by allowing the community of users to [build packages to share][packages]. As of this writing, I've created [11 of my own][my-packages] and I have 38 packages installed, over and above the ones that come with Atom. To be clear, while the number of additional packages I've installed may be higher than normal,[^1] having additional packages installed is the expected way of using Atom. It is "the hackable editor" after all.

And Atom makes installing packages super simple with methods for installing either from the Settings View within the editor or using the `apm` package utility at the command line. It is, by far, the most easily customized editor I've ever used.

On top of all of this, there are methods of customizing Atom without resorting to installing a package. Depending on what one wants to achieve, there are various configuration files:

* `config.cson` &mdash; For setting various configuration options
* `init.coffee` &mdash; For adding simple bits of code to Atom's runtime
* `keymap.cson` &mdash; For creating your own key bindings or overriding the defaults
* `snippets.cson` &mdash; For creating your own snippets
* `styles.less` &mdash; For customizing the appearance of Atom

But back to defaults and options ...

Even with all this easy-peasy customization, some people insist that Atom should work the way they want it to "by default" or "it should do X by default, but provide an option to do Y" ... where X is their way :laughing: Let's break them out into categories:

1. Don't want to install any additional packages other than what comes with Atom[^2]
2. Atom should do X where X is a feature that Atom doesn't yet provide
3. Atom should do X where X is a feature that Atom does provide, but

[^1]: Or it may not, I don't have access to the stats :laughing:
[^2]: Never mind that all it takes is one command to install *all* of your favorite packages if you've marked them as favorites using the `apm stars` command. You do have to execute that command at the command-line though, there is no way to install all your starred packages through the UI ... yet.

[atom]: https://atom.io
[disclaimer]: /disclaimer.html
[discuss]: http://discuss.atom.io
[packages]: https://atom.io/packages
[my-packages]: https://atom.io/users/lee-dohm/packages
