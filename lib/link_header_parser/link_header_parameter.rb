module LinkHeaderParser
  class LinkHeaderParameter
    PARAMETER_REGEXP_PATTERN = /^(?<name>.+?)(?:="?(?<value>.*?)"?)?$/.freeze

    attr_reader :parameter

    # @param parameter [String]
    def initialize(parameter)
      @parameter = parameter.to_str
    end

    def inspect
      format(%(#<#{self.class.name}:%#0x name: #{name.inspect}, value: #{value.inspect}>), object_id)
    end

    # @see https://tools.ietf.org/html/rfc8288#appendix-B.3 (Appendix B.3.2.9)
    #
    # @return [String]
    def name
      @name ||= parameter_match_data[:name].downcase
    end

    # @see https://tools.ietf.org/html/rfc8288#appendix-B.3 (Appendix B.3.2.8)
    #
    # @return [String]
    def value
      @value ||= parameter_match_data[:value].to_s
    end

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
