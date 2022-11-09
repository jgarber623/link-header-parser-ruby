# frozen_string_literal: true

require 'forwardable'

require_relative 'link_header_parser/version'

require_relative 'link_header_parser/link_header'
require_relative 'link_header_parser/link_header_parameter'
require_relative 'link_header_parser/link_headers_collection'

module LinkHeaderParser
  # Parse an array of HTTP Link headers.
  #
  # Convenience method for {LinkHeaderParser::LinkHeadersCollection#initialize}.
  #
  # @param (see LinkHeaderParser::LinkHeadersCollection#initialize)
  # @return (see LinkHeaderParser::LinkHeadersCollection#initialize)
  def self.parse(*headers, base:)
    LinkHeadersCollection.new(*headers, base: base)
  end
end
