describe LinkHeaderParser::ParsedHeaderCollection, '#length' do
  let(:headers) { ['</1>; rel="next", </2>; rel="next", </3>; rel="next"'] }
  let(:base_url) { 'https://example.com' }

  context 'when headers contains single Link headers' do
    subject(:parsed_header_collection) { described_class.new(*headers, base: base_url) }

    it 'returns an Integer' do
      expect(parsed_header_collection.length).to eq(3)
    end
  end

  context 'when headers contains combined Link headers' do
    subject(:parsed_header_collection) { described_class.new(headers.join(','), base: base_url) }

    it 'returns an Integer' do
      expect(parsed_header_collection.length).to eq(3)
    end
  end
end
