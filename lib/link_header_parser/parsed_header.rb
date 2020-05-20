module LinkHeaderParser
  class ParsedHeader
    attr_reader :header

    # @param header [String]
    # @param base [String]
    def initialize(header, base:)
      raise ArgumentError, "header must be a String (given #{header.class})" unless header.is_a?(String)
      raise ArgumentError, "base must be a String (given #{base.class})" unless base.is_a?(String)

      @header = header
      @base = base
    end

    # @see https://tools.ietf.org/html/rfc8288#section-3.2
    #
    # @return [String]
    def context
      @context ||= parameters.anchor || target
    end

    # @return [String]
    def context_uri
      @context_uri ||= Absolutely.to_abs(base: target_uri, relative: context)
    end

    # @return [String]
    def inspect
      format(%(#<#{self.class.name}:%#0x header: #{header.inspect}>), object_id)
    end

    # @return [OpenStruct]
    def parameters
      @parameters ||= OpenStruct.new(header_attributes)
    end

    # @return [Array, nil]
    def relation_types
      @relation_types ||= relations&.split || nil
    end

    # @see https://tools.ietf.org/html/rfc8288#section-3.3
    #
    # @return [String, nil]
    def relations
      @relations ||= parameters.rel || nil
    end

    # @see https://tools.ietf.org/html/rfc8288#section-3.1
    #
    # @return [String]
    def target
      @target ||= header_match_data[:target]
    end

    # @return [String]
    def target_uri
      @target_uri ||= Absolutely.to_abs(base: @base, relative: target)
    end

    # @return Hash{Symbol => String, Array, Hash{Symbol => String}, nil}
    def to_h
      {
        target: target,
        target_uri: target_uri,
        context: context,
        context_uri: context_uri,
        relations: relations,
        relation_types: relation_types,
        parameters: parameters.to_h
      }
    end

    private

    def header_attributes
      @header_attributes ||= header_match_data[:attributes].tr('"', '').split(';').map { |tuple| tuple.split('=').map(&:strip) }.sort.to_h
    end

    def header_match_data
      @header_match_data ||= header.match(/^<\s*(?<target>[^>]+)\s*>\s*;\s*(?<attributes>.*)$/)
    end
  end
end
