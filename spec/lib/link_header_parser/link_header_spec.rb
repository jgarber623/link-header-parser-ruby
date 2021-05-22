describe LinkHeaderParser::LinkHeader do
  context 'when header is not a String' do
    subject(:link_header) { described_class.new(1, base: 'https://example.com') }

    it 'raises a NoMethodError' do
      expect { link_header }.to raise_error(NoMethodError)
    end
  end

  context 'when base is not a String' do
    subject(:link_header) { described_class.new('</>; rel="home"', base: 1) }

    it 'raises a NoMethodError' do
      expect { link_header }.to raise_error(NoMethodError)
    end
  end
end
