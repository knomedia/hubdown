# Hubdown

[![Gem Version](https://badge.fury.io/rb/hubdown.png)](http://badge.fury.io/rb/hubdown)

Hubdown is a ruby CLI for use as a replacement for `markdown`. It supports [GitHub flavored markdown](http://github.github.com/github-flavored-markdown/) syntax, and can style it's output to closely approximate that of GitHub as seen in project README.md files.

## Installation

To install `hubdown` run:

```bash
$ gem install hubdown
```

## Usage

There are essentially 3 options when using `hubdown`.

 * Printing to STDOUT
 * Wrap in Github HTML
 * Output to a file

***
### Printing to STDOUT

To convert github flavored markdown to html simply execute hubdown and pass it a valid markdown file:

```bash
$ hubdown my_file.md
```

Doing so will send converted markdown to standard output allowing you to pipe the file as you wish.
***
### Wrap in Github HTML

```bash
$ hubdown file.md -w
```

When passing the `-w` flag hubdown will render the markdown in an approximation of what Github provides and push it to STDOUT. See Scraping for CSS below.
***
### Output to a file

```bash
$ hubdown my_file.md -o my_file.html
```

When passing the `-o` flag with a file name, hubdown will write the full html output (as though you passed the `-w`) to the file you pass with `-o`. See Scraping for CSS below.
***
### Scraping for CSS
Note that when you use either the `-w` or `-o` flags, hubdown will use your network connection to scrap the currently used CSS from github.com. It will do it's best to cache that the results of that network call for future non-connected uses.

***

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
