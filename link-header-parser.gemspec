require_relative 'lib/link_header_parser/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4', '< 2.8')

  spec.name          = 'link-header-parser'
  spec.version       = LinkHeaderParser::VERSION
  spec.authors       = ['Jason Garber']
  spec.email         = ['jason@sixtwothree.org']

  spec.summary       = 'Parse HTTP Link headers.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/jgarber623/link-header-parser-ruby'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|spec)/}) }
  end

  spec.require_paths = ['lib']

  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"

  spec.add_runtime_dependency 'absolutely', '~> 3.1'
end
