module LinkHeaderParser
  class ParsedHeaderCollection
    extend Forwardable

    include Enumerable

    def_delegators :members, :[], :<<, :each, :last, :length, :push

    attr_reader :headers

    # @param headers [Array<String>]
    # @param base [String]
    def initialize(*headers, base:)
      @headers = headers.flatten
      @base = base

      discrete_headers.each { |header| push(ParsedHeader.new(header, base: @base)) }
    end

    # @return [OpenStruct]
    def by_relation_type
      @by_relation_type ||= begin
        OpenStruct.new(
          each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |member, hash|
            member.relation_types.each { |relation_type| hash[relation_type] << member }
          end
        )
      end
    end

    def inspect
      format(%(#<#{self.class.name}:%#0x headers: #{headers.inspect}, relation_types: #{relation_types.inspect}>), object_id)
    end

    # @return [Array<String>]
    def relation_types
      @relation_types ||= flat_map(&:relation_types).uniq.sort
    end

    private

    def discrete_headers
      @discrete_headers ||= headers.flat_map { |header| header.split(/,(?=[\s|<])/) }.map(&:strip)
    end

    def members
      @members ||= []
    end
  end
end
