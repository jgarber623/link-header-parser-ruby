# Changelog

> [!NOTE]
> From v6.0.0, changes are documented using [GitHub Releases](https://github.com/jgarber623/link-header-parser-ruby/releases). For a given release, metadata on RubyGems.org will link to that version's Release page.

## 5.1.1 / 2024-01-01

- RuboCop: Style/WordArray (7b5964f)
- RuboCop: Style/StringLiteralsInInterpolation (152a44c)
- Add source_code_uri to metadata (207db81)

## 5.1.0 / 2023-12-12

- Remove upper Ruby version constraint (#52) (f34716e)

## 5.0.1 / 2023-12-08

- Refactor test suite (7a9a446)
- Miscellaneous RuboCop updates (512efa5, cc36a1e, 025d150, 36f9cc1)
- Update RuboCop configuration (376cf8e)
- Update development Ruby to 2.7.8 (5ca0757)
- Remove Bundler ecosystem config from Dependabot (8bcacdf)
- Update RSpec configuration (afef67d, 83583a1)
- Remove `code-scanning-rubocop` and `rspec-github` gems (154fd95)

## 5.0.0 / 2022-11-09

- **Breaking change:** Add `#to_ary`/`#to_a` method to `LinkHeadersCollection` (6a478ed)
  - Note: marking this as a breaking change since it changes the existing behavior to return an `Array` of `Hash`es instead of an `Array` of `LinkHeader`s
- **Breaking change:** Update project Ruby version to 2.7.6 and minimum Ruby version to 2.7 (1e9df45)
- Improve documentation and privatize constants (8a68aa0)
- Remove Reek development dependency (423bc7a)
- Use ruby/debug gem instead of pry-byebug (4cd9d26)

## 4.0.0 / 2022-01-06

- Remove Addressable dependency (daedf22)
- **Breaking change:** Update minimum Ruby version to 2.6 (e2343ed)
- Migrate to GitHub Actions (509b2c4)
- Update project Ruby version to 2.6.10 (c39bc66)

## 3.0.0 / 2021-05-22

- Add implicit type conversion methods, alias explicit methods, and update specs (d132535)
- Remove exceptions module (249d77c)
- Use implicit conversions instead of type checking in methods (628c01b)
- Replace Absolutely dependency with Addressable (beb5188)
- Update project Ruby version to 2.5.9 (4a3941f)

## 2.2.0 / 2021-04-02

- Expand supported Ruby versions to include 3.0 (7187878)

## 2.1.0 / 2020-10-07

- Update Absolutely dependency to 5.0 (62988c0)

## 2.0.0 / 2020-05-21

- **Breaking changes:** Rewrite gem code (5351010)
  - `LinkHeaderParser.parse` returns `LinkHeadersCollection`
  - New classes: `LinkHeadersCollection`, `LinkHeader`, and `LinkHeaderParameter`
  - Renamed collection's `by_relation_type` method to `group_by_relation_type`
- **Breaking change:** Update project Ruby version to 2.5.8 and minimum Ruby version to 2.5 (05b2e82)
- Update inline documentation and refactor `ParsedHeader` and `ParsedHeaderCollection` classes (31ec43e)

## 1.0.0 / 2020-05-14

- Update Absolutely dependency to 4.0 (4b78347)
- Update development Ruby version to 2.4.10 (8d26096)
- Move development dependencies to `Gemfile` (3f6b5dd)

## 0.3.0 / 2020-01-20

- Expand supported Ruby versions to include 2.7 (c55624a)

## 0.2.0 / 2019-07-02

- Add support for the `anchor` parameter to `ParsedHeader` exposed via `context` and `context_uri` methods (d2dff52)

## 0.1.0 / 2019-06-06

- Initial release!
