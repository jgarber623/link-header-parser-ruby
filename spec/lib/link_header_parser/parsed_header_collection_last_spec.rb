describe LinkHeaderParser::ParsedHeaderCollection, '#last' do
  subject(:parsed_header_collection) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { '</1>; rel="next", </2>; rel="next", </3>; rel="next"' }

  it 'returns a ParsedHeader' do
    expect(parsed_header_collection.last).to be_instance_of(LinkHeaderParser::ParsedHeader)
  end
end
