module LinkHeaderParser
  class ParsedHeaderCollection
    include Enumerable

    attr_reader :headers

    def initialize(*headers, base:)
      @headers = headers.flatten
      @base = base
    end

    def by_relation_type
      @by_relation_type ||= OpenStruct.new(mapped_relation_types)
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

    def relation_types
      @relation_types ||= parsed_headers.map(&:relation_types).flatten.uniq.sort
    end

    private

    def find_all_by_relation_type(relation_type)
      find_all { |parsed_header| parsed_header.relation_types.include?(relation_type) }
    end

    def mapped_relation_types
      @mapped_relation_types ||= relation_types.map { |relation_type| [relation_type, find_all_by_relation_type(relation_type)] }.to_h
    end

    def uniq_headers
      @uniq_headers ||= headers.map { |header| header.split(/,(?=[\s|<])/) }.flatten.map(&:strip)
    end

    def parsed_headers
      @parsed_headers ||= uniq_headers.map { |header| ParsedHeader.new(header, base: @base) }
    end
  end
end
