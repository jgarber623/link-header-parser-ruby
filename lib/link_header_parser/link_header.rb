module LinkHeaderParser
  class LinkHeader
    FIELD_VALUE_REGEXP_PATTERN = /^\s*<\s*(?<target_string>[^>]+)\s*>\s*(?<parameters>;\s*.*)$/.freeze
    PARAMETERS_REGEXP_PATTERN = /(?<!;)\s*([^;]+)/.freeze

    attr_reader :field_value

    # Create a new parsed Link header
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2
    #
    # @param field_value [String]
    # @param base [String]
    def initialize(field_value, base:)
      @field_value = field_value.to_str
      @base = base.to_str
    end

    # The context URL for this Link header extracted from field_value (or target URL if no context URL is present)
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2 (Appendix B.2.2.11)
    #
    # @return [String]
    def context_string
      @context_string ||= grouped_link_parameters[:anchor]&.first || target_string
    end

    # The resolved context URL for this Link header
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2 (Appendix B.2.2.12)
    #
    # @return [String]
    def context_uri
      @context_uri ||= Addressable::URI.join(target_uri, context_string).normalize.to_s
    end

    def inspect
      format(%(#<#{self.class.name}:%#0x target_uri: #{target_uri.inspect}, relation_types: #{relation_types.inspect}>), object_id)
    end

    # The parsed parameters for this Link header extracted from field_value
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.3
    #
    # @return [Array<LinkHeaderParser::LinkHeaderParameter>]
    def link_parameters
      @link_parameters ||= field_value_match_data[:parameters].scan(PARAMETERS_REGEXP_PATTERN).flatten.map { |parameter| LinkHeaderParameter.new(parameter) }
    end

    # The relations_string value returned as an Array
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2 (Appendix B.2.2.10 and Appendix B.2.2.17.1)
    #
    # @return [Array<String>]
    def relation_types
      @relation_types ||= relations_string.split.map(&:downcase)
    end

    # The relation types for this Link header extracted from field_value
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2 (Appendix B.2.2.9)
    #
    # @return [String]
    def relations_string
      @relations_string ||= grouped_link_parameters[:rel]&.first || ''
    end

    # The target URL for this Link header extracted from field_value
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2 (Appendix B.2.2.4)
    #
    # @return [String]
    def target_string
      @target_string ||= field_value_match_data[:target_string]
    end

    # The resolved target URL for this Link header
    # @see https://tools.ietf.org/html/rfc8288#appendix-B.2 (Appendix B.2.2.8)
    #
    # @return [String]
    def target_uri
      @target_uri ||= Addressable::URI.join(base, target_string).normalize.to_s
    end

    # @return [Hash{Symbol => String, Array, Hash{Symbol => Array}}]
    def to_h
      {
        target_string: target_string,
        target_uri: target_uri,
        context_string: context_string,
        context_uri: context_uri,
        relations_string: relations_string,
        relation_types: relation_types,
        link_parameters: grouped_link_parameters
      }
    end

    private

    attr_reader :base

    def field_value_match_data
      @field_value_match_data ||= field_value.match(FIELD_VALUE_REGEXP_PATTERN)
    end

    def grouped_link_parameters
      @grouped_link_parameters ||= link_parameters.map(&:to_a).group_by(&:shift).transform_keys(&:to_sym).transform_values(&:flatten)
    end
  end
end
