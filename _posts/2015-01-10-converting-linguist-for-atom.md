---
layout: post
title: Converting Linguist for Atom
tags: Coder Linguist
date: 2015-01-10 17:38:47.447217000 -08:00
---

One of the more interesting (but lesser known) bits of technology that [GitHub][github] has released upon the world is a library called [Linguist][linguist]. Linguist is used to determine the primary language in any programming source code file. It checks the file name, some basic heuristics and then resorts to [Bayesian classification][bayes] to get the list of candidates down to one and only one result. This would be very useful for Atom so that it could be hyper-accurate in its guess of what language someone is editing so that all of the grammar-dependent language features would work automatically.

The challenge here is that Linguist was designed to run as a server process using Ruby. It may take liberties with the amount of time taken and memory used that wouldn't be appropriate for use in Atom. But, in order for it to be usable in Atom in the first place, it needs to be converted to CoffeeScript.[^conversion] This is my plan for converting Linguist so that it can be used in Atom:

1. Create the bare-minimum implementation of Linguist in CoffeeScript as a Node module using Linguist's own data structures
1. Compare accuracy of Atom's current algorithm against atom-linguist
1. Compare performance of Atom's current algorithm against atom-linguist
1. Optimize performance, if necessary
1. Potentially rewrite Linguist's data structures to something more Atom-native[^avoid-yaml]
1. Update [first-mate][first-mate] to use atom-linguist

Perhaps this idea will consume too many resources for only marginal benefit over Atom's built-in algorithm. But I think this ability would be useful for Atom in too many places to not at least give it a shot. I'll be documenting each stage as they are completed and posting them here. I think it will be interesting reading as I discover how to profile and analyze JavaScript performance and memory usage. So stay tuned!

[^avoid-yaml]: Linguist uses [YAML][yaml] to store a lot of the metadata around known languages. Atom uses a similar, but incompatible, format called [CSON][cson]. There shouldn't be a need to have both libraries installed, so atom-linguist should use CSON.
[^conversion]: Why can't I just use the Ruby library? Because Atom has specifically avoided adding any dependencies on languages other than CoffeeScript and a few native-compiled libraries that are guaranteed to be available cross-platform. If I want to eventually include atom-linguist in Atom itself, then it needs to be a Node module.

[bayes]: https://en.wikipedia.org/wiki/Naive_Bayes_classifier
[cson]: https://www.npmjs.com/package/cson-safe
[first-mate]: https://github.com/atom/first-mate
[github]: https://github.com
[linguist]: https://github.com/github/linguist
[yaml]: http://www.yaml.org/
