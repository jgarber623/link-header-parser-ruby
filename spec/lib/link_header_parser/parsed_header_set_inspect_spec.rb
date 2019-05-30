describe LinkHeaderParser::ParsedHeaderSet, :inspect do
  subject(:parsed_header) { described_class.new(['</>; rel="home"'], base: 'https://example.com') }

  it 'returns a String' do
    expect(parsed_header.inspect).to match(/^#<LinkHeaderParser::ParsedHeaderSet:0x[a-f0-9]+ @headers=\[.*\]>$/)
  end
end
