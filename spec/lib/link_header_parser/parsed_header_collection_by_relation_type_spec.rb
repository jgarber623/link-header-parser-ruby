describe LinkHeaderParser::ParsedHeaderCollection, '#by_relation_type' do
  subject(:parsed_header_collection) { described_class.new(headers, base: 'https://example.com') }

  let(:headers) { '</1>; rel="next"' }

  it 'returns an OpenStruct' do
    expect(parsed_header_collection.by_relation_type.next.first).to be_instance_of(LinkHeaderParser::ParsedHeader)
  end
end
