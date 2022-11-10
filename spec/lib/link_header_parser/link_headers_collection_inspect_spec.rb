# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, '#inspect' do
  subject(:link_header) { described_class.new(['</>; rel="home"'], base: 'https://example.com') }

  it 'returns a String' do
    regexp = /^#<LinkHeaderParser::LinkHeadersCollection:0x[a-f0-9]+ headers: \[.*\], relation_types: \[.*\]>$/

    expect(link_header.inspect).to match(regexp)
  end
end
