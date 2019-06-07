require 'ostruct'

require 'absolutely'

require 'link_header_parser/version'
require 'link_header_parser/exceptions'

require 'link_header_parser/parsed_header'
require 'link_header_parser/parsed_header_collection'

module LinkHeaderParser
  class << self
    def parse(*headers, base:)
      ParsedHeaderCollection.new(headers, base: base)
    end
  end
end
