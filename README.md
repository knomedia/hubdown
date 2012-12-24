# Hubdown

Hubdown is a ruby CLI for use as a replacement for `markdown`. It supports [GitHub flavored markdown](http://github.github.com/github-flavored-markdown/) syntax, and can style it's output to closely approximate that of a GitHub as seen in project README.md files.

## Installation

To install hubdown run:

```bash
$ gem install hubdown
```

## Usage

To convert github flavored markdown to html simply execute hubdown and pass it a valid markdown file:

```bash
$ hubdown my_file.md
```

Doing so will send converted markdown to standard output allowing you to pipe the file as you wish.

```bash
$ hubdown my_file.md -o my_file.html
```

When passing the -o flag with a file name, hubdown will write the usual output (html) to the file you pass with -o.

```bash
$ hubdown file.md -p
```

When passing the -p flag hubdown will pass the output (as though it generated a file) to your default web browser for previewing.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
