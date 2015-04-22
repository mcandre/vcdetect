# vcdetect - detect which version control software manages a file path

`vcdetect` identifies which version control program, if any, is managing a project directory.

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

$ vcdetect $HOME
/Users/andrew: unknown
```

# HOMEPAGE

https://github.com/mcandre/vcdetect

# RUBYGEMS

https://rubygems.org/gems/vcdetect

# ABOUT

vcdetect detects which version control software manages certain file paths.

Assumes version control data is stored on the file system in plain, unambiguous, per-project fashion. This precludes the ability to detect arcane and offbeat version control software such as cvsnt, svk, and vss.

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
