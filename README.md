# This is the data for my blog

My blog can be found at [www.lee-dohm.com][lee-dohm]. It is automatically transformed by [Jekyll][jekyll] into a static site whenever I push this repository to GitHub.

## Installation

1. Install [Ruby][ruby]
1. Install [Bundler][bundler]
1. Clone the repository
1. Check out the `source` branch
1. Execute `bundle`
1. PROFIT

## Workflow

### Articles

1. Execute `rake draft title="Sample Title"` to create a draft article
1. Write, proofread and rewrite until satisfied
1. Execute `rake publish title="Sample Title"` to convert the draft into a post
1. Commit and push to the `source` branch
1. Execute `rake push` to generate the site content and push the updated content to the website

### Links

1. Execute `rake link title="Sample Title" url="http://www.example.com"` to create the link post
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
