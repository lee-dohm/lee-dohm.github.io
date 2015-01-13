---
layout: post
title: What is Code Coverage Good For?
tags: Coder Tester
date: 2015-01-13 02:15:08.596121000 -08:00
---

Code coverage is a software development metric that measures how much of your code is covered by your tests. There are a few different ways to calculate it, but the most basic just instruments your code so that when a line is executed, it is logged. Then you run your tests, parse the log and any line that wasn't executed is not covered by your tests. Simple right? Well, yes and no ...

The above style of code coverage is called "line" or "block" coverage because it covers code line-by-line or in blocks. It works great for straight-line code like this:

```ruby
def foo
  a = 42
  b = 17
  c = 23
  a * b * c
end
```

because it tracks which lines were executed. But if you run into code like this:

```ruby
def foo
  if x || y(x)
    bar && baz
  end
end
```

you can get 100% code coverage and still not test the entire function. How, you ask? Well, every modern programming language has some type of short-circuit Boolean evaluation, flow control mechanism or even strange parameter passing artifact that means sometimes an entire line isn't executed. For example, in the code block above if `x` is true then the function `y(x)` never gets called. The opposite is true of `bar` and `baz`. If `bar` is false, then `baz` is never evaluated. But in both cases, line coverage will count this block as 100% covered.

Now, we could solve this problem with "branch" or "arc" coverage. Branch coverage instruments code at a deeper level, ensuring that each and every path (or arc) through the code is covered. So in the block of code above there are 5 arcs:

1. `x` is true, `bar` is false
1. `x` is true, `bar` is true, `baz` is evaluated
1. `x` is false, `y(x)` is true, `bar` is false
1. `x` is false, `y(x)` is true, `bar` is true, `baz` is evaluated
1. `x` is false, `y(x)` is false

Now, if we only cover arc #1, line coverage would say that we have achieved 100% coverage. But as we can see, we've only achieved 20% coverage of the code paths.

Well, great! I'll just use arc coverage then! Except ... the vast majority of code coverage tools only provide line coverage. As a matter of fact, the only tool that I've ever used that provided branch or arc coverage is [a tool from Microsoft Research called "Magellan"][magellan], specifically for C/C++ code on Windows. Another problem with this level of code coverage is that it is harder to visualize, highlighting only the few characters on a line that haven't been covered.

And then, there's the Achilles heel of code coverage. It's right there in the opening paragraph. All code coverage tracks is that you've *executed* a line of code. It has no way of telling if you actually *tested* that line of code. For example:

```ruby
def mult(a, b)
  a / b
end

describe 'mult' do
  it 'multiplies two numbers' do
    product = mult(42, 69)
  end
end
```

:tada: 100% code coverage is achieved![^rspec]

Yes, the above examples are of obviously degenerate cases. But each and every one of these examples are simplifications of errors I saw in tests of production code. Production code that our code coverage tool insisted we had covered.

So what **is** code coverage good for? Code coverage is good for identifying areas of your code that are definitively **untested**. Is there a high-risk area of your application that isn't covered? Well, get on that! But code coverage can't tell you if any area of your code is **sufficiently** tested. For that, you'll still need to use your brain.

[^rspec]: If you're not familiar with Ruby's [RSpec][rspec], the test block there doesn't have a verification step. It executes the code, but does not validate that it returns the correct answer. And if the names of the function and test are to be believed, it *is* returning an incorrect answer.

[magellan]: http://research.microsoft.com/en-us/news/features/magellan.aspx
[rspec]: http://rspec.info/
