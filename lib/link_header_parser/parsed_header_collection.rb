module LinkHeaderParser
  class ParsedHeaderCollection
    include Enumerable

    attr_reader :headers

    def initialize(headers, base:)
      raise ArgumentError, "headers must be an Array (given #{headers.class})" unless headers.is_a?(Array)
      raise ArgumentError, "base must be a String (given #{base.class})" unless base.is_a?(String)

      @headers = headers
      @base = base
    end

    def each
      return to_enum unless block_given?

      parsed_headers.each { |parsed_header| yield parsed_header }

      self
    end

    def empty?
      @empty ||= length.zero?
    end

    def inspect
      format(%(#<#{self.class.name}:%#0x @headers=#{headers}>), object_id)
    end

    def last
      @last ||= parsed_headers[-1]
    end

    def length
      @length ||= parsed_headers.length
    end

    private

    def uniq_headers
      @uniq_headers ||= headers.map { |header| header.split(/,(?=[\s|<])/) }.flatten.map(&:strip)
    end

    def parsed_headers
      @parsed_headers ||= uniq_headers.map { |header| ParsedHeader.new(header, base: @base) }
    end
  end
end
