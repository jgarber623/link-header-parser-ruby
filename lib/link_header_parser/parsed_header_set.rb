module LinkHeaderParser
  class ParsedHeaderSet
    include Enumerable

    attr_reader :headers

    def initialize(headers, base:)
      raise ArgumentError, "headers must be an Array (given #{headers.class})" unless headers.is_a?(Array)
      raise ArgumentError, "base must be a String (given #{base.class})" unless base.is_a?(String)

      @headers = headers
      @base = base
    end

    def inspect
      format(%(#<#{self.class.name}:%#0x @headers="#{headers.join(',').gsub('"', '\"')}">), object_id)
    end
  end
end
