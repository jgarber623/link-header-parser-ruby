# Changelog

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
