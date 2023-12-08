# frozen_string_literal: true

require "forwardable"

require_relative "link_header_parser/version"

require_relative "link_header_parser/link_header"
require_relative "link_header_parser/link_header_parameter"
require_relative "link_header_parser/link_headers_collection"

module LinkHeaderParser
  # Parse an array of HTTP Link headers.
  #
  # Convenience method for {LinkHeaderParser::LinkHeadersCollection#initialize}.
  #
  # @example
  #   require "net/http"
  #
  #   url = "https://sixtwothree.org"
  #   link_headers = Net::HTTP.get_response(URI.parse(url)).get_fields("Link")
  #
  #   LinkHeaderParser.parse(link_headers, base: url)
  #
  # @param (see LinkHeaderParser::LinkHeadersCollection#initialize)
  # @return (see LinkHeaderParser::LinkHeadersCollection#initialize)
  def self.parse(*headers, base:)
    LinkHeadersCollection.new(*headers, base: base)
  end
end
