---
layout: post
title: Why Markdown Should Be Used on All Message Boards
date: 2019-08-18 17:29:39.259976000 -07:00
---

Since the dawn of computers, there have been message boards. Whether they were called "bulletin board systems", "forums", or "message boards"; it was obvious that people wanted to be able to communicate with others who shared their interests no matter where they live in the world. As a matter of fact, innovation in the space of message boards continues even now: Facebook, Twitter, and even services like Instagram or Snapchat are iterations on the concept of message boards. But I want to talk mostly about the standard message board where people come to congregate around an interest, a group, a product, or some other subject; there are topics of discussion, and posts on topics.

## The problem

Over the decades, there have been a great number of systems for posting information in message boards. We first started with plain text, because that's all computers could display. But as things became more advanced and especially with the advent of the web, forum participants clamored for the ability to control the format of the posts they were authoring.

The earliest systems that offered this were ones that allowed you to add in snippets of HTML in your post. Originally, this was fine because most of the people writing in those early web forums were Internet enthusiasts who probably knew at least a little HTML. But as Ma and Pa, and eventually Grandma, started to explore, HTML was simply too complex, too obscure, too hard to type, and definitely too hard to read while you were composing for it to be usable for someone who didn't want to be at least a part-time web-developer. And it also didn't help that HTML could be used to do bad things to message boards or their participants if it wasn't scrubbed clean before displaying in a never-ending arms race.

After HTML, there were a few different efforts that fell into two broad categories: HTML-lite and rich-text editing. The systems that fall into the HTML-lite category are things like [BBCode][bbcode] that essentially "fix" one or two of HTML's drawbacks but are simply reimaginings of HTML intended to make it easier for normal people. The rich-text editing systems are essentially simplified word processors in a box on a website. They allow you to compose your post in a [WYSIWYG][wysiwyg] manner, formatting the text as you input it.

Most people would say that the rich-text editing systems solved the problem of making posting formatted text approachable for everyone. Unfortunately, it introduced at least a couple more: bad formatting, both intentionally and unintentionally.[^1] Essentially, because everyone can format their text any way they want they can, either intentionally or unintentionally, make their content hard or even annoying to read. Think of gigantic blinking red text calling the previous poster a loser.[^2]

So, to sum up, the various systems in the past exposed the following requirements for a system of easily formatting message board posts:

* Understandable to non-web-developers
* Memorable even when used occasionally
* Easy to type
* Can't be used to assault the eyes of other people, even accidentally

## Why is Markdown the answer?

Given these requirements, why do I say that all message boards should use Markdown? If you're not familiar with [Markdown][markdown], it is:

> ... a text-to-HTML conversion tool for web writers. Markdown allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid [HTML for display].

How does it do this? Well, it uses long-established conventions that have been used in plain text situations like email, chat rooms, and message boards. For example, this Markdown text:

```
Let's _emphasize_ an idea. Or should we make a **bold** statement? Or we could quote someone smart:

> May the forces of evil become confused on the way to your house.
>
> -- _George Carlin_

We can even make a list:

* Thing one
* Thing two
```

becomes this:

-----

Let's _emphasize_ an idea. Or should we make a **bold** statement? Or we could quote someone smart:

> May the forces of evil become confused on the way to your door.
>
> -- _George Carlin_

We can even make a list:

* Thing one
* Thing two

-----

These conventions became standardized because they were conceived of by people who were trying to convey the _idea_ of formatted text in a plain text world. And it was John Gruber's brilliant idea to take a [pave the cow path][cow-path] approach to the problem of making composing HTML-compatible formatted text memorable, understandable, and easy-to-type even for non-technical people.

And while that is enough to make Markdown pretty special already, what convinces me that Markdown should be the _lingua franca_ of formatted forum text is that while it makes the most common formatting tasks easy, it restricts people to a "sensible subset" of choices. With Markdown, you can't change the color of the text, you can't change the typeface, you can't change the size of the text arbitrarily, and because Markdown works very much like a well-designed word processor or desktop publishing [style sheet][style-sheet], everyone's text looks pretty much the same.

Why is it important that everyone's text look the same? On a message board, you want everyone's posts to be on an equal footing, to give _everyone_ a voice. Giving people the tools, through formatting, to distract attention away from others, to shout others down, contravenes the mission of message boards, which is to allow people from all around the world to communicate with each other. Additionally, it makes your message board a more pleasant place to visit because everything that the participants post looks like it belongs on the site since it shares the same cohesive visual style.

And like a well-designed style sheet, Markdown makes it easy to do standardized formatting that requires multiple steps in many rich-text editors. For example, headings, subheadings, sub-subheadings, and etc are often rendered in a different typeface, at different sizes, and using different weights than regular text. So what might be three separate steps in a rich text editor is achieved with the addition of a single character in Markdown:

```
# This is a Level One Header
```

And moreover, that level one header will look like everyone else's level one header with no effort expended on the part of forum participants.[^3]

Giving people the tools to communicate better, by making it easy and approachable to convey their idea in a way that others will understand and is a pleasure to read, **that** is what makes message boards even better and more effective. And Markdown makes it easy.[^4]

[^1]: Yet another arguable problem with rich-text editing in websites is that every website has a slightly different editing experience because it's the web and that means only the most basic of functionality is standardized.
[^2]: Ok, the [blinking part][blink-tag] is a thing of the past since it made a lot of people angry and has been widely regarded as a bad move.
[^3]: Some people believe that Markdown is designed primarily for software developers because many of these "macro" features that replace multiple formatting steps are things like rendering things in `monospace font` or "fenced code blocks" like what I used to display the sample Markdown text in this post. While it is true that Markdown has a couple features that are specifically designed for communicating software source code, all the rest of it is generally applicable to communicating about anything.
[^4]: If you want to put a WYSIWYG interface on top of Markdown or add extensions to Markdown for things like tables and footnotes, that's fine too. Keep in mind the goal of making things easy and giving everyone an equal voice.

[bbcode]: https://en.wikipedia.org/wiki/BBCode
[blink-tag]: https://en.wikipedia.org/wiki/Blink_element
[cow-path]: https://en.wikipedia.org/wiki/Desire_path
[markdown]: https://daringfireball.net/projects/markdown/
[style-sheet]: https://en.wikipedia.org/wiki/Style_sheet_(desktop_publishing)
[wysiwyg]: https://en.wikipedia.org/wiki/WYSIWYG
