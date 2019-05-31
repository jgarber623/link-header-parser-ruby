describe LinkHeaderParser::ParsedHeaderCollection, '#inspect' do
  subject(:parsed_header) { described_class.new(['</>; rel="home"'], base: 'https://example.com') }

  it 'returns a String' do
    expect(parsed_header.inspect).to match(/^#<LinkHeaderParser::ParsedHeaderCollection:0x[a-f0-9]+ @headers=\[.*\]>$/)
  end
end
