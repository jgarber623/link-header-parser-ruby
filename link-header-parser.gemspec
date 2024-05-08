# frozen_string_literal: true

require_relative "lib/link_header_parser/version"

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 3.0"

  spec.name          = "link-header-parser"
  spec.version       = LinkHeaderParser::VERSION
  spec.authors       = ["Jason Garber"]
  spec.email         = ["jason@sixtwothree.org"]

  spec.summary       = "Parse HTTP Link headers."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/jgarber623/link-header-parser-ruby"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"].reject { |f| File.directory?(f) }
  spec.files        += ["LICENSE", "CHANGELOG.md", "README.md"]
  spec.files        += ["link-header-parser.gemspec"]

  spec.require_paths = ["lib"]

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "#{spec.homepage}/tree/v#{spec.version}"
  }
end
