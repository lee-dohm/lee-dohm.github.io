---
layout: post
title: 'Linguist for Atom: Evaluating Accuracy'
tags: Coder Linguist
date: 2015-01-11 14:03:23.572789000 -08:00
redirect_from: /2015/01/11/linguist-for-atom-evaluating-accuracy.html
---

In writing a version of Linguist for Atom, it is important to be able to evaluate whether we are making things better or worse. To do that, we need to have a system for creating a numeric representation of how accurate a language classification system is.

In designing this numeric system, it is important to take a look at what answers, both desirable and undesirable, we can get back from our classifier. Imagining that we have a list of languages that we can recognize `A` through `Z` and a default of plain text,[^plain-text] our classifier can give us the following answers:

* Language is X - Classifier answers X
* Language is X - Classifier answers something other than X
* Language is X - Classifier answers Unknown

We could take a very simplistic view and say that answer #1 is correct and all other answers are incorrect. This is simple to create a numeric rating for, we simply use what most people think of when they think of the term "accuracy" and use the percentage of correct answers. So if our classifier gets 42 out of 100 correct, then it is 42% accurate.

But this doesn't take into account that in some cases there is a wrong answer that is no big deal and a wrong answer that has negative implications. In medical testing, [binary classification][binary-classification] systems are often used to determine if a patient has (a positive result which we'll call `P`) or does not have (a negative result which we'll call `N`) a disease. Programmers will recognize that this fits neatly into a truth table:

<div class="row">
<div class="col-md-8 col-md-offset-2">
<table class="table table-bordered">
<tr><th>Patient</th><th>Test Result</th><th></th></tr>
<tr class="success"><td>P</td><td>P</td><td>Sick patient identified as sick or <strong>True Positive</strong></td></tr>
<tr class="danger"><td>P</td><td>N</td><td>Sick patient identified as healthy or <strong>False Negative</strong></td></tr>
<tr class="warning"><td>N</td><td>P</td><td>Healthy patient identified as sick or <strong>False Positive</strong></td></tr>
<tr class="success"><td>N</td><td>N</td><td>Healthy patient identified as healthy or <strong>True Negative</strong></td></tr>
</table>
</div>
</div>

Obviously, the **True Positive** and **True Negative** outcomes are the most desirable. But in medical testing, it isn't that simple because both of the incorrect answers can have significant implications for the patients that are trusting the results of the test. A **False Negative** can mean that a patient might put off life-saving treatments until it is too late. Even a **False Positive** can mean social stigma for a patient that is incorrectly identified as having a disease such as AIDS or syphilis.

Now, the medical classification systems are generally "binary" classifiers in that they are attempting to determine which of two possible answers to return, positive or negative. Our language classifier could return one of \\(n+1\\) answers with \\(n\\) being the number of languages our system can recognize.[^multiclass-classifiers] But there is still only one correct answer.[^one-answer] So how do we apply the system of True and False, Positive and Negative to our more nuanced system? I haven't found literature on this,[^literature] but this is the system I'll use:

* Identifies X as X &mdash; True Positive or Correct Identification
* Identifies X as not X &mdash; False Positive or Incorrect Identification
* Identifies X as Unknown &mdash; False Negative or No Identification

I could potentially add:

* Identifies Plain Text as X
* Identifies Plain Text as Unknown

But I think this would unnecessarily complicate things by requiring that I create a corpus of plain text files as well as the corpus of actual language files. And I don't think that it would provide a commensurate benefit in determining the accuracy of the classifier.

Now let's take a look at what these types of answers mean as far as their impact on the user experience in Atom:

* Correct Identification &rarr; Correct grammar loaded
* Incorrect Identification &rarr; Incorrect grammar loaded
* No Identification &rarr; Null grammar loaded

While both the null grammar and an incorrect grammar being loaded means the same corrective action is required of the user, to go to the grammar selection menu and select the correct one, the incorrect grammar being loaded means that it might *appear* that the correct grammar is loaded until the error is detected later. Later detection may be after extra frustration has been incurred by expected functionality not showing up or working, incorrect snippets being expanded, etc. This means to me that a Correct Identification result is good, an Incorrect Identification result is bad and a No Identification result is neutral. So I'll use the following point system:[^sat-points]

* Correct Identification = +1
* Incorrect Identification = **-1**
* No Identification = 0

So if our system is given 100 files to classify and it identifies 42 of them correctly, 23 of them incorrectly, and the rest it does not identify, this would come out to 42-23 = 19 points out of 100 or 19% accurate. This also means that a classifier implementation could have a negative accuracy. I think this is completely valid since it would mean that the implementation is giving an incorrect answer more often than a correct one, making it misleading like the car navigation system that tells you to drive off a cliff.

Once I have a couple of implementations to compare, a corpus of example source code files, and the list of correct answers for the entire corpus, I'll create a test harness to execute the tests and give the accuracy values in this format. I think the data will be interesting to analyze!

[^literature]: Though I confess to not looking too hard.
[^multiclass-classifiers]: These types of systems are referred to as "multiclass" classifiers.
[^one-answer]: While a file may contain [multiple languages][multiple-languages], as far as Atom is concerned there is only one grammar loaded to handle a particular file. So we need to concentrate on identifying the "primary" language in a file.
[^plain-text]: Atom considers plain text files to be the default. In the source code, the plain text grammar is referred to as the "null grammar". Despite this, there is actually a [plain text grammar][plain-text-grammar] that is loaded as the null grammar.
[^sat-points]: Anyone that has taken an SAT preparation course will recognize this kind of point system, where giving *no* answer is better for your ultimate score than giving an incorrect one.

[binary-classification]: https://en.wikipedia.org/wiki/Binary_classification
[multiple-languages]: https://discuss.atom.io/t/better-syntax-highlighting/7176
[plain-text-grammar]: https://github.com/atom/language-text
