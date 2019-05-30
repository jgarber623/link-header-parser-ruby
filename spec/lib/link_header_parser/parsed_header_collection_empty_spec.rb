describe LinkHeaderParser::ParsedHeaderCollection, '#empty?' do
  let(:headers) { ExampleLinkHeaders::EXAMPLE_LINK_HEADERS.first.first }
  let(:base_url) { 'https://example.com' }

  context 'when headers is an empty Array' do
    subject(:parsed_header_set) { described_class.new([], base: base_url) }

    it 'returns an Integer' do
      expect(parsed_header_set.empty?).to be(true)
    end
  end

  context 'when headers is a non-empty Array' do
    subject(:parsed_header_set) { described_class.new([headers], base: base_url) }

    it 'returns an Integer' do
      expect(parsed_header_set.empty?).to be(false)
    end
  end
end
