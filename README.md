# This is the data for my blog

My blog can be found at [www.lee-dohm.com][lee-dohm]. It is automatically transformed by [Jekyll][jekyll] into a static site whenever I push this repository to GitHub.

## Common Tasks

This project follows the [GitHub "scripts to rule them all" pattern](http://githubengineering.com/scripts-to-rule-them-all/). The contents of the `scripts` directory are scripts that cover all common tasks:

* `script/setup` &mdash; Performs first-time setup
* `script/server` &mdash; Launches the web server

Other scripts that are available but not intended to be used directly by developers:

* `script/bootstrap` &mdash; Used as a building-block for several of the above scripts

## Workflow

### Articles

1. Execute `rake draft title="Sample Title"` to create a draft article
1. Write, proofread and rewrite until satisfied
1. Execute `rake publish title="Sample Title"` to convert the draft into a post
1. Commit and push to the `source` branch
1. Execute `rake push` to generate the site content and push the updated content to the website

### Links

1. Execute `rake draft title="Sample Title"` to create the link post
1. Change the `layout` field to `link`
1. Add an `address` field with the URL
1. Edit the body text
1. Commit and push to the `source` branch
1. Execute `rake push` to generate the site content and push the updated content to the website

## License

The following directories and their contents are Copyright &copy; 2010-2015 by [Lee Dohm][lee-dohm]. You may not reuse anything therein without my permission:

* `_drafts/`
* `_images/`
* `_posts/`

The theme used is [Twitter Bootstrap][bootstrap].

[bootstrap]: http://getbootstrap.com
[bundler]: http://bundler.io
[jekyll]: http://jekyllrb.com
[lee-dohm]: https://github.com/lee-dohm
[ruby]: http://ruby-lang.org
