# frozen_string_literal: true

module LinkHeaderParser
  class LinkHeadersCollection
    extend Forwardable

    include Enumerable

    def_delegators :members, :[], :<<, :each, :last, :length, :push

    # The +Array+ of HTTP Link headers used to create this
    # {LinkHeadersCollection}.
    #
    # @return [Array<String>]
    attr_reader :headers

    # Parse an array of HTTP Link headers.
    #
    # @param headers [Array<String, #to_str>]
    # @param base [String, #to_str]
    def initialize(*headers, base:)
      @headers = headers.to_ary.flatten.map(&:to_str)
      @base = base.to_str

      push(*distinct_link_headers)
    end

    # Retrieve a +Hash+ of this collection's {LinkHeader}s grouped by their
    # relation type(s).
    #
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

    # Retrieve a unique sorted +Array+ of this collection's {LinkHeader}
    # relation types.
    #
    # @return [Array<String>]
    def relation_types
      @relation_types ||= flat_map(&:relation_types).uniq.sort
    end

    # @see LinkHeader#to_hash
    #
    # @return [Array<Hash>}>]
    def to_ary
      map(&:to_hash)
    end

    alias to_a to_ary

    private

    attr_reader :base

    def distinct_link_headers
      headers.flat_map { |header| header.split(/,(?=[\s|<])/) }
             .map { |header| LinkHeader.new(header.strip, base: base) }
    end

    def members
      @members ||= []
    end

    def select_by_relation_type(relation_type)
      select { |member| member.relation_types.include?(relation_type) }
    end
  end
end
