describe LinkHeaderParser, '.parse' do
  let(:base_url) { 'https://example.com' }

  context 'when headers is a list' do
    subject(:link_header_parser) { described_class.parse('</>; rel="home"', base: base_url) }

    it 'returns a ParsedHeaderCollection' do
      expect(link_header_parser).to be_instance_of(LinkHeaderParser::ParsedHeaderCollection)
    end
  end

  context 'when headers is an Array' do
    subject(:link_header_parser) { described_class.parse(['</>; rel="home"'], base: base_url) }

    it 'returns a ParsedHeaderCollection' do
      expect(link_header_parser).to be_instance_of(LinkHeaderParser::ParsedHeaderCollection)
    end
  end
end
