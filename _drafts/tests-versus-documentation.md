---
layout: post
title: Tests Versus Documentation
tags: Coder, Tester
---

As I said in my previous post, tests and documentation serve two different purposes. They are related, certainly, but they are not the same. So if they're related, can we establish a mapping between them? Let's take a look at an example and see what we can do ...

```ruby
def multiply(a, b)
  a * b
end
```

What is the contract here? The best we can tell without any documentation is that this chunk of code accepts two parameters and calls the `*` operator on them. But if we add some documentation (in YARD format):

```ruby
# Multiplies two numbers and returns the product.
#
# @param a Multiplicand of the expression.
# @param b Multiplyer of the expression.
# @return Product of `a` multiplied by `b`.
def multiply(a, b)
  a * b
end
```

We now know the intended high-level contract of the code. How would we test such a simple function? Let's come up with some test cases:

* `multiply(5, 5) == 25`
* `multiply(-5, 5) == -25`
* `multiply(5, -5) == -25`
* `multiply(-5, -5) == 25`
* `multiply(5, 0) == 0`
* `multiply(0, 5) == 0`
* `multiply(5, 1) == 5`
* `multiply(1, 5) == 5`
* etc

So, we've got eight test cases for a single line function. Did we cover the contract as described in the documentation? Not remotely. We didn't cover floating point numbers, what we expect with infinites, NaN, Complex or Rational parameters, let alone non-numerics like `'a' * 20`. But even if we limited ourselves to Fixnum parameters:

```ruby
# Multiplies two numbers and returns the product.
#
# @param [Fixnum] a Multiplicand of the expression.
# @param [Fixnum] b Multiplyer of the expression.
# @return Product of `a` multiplied by `b`.
def multiply(a, b)
  a * b
end
```

We *still* haven't covered anywhere near the entire contract space with tests because we haven't covered all possible combinations of the two Fixnum parameters. The problem space of any non-trivial contract is prohibitively expansive. So we use techniques such as "equivalency classes" and "boundary value analysis" to reduce the problem space to a manageable number of test cases ... which is how I covered a lot of multiplication with eight test cases.
