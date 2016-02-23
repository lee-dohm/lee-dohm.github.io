---
layout: post
title: Using Project-Specific Gems Without Bundle Exec
date: 2015-01-29 08:34:14.619757000 -08:00
alias: 2015/01/29/using-project-specific-gems-without-bundle-exec.html
---

If you use Ruby a lot like I do, you've probably gone through at least a few steps of this cycle:

1. Ruby is awesome! :metal:
1. Now, I just need to figure out how to make it do more :cry:
1. RubyGems are awesome! :metal: They help me make Ruby do more!
1. But managing them is a pain :cry:
1. [Bundler][bundler] is awesome! :metal: It manages the Gems and their dependencies!
1. But I just need to figure out how to always use the right version when I'm working on a specific project that uses different versions than everything else :cry:
1. `bundle exec` is awesome! :metal: It loads the right versions of everything for the current project!
1. But it is a lot of typing for every command :cry:
1. Aliases are awesome! :metal: Now I only have to type `be rake` instead of `bundle exec rake`!
1. [Bundler binstubs][binstubs] are awesome! :metal: Now I only have to type `bin/rake` instead of `be rake` ... :confused:
1. Huh ... that isn't any better, as a matter of fact, that's more typing. *And* I have to remember to do the extra step of generating the binstubs for every project. Why bother in that case?

And that's where things stopped for me for a long time ... Until now! :metal: Ok, maybe I'm getting ahead of myself. Here's what I figured out recently ...

I've been slowly refining my [dotfiles project][dotfiles] using [Thoughtbot's dotfiles][thoughtbot-dotfiles] as a basis. There is a lot to grok in that collection of useful tools and settings and I've been taking my time figuring it out. One thing that I noticed, but didn't think much of was this little bit of code in the shell profile:

```bash
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
```

At least, until recently when I put two and two together. I remembered that I could use Bundler's binstubs, which, combined with this trick would allow me to type simply `rake` instead of `bin/rake` or even `be rake`. Assuming you already have a project that uses Ruby, RubyGems and Bundler, here's how:

1. Add the above `PATH` modification to your shell profile. Ensure that you execute it *after* utilities like [rbenv][rbenv] or [rvm][rvm].
1. From within your project directory:
    1. Execute `bundle binstub GEM`. For example: `bundle binstub rake`
    1. Execute `mkdir .git/safe`

Now, if you execute `which rake` you should see that it points to the newly-generated binstub instead of the globally-installed one. Party on dudes! :metal:

[binstubs]: http://bundler.io/v1.7/bundle_binstubs.html
[bundler]: http://bundler.io/
[dotfiles]: https://github.com/lee-dohm/dotfiles
[rbenv]: https://github.com/sstephenson/rbenv
[rvm]: http://rvm.io
[thoughtbot-dotfiles]: https://github.com/thoughtbot/dotfiles
