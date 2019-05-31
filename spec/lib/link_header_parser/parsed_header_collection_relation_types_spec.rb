describe LinkHeaderParser::ParsedHeaderCollection, '#relation_types' do
  subject(:parsed_header_collection) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { ['</1>; rel="next", </2>; rel="next", </3>; rel="next"'] }

  it 'returns an Array' do
    expect(parsed_header_collection.relation_types).to eq(['next'])
  end
end
