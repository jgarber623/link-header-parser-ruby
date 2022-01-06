# frozen_string_literal: true

describe LinkHeaderParser::LinkHeader, '#inspect' do
  subject(:link_header) { described_class.new('</>; rel="home"', base: 'https://example.com') }

  it 'returns a String' do
    regexp = /^#<LinkHeaderParser::LinkHeader:0x[a-f0-9]+ target_uri: ".*", relation_types: \[.*\]>$/

    expect(link_header.inspect).to match(regexp)
  end
end
