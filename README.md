# This is the data for my blog

My blog can be found at [www.lee-dohm.com](http://www.lee-dohm.com). It is automatically transformed by [Jekyll](https://github.com/mojombo/jekyll) into a static site whenever I push this repository to GitHub.

## Workflow

1. Execute `rake draft title="Sample Title"` to create a draft article
1. Write, proofread and rewrite until satisfied
1. Execute `rake publish title="Sample Title"` to convert the draft into a post
1. Commit and push to the `source` branch
1. Execute `rake push` to generate the site content and push the updated content to the website

## License

The following directories and their contents are Copyright &copy; 2010-2014 by [Lee Dohm][lee-dohm]. You may not reuse anything therein without my permission:

* `_drafts/`
* `_posts/`

The theme used is [Twitter Bootstrap][bootstrap].

[bootstrap]: http://getbootstrap.com
[lee-dohm]: https://github.com/lee-dohm
