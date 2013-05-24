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

In the cases where the expression can be evaluated by only looking at the left term, "Hello" is not printed. As a matter of fact, the only difference between the symbolic operators and the word operators is their precedence.

```ruby
def hello
  puts 'Hello'
end

# a equals true and prints 'Hello'
a = true and hello

# b equals false
b = false and hello

# c equals true
c = true or hello

# d equals false and prints 'Hello'
d = false or hello
```

The reason for the difference in the assigned values is because the symbolic operators evaluate like this:

```ruby
a = (true && hello)
```

And the word operators evaluate like this:

```ruby
(a = true) and hello
```

Which is what makes the word operators best for flow control operations. They come from Perl where writing something like this is common:

```perl
chdir('/etc') or die "Can't change directory";
```

In the above code, only if the `chdir` method fails is `die` called.

What I find problematic about this is that the word operators essentially can be used (with some difficulty) as replacements for the symbolic Boolean operators and also can be used as replacements for the more commonly used modifier versions of `if` and `unless`. The following two lines are equivalent:

```ruby
raise "An error occurred!" if error?
error? and raise "An error occurred!"
```

They both evaluate the `error?` method and then call `raise` if it returns `true`. For this use, I find the modifier `if` much more readable. The readability between `or` and modifier `unless` is a little bit more ambiguous:

```ruby
raise "An error occurred!" unless file.write("foo")
file.write("foo") or raise "An error occurred!"
```

In this case, they're both about equally readable with maybe the edge going to the `or` version because evaluation flows the same as the left-to-right reading order of the code.

[associativity]: http://en.wikipedia.org/wiki/Operator_associativity
[rubocop]: https://github.com/bbatsov/rubocop
[style]: https://github.com/bbatsov/ruby-style-guide
