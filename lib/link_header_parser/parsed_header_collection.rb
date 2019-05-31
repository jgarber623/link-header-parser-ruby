module LinkHeaderParser
  class ParsedHeaderCollection
    include Enumerable

    attr_reader :headers

    def initialize(*headers, base:)
      @headers = headers.flatten
      @base = base
    end

    def each
      return to_enum unless block_given?

      parsed_headers.each { |parsed_header| yield parsed_header }

      self
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