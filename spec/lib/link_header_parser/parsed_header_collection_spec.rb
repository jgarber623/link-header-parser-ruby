describe LinkHeaderParser::ParsedHeaderCollection do
  context 'when headers is not an Array' do
    subject(:parsed_header_set) { described_class.new(1, base: 'https://example.com') }

    it 'raises an ArgumentError' do
      expect { parsed_header_set }.to raise_error(LinkHeaderParser::ArgumentError, 'headers must be an Array (given Integer)')
    end
  end

  context 'when base is not a String' do
    subject(:parsed_header_set) { described_class.new(['</>; rel="home"'], base: 1) }

    it 'raises an ArgumentError' do
      expect { parsed_header_set }.to raise_error(LinkHeaderParser::ArgumentError, 'base must be a String (given Integer)')
    end
  end
end
