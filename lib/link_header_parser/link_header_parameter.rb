# frozen_string_literal: true

module LinkHeaderParser
  class LinkHeaderParameter
    PARAMETER_REGEXP_PATTERN = /^(?<name>.+?)(?:="?(?<value>.*?)"?)?$/.freeze
    private_constant :PARAMETER_REGEXP_PATTERN

    # The +String+ value used to create this {LinkHeaderParameter}.
    #
    # @return [String]
    attr_reader :parameter

    # Create a new parsed Link header parameter.
    #
    # @param parameter [String, #to_str]
    def initialize(parameter)
      @parameter = parameter.to_str
    end

    # @return [String]
    def inspect
      "#<#{self.class.name}:#{format('%#0x', object_id)} " \
        "name: #{name.inspect}, " \
        "value: #{value.inspect}>"
    end

    # @see https://tools.ietf.org/html/rfc8288#appendix-B.3
    #   IETF RFC 8288 Web Linking Appendix B.3.2.9 Parsing Parameters
    #
    # @return [String]
    def name
      @name ||= parameter_match_data[:name].downcase
    end

    # @see https://tools.ietf.org/html/rfc8288#appendix-B.3
    #   IETF RFC 8288 Web Linking Appendix B.3.2.8 Parsing Parameters
    #
    # @return [String]
    def value
      @value ||= parameter_match_data[:value].to_s
    end

    # Return an +Array+ representation of this {LinkHeaderParameter}.
    #
    # @return [Array<String>]
    def to_ary
      [name, value]
    end

    alias to_a to_ary

    private

    def parameter_match_data
      @parameter_match_data ||= parameter.match(PARAMETER_REGEXP_PATTERN)
    end
  end
end
