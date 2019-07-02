# link-header-parser-ruby

**A Ruby gem for parsing HTTP Link headers.**

[![Gem](https://img.shields.io/gem/v/link-header-parser.svg?style=for-the-badge)](https://rubygems.org/gems/link-header-parser)
[![Downloads](https://img.shields.io/gem/dt/link-header-parser.svg?style=for-the-badge)](https://rubygems.org/gems/link-header-parser)
[![Build](https://img.shields.io/travis/com/jgarber623/link-header-parser-ruby/master.svg?style=for-the-badge)](https://travis-ci.com/jgarber623/link-header-parser-ruby)
[![Dependencies](https://img.shields.io/depfu/jgarber623/link-header-parser-ruby.svg?style=for-the-badge)](https://depfu.com/github/jgarber623/link-header-parser-ruby)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/jgarber623/link-header-parser-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/link-header-parser-ruby)
[![Coverage](https://img.shields.io/codeclimate/c/jgarber623/link-header-parser-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/link-header-parser-ruby/code)

## Getting Started

Before installing and using link-header-parser-ruby, you'll want to have [Ruby](https://www.ruby-lang.org) 2.4 (or newer) installed. It's recommended that you use a Ruby version managment tool like [rbenv](https://github.com/rbenv/rbenv), [chruby](https://github.com/postmodern/chruby), or [rvm](https://github.com/rvm/rvm).

link-header-parser-ruby is developed using Ruby 2.4.6 and is additionally tested against Ruby 2.5.5 and 2.6.3 using [Travis CI](https://travis-ci.com/jgarber623/link-header-parser-ruby).

## Installation

If you're using [Bundler](https://bundler.io), add link-header-parser-ruby to your project's `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'link-header-parser'
```

…and hop over to your command prompt and run…

```sh
$ bundle install
```

## Usage

With link-header-parser-ruby added to your project's `Gemfile` and installed, you may parse a URL's HTTP Link headers by doing:

```ruby
require 'http'
require 'link-header-parser'

response = HTTP.get('https://sixtwothree.org')

link_headers = response.headers.get('link')

collection = LinkHeaderParser.parse(link_headers, base: response.uri.to_s)
```

The `parse` method accepts two arguments:

1. an `Array` of strings representing HTTP Link headers (e.g. `['</>; rel="home"', '</chapters/1>; anchor="#copyright"; rel="license"']`)
1. a `String` representing the absolute URL of the resource providing the HTTP Link headers

In the example above, `collection` is an instance of `ParsedHeaderCollection` which includes Ruby's [`Enumerable`](https://ruby-doc.org/core/Enumerable.html) mixin. This mixin allows for use of common methods like `each`, `first`/`last`, and `map`.

For example, you could retrieve an array of `target_uri`s:

```ruby
puts collection.map(&:target_uri) # => ["https://assets.sixtwothree.org/", "https://fonts.googleapis.com/", "https://fonts.gstatic.com/", "https://sixtwothree.org/webmentions"]
```

### Working with a `ParsedHeaderCollection`

In addition to the included `Enumerable` methods, the following methods may be used to interact with a `ParsedHeaderCollection`:

#### The `relation_types` Method

```ruby
puts collection.relation_types # => ["preconnect", "webmention"]
```

#### The `by_relation_type` Method

Using the `collection` from above, the `by_relation_type` method returns an `OpenStruct` with the following attributes:

```ruby
{
  preconnect: [
    #<LinkHeaderParser::ParsedHeader @header="<https://assets.sixtwothree.org/>; rel=\"preconnect\"">,
    #<LinkHeaderParser::ParsedHeader @header="<https://fonts.googleapis.com/>; rel=\"preconnect\"">,
    #<LinkHeaderParser::ParsedHeader @header="<https://fonts.gstatic.com/>; rel=\"preconnect\"">
  ],
  webmention: [
    #<LinkHeaderParser::ParsedHeader @header="<https://sixtwothree.org/webmentions>; rel=\"webmention\"">
  ]
}
```

### Working with a `ParsedHeader`

You may interact with one or more `ParsedHeader`s in a `ParsedHeaderCollection` using the methods outlined below. The naming conventions for these methods draws heavily on the terminology established in [RFC-5988](https://tools.ietf.org/html/rfc5988) and [RFC-8288](https://tools.ietf.org/html/rfc8288).

#### Link Target ([§ 3.1](https://tools.ietf.org/html/rfc8288#section-3.1))

```ruby
link_headers = ['</index.html>; rel="home"']
parsed_header = LinkHeaderParser.parse(link_headers, base: 'https://example.com/').first

parsed_header.target     # => '/index.html'
parsed_header.target_uri # => 'https://example.com/index.html'
```

The `target` method returns a string of the value between the opening and closing angle brackets at the beginning of the Link header. The `target_uri` method returns a string representing the resolved URL.

#### Link Context ([§ 3.2](https://tools.ietf.org/html/rfc8288#section-3.2))

```ruby
link_headers = ['<https://example.com/chapters/1>; anchor="#copyright"; rel="license"']
parsed_header = LinkHeaderParser.parse(link_headers, base: 'https://example.com/').first

parsed_header.context     # => '#copyright'
parsed_header.context_uri # => 'https://example.com/chapters/1#copyright'
```

The `anchor` parameter's value may be a fragment identifier (e.g. `#foo`), a relative URL (e.g. `/foo`), or an absolute URL (e.g. `https://context.example.com`). The `context` method returns the `anchor` parameter's value (when present) and defaults to the `target` value.

#### Relation Type ([§ 3.3](https://tools.ietf.org/html/rfc8288#section-3.3))

```ruby
link_headers = ['<https://example.com/chapters/1>; rel="prev start"']
parsed_header = LinkHeaderParser.parse(link_headers, base: 'https://example.com/').first

parsed_header.relations      # => 'prev start'
parsed_header.relation_types # => ['prev', 'start']
```

## Contributing

Interested in helping improve link-header-parser-ruby? Awesome! Your help is greatly appreciated. See [CONTRIBUTING.md](https://github.com/jgarber623/link-header-parser-ruby/blob/master/CONTRIBUTING.md) for details.

## Acknowledgments

link-header-parser-ruby is written and maintained by [Jason Garber](https://sixtwothree.org).

## License

link-header-parser-ruby is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
