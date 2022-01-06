# frozen_string_literal: true

module LinkHeaderParser
  class LinkHeadersCollection
    extend Forwardable

    include Enumerable

    def_delegators :members, :[], :<<, :each, :last, :length, :push

    attr_reader :headers

    # @param headers [Array<String>]
    # @param base [String]
    def initialize(*headers, base:)
      @headers = headers.to_ary.flatten.map(&:to_str)
      @base = base.to_str

      distinct_headers.each { |header| push(LinkHeader.new(header, base: base)) }
    end

    # @return [Hash{Symbol => Array<LinkHeaderParser::LinkHeader>}]
    def group_by_relation_type
      relation_types.to_h do |relation_type|
        [relation_type.to_sym, select_by_relation_type(relation_type)]
      end
    end

    # @return [String]
    def inspect
      "#<#{self.class.name}:#{format('%#0x', object_id)} " \
        "headers: #{headers.inspect}, " \
        "relation_types: #{relation_types.inspect}>"
    end

    # @return [Array<String>]
    def relation_types
      @relation_types ||= flat_map(&:relation_types).uniq.sort
    end

    private

    attr_reader :base

    def distinct_headers
      @distinct_headers ||= headers.flat_map { |header| header.split(/,(?=[\s|<])/) }.map(&:strip)
    end

    def members
      @members ||= []
    end

    def select_by_relation_type(relation_type)
      select { |member| member.relation_types.include?(relation_type) }
    end
  end
end
