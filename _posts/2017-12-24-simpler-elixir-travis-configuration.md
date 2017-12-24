---
layout: post
title: Simpler Elixir Travis Configuration
date: 2017-12-24 08:23:32.232786000 -08:00
---

I've been playing around with building simple [Phoenix framework][phoenix] sites using [Elixir][elixir] lately. It's been a lot of fun really digging in and figuring out my own best practices as I go along. One of the obvious ones is setting things up so that all my tests can be run on [Travis][travis]. I found [an article][phoenix-framework-travis-ci] that described how to configure one's Phoenix project for Travis. But there was a part that always bugged me about it.

First, a bit about how Elixir applications work. It is common for Elixir applications to have a series of one or more configuration files. `config.exs` contains the default or global configuration. Optionally, there are three other configuration override files each for dev, test, and prod environments named `dev.exs`, `test.exs`, and `prod.exs` respectively. They override any defaults from `config.exs` in their respective environments. They do this by importing the environment-specific configuration into the global one (see the `import_config` line):

{% gist lee-dohm/90ce34920acfc378793a55185a5834b5 config.exs %}

which I think is a pretty cool system.

The part that bugged me about the article I linked above is that the standard Phoenix `test.exs` configuration is:

{% gist lee-dohm/90ce34920acfc378793a55185a5834b5 article-test.exs %}

We need to modify only one line of this configuration in order to make it work on Travis, line 16. If we set the database password to empty, it's all good. What the article suggests is to create [a separate `travis.exs` configuration][travis-config] that has all of the same information in it as `test.exs` with that one line changed. As someone who spent a number of years working in QA, this kind of duplication is a big red flag! Now if any line other than line 16 changes in `test.exs`, we have to remember to change it in `travis.exs` also. And we have to remember that line 16 is the "special" line that _should_ be different 😱

We already have a mechanism for overriding configuration values though, the same one we use in `config.exs` in every Phoenix application. So in my latest project, I rewrote my `test.exs` with line 22 added:

{% gist lee-dohm/90ce34920acfc378793a55185a5834b5 test.exs %}

This added line checks to see if it is being run in a CI environment, like Travis, and imports the `ci.exs` configuration file:

{% gist lee-dohm/90ce34920acfc378793a55185a5834b5 ci.exs %}

which overrides the one setting that we want changed. Additionally, if I later choose to have multiple CI environments for any reason, I can further extend this pattern to customize for Travis versus CircleCI or AppVeyor.

Elixir's ability to create domain-specific languages like the configuration language we see here is similar to Ruby's and it is [one of the main reasons I really enjoy both languages.][ruby-dsls] Being able to easily call standard Elixir code in the middle of what would typically be a simple data file is what separates a DSL like [Mix.Config][mix-config] from [JSON][json] or [YAML][yaml]. Leveraging that ability can save us a lot of heartache and manual labor in the long run.

[elixir]: https://elixir-lang.org/
[json]: https://www.json.org/
[mix-config]: https://hexdocs.pm/mix/Mix.Config.html#content
[phoenix-framework-travis-ci]: https://medium.com/@devenney/phoenix-framework-travis-ci-a46a0dbfecd7
[phoenix]: http://phoenixframework.org/
[ruby-dsls]: /2013/05/05/thoughts-on-why-ruby-is-awesome/#one-language-to-rule-them-all
[travis-config]: https://gist.github.com/lee-dohm/90ce34920acfc378793a55185a5834b5#file-article-travis-exs
[travis]: https://travis-ci.org/
[yaml]: http://yaml.org/
