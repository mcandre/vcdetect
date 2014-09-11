# vcdetect - detect version control software for file paths

# HOMEPAGE

https://github.com/mcandre/vcdetect

# RUBYGEMS

https://rubygems.org/gems/vcdetect

# ABOUT

vcdetect detects which version control software manages certain file paths.

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
/Users/andrew: none
```

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 2+

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
