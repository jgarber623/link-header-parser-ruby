# frozen_string_literal: true

describe LinkHeaderParser::LinkHeader, '#inspect' do
  subject(:link_header) { described_class.new('</>; rel="home"', base: 'https://example.com') }

  it 'returns a String' do
    expect(link_header.inspect).to match(/
        ^#<LinkHeaderParser::LinkHeader:0x[a-f0-9]+\s
        target_uri: ".*",\s
        relation_types: \[.*\]>$
      /x)
  end
end
