describe LinkHeaderParser::ParsedHeader do
  let(:base_url) { 'https://example.com' }

  context 'when header is not a String' do
    subject(:parsed_header) { described_class.new(1, base: base_url) }

    it 'raises an ArgumentError' do
      expect { parsed_header }.to raise_error(LinkHeaderParser::ArgumentError, 'header must be a String (given Integer)')
    end
  end

  context 'when base is not a String' do
    subject(:parsed_header) { described_class.new('</>; rel="home"', base: 1) }

    it 'raises an ArgumentError' do
      expect { parsed_header }.to raise_error(LinkHeaderParser::ArgumentError, 'base must be a String (given Integer)')
    end
  end

  ExampleLinkHeaders::EXAMPLE_LINK_HEADERS.each do |header, result|
    it "parses the Link header (#{header})" do
      parsed_header = described_class.new(header, base: base_url)

      expect(parsed_header.to_h).to include(result)
    end
  end
end
