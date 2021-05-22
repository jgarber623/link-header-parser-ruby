require 'forwardable'

require 'addressable/uri'

require 'link_header_parser/version'
require 'link_header_parser/exceptions'

require 'link_header_parser/link_header'
require 'link_header_parser/link_header_parameter'
require 'link_header_parser/link_headers_collection'

module LinkHeaderParser
  # Parse an array of HTTP Link headers
  #
  # @param headers [Array<String>]
  # @param base [String]
  # @return [LinkHeaderParser::LinkHeadersCollection]
  def self.parse(*headers, base:)
    LinkHeadersCollection.new(*headers, base: base)
  end
end
