require 'forwardable'
require 'ostruct'

require 'absolutely'

require 'link_header_parser/version'
require 'link_header_parser/exceptions'

require 'link_header_parser/parsed_header'
require 'link_header_parser/parsed_header_collection'

module LinkHeaderParser
  # Parse an array of HTTP Link headers
  #
  # @param headers [Array<String>]
  # @param base [String]
  # @return [ParsedHeaderCollection]
  def self.parse(*headers, base:)
    ParsedHeaderCollection.new(*headers, base: base)
  end
end
