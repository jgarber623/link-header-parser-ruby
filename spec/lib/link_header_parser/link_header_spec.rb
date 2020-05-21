describe LinkHeaderParser::LinkHeader do
  context 'when header is not a String' do
    subject(:link_header) { described_class.new(1, base: 'https://example.com') }

    it 'raises an ArgumentError' do
      expect { link_header }.to raise_error(LinkHeaderParser::ArgumentError, 'field_value must be a String (given Integer)')
    end
  end

  context 'when base is not a String' do
    subject(:link_header) { described_class.new('</>; rel="home"', base: 1) }

    it 'raises an ArgumentError' do
      expect { link_header }.to raise_error(LinkHeaderParser::ArgumentError, 'base must be a String (given Integer)')
    end
  end
end
