# frozen_string_literal: true

RSpec.describe LinkHeaderParser::LinkHeadersCollection, "#inspect" do
  it "returns a String" do
    regexp = /^#<LinkHeaderParser::LinkHeadersCollection:0x[a-f0-9]+ headers: \[.*\], relation_types: \[.*\]>$/

    expect(described_class.new([%(</>; rel="home")], base: "https://example.com").inspect).to match(regexp)
  end
end
