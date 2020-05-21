describe LinkHeaderParser::LinkHeadersCollection, '#inspect' do
  subject(:link_header) { described_class.new(['</>; rel="home"'], base: 'https://example.com') }

  it 'returns a String' do
    expect(link_header.inspect).to match(/^#<LinkHeaderParser::LinkHeadersCollection:0x[a-f0-9]+ headers: \[.*\], relation_types: \[.*\]>$/)
  end
end
