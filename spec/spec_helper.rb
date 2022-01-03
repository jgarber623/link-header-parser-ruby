# frozen_string_literal: true

require 'simplecov'

require 'link-header-parser'

module SpecFixtures
  module_function

  def example_link_headers
    source = File.read(File.join(Dir.pwd, 'spec', 'support', 'example_link_headers.json'))

    JSON.parse(source, symbolize_names: true)
  end

  def example_link_headers_with_anchors
    source = File.read(File.join(Dir.pwd, 'spec', 'support', 'example_link_headers_with_anchors.json'))

    JSON.parse(source, symbolize_names: true)
  end
end
