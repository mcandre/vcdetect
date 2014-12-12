# vcdetect - detect which version control software manages a file path

# HOMEPAGE

https://github.com/mcandre/vcdetect

# RUBYGEMS

https://rubygems.org/gems/vcdetect

# ABOUT

vcdetect detects which version control software manages certain file paths.

Assumes version control data is stored on the file system in plain, unambiguous, per-project fashion. This precludes the ability to detect arcane and offbeat version control software such as cvsnt, svk, and vss.

# EXAMPLES

```
$ vcdetect examples/larry/
examples/larry/: hg

$ vcdetect examples/moe/
examples/moe/: svn

$ vcdetect examples/curly/
examples/curly/: cvs

$ vcdetect examples/curly/README.md 
examples/curly/README.md: cvs

$ vcdetect ~
/Users/andrew: unknown
```

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 1.9+

# INSTALL

Install via [RubyGems](http://rubygems.org/):

```
$ gem install vcdetect
```

# LICENSE

FreeBSD

# DEVELOPMENT

## Testing

Keep the code functioning:

```
$ rake test
```

## Linting

Keep the code tidy:

```
$ rake lint
```

## Git Hooks

See `hooks/`.
