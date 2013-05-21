---
layout: post
title: Usage of Word-Style Boolean Operators in Ruby
tags: Coder Ruby
---

There has been some discussion around the various uses of `and` and `or` versus `&&` and `||` with regard to [RuboCop][rubocop] and the [Ruby Style Guide][style]. The original rule was to use the symbolic operators (`&&` and `||`) for Boolean expressions and use the word operators (`and` and `or`) for flow control. The problem, for RuboCop, is that it is impossible to automatically detect the difference between a Boolean expression and flow control in all or even a majority of the cases. But even for a style guide intended only for humans, I find the usage of the word operators problematic. Let's talk about how the various Boolean operators work first.

First of all, all of the Boolean operators in Ruby are short-circuit evaluators. In other words, they progress left-to-right (or are [left-associative][associativity] in formal terms) and only go as far as needed to determine the value of the expression. For example:

```ruby
def hello
  puts 'Hello'
end

# a equals nil and prints 'Hello'
a = true && hello

# b equals false
b = false && hello

# c equals true
c = true || hello

# d equals nil and prints 'Hello'
d = false || hello
```

In the cases where the expression can be evaluated by only looking at the left term, "Hello" is not printed.

[associativity]: http://en.wikipedia.org/wiki/Operator_associativity
[rubocop]: https://github.com/bbatsov/rubocop
[style]: https://github.com/bbatsov/ruby-style-guide
